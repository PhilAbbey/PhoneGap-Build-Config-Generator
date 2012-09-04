//global validation var, true = valid, false = invalid
var globalValidationStatus = true;
var accessDataArray = [];

$(document).ready(function(){
	
$('img').each(function() {
	$(this).css('border', '2px solid #ccc');
});
	
$('#providedaccess').val(JSON.stringify(accessDataArray)).css('display', 'none');
	
// By default, addAccess_btn will be disabled
$('#addAccess_btn').attr('disabled', 'disabled');
$('#accessTable').css('display', 'none');
	
$('#addAccess_btn').click(function() {
	openAccessModal();
});

function openAccessModal() {
	$('#domain').val('');
	$('#subdomains').val('');
	$('#browserOnly').val('');
	$('#domain').focus();
	$('#addAccessModal').modal('show');
}
	
$('#deny_all_access').change(function() {
	if($(this).val() === 'false') {
		openAccessModal();
	}
});

function removeAccessDomain(domain) {
	console.log(domain);
	console.log(accessDataArray);
	for(var i=0;i<accessDataArray.length;i++) {
		if(accessDataArray[i].origin==domain) {
			accessDataArray.splice(i,1);
		}
	}
	console.log(accessDataArray);	
}

// Bind click handler to dynamic table content
$('#accessTableBody').on('click', 'tr a', function() {
	removeAccessDomain($(this).attr('id'));
	$(this).parent().parent().fadeOut('slow', function() {

	});
	// attach data to element
	$('#providedaccess').val(JSON.stringify(accessDataArray));
	if(!accessDataArray.length) {
		$('#deny_all_access').val('true');
		$('#accessTable').css('display', 'none');
	}
});

$('#saveAccess_btn').click(function() {
	
	var thisDomain = $('#domain').val();
	var thisSubdomain = $('#subdomains').val();
	var thisBrowserOnly = $('#browserOnly').val();
	
	if(thisDomain.length) {
	
		if(!accessDataArray.length) {
			$('#accessTable').css('display', 'block');
		}
		
		accessDataArray.push({ origin: thisDomain, subdomains: thisSubdomain, browserOnly: thisBrowserOnly });
		
		// attach data to element
		$('#providedaccess').val(JSON.stringify(accessDataArray));
	
		
		var tableData = '<tr><td>' + thisDomain + '</td><td>' + thisSubdomain + '</td><td>' + thisBrowserOnly + '</td><td><a id="'+thisDomain+'" rel="remove" class="btn btn-small btn-danger" title="Remove the access specification for '+ thisDomain +'"><i class="icon-minus-sign icon-white"></i></a></td></tr>';
	
		$('#accessTableBody').append(tableData);
		
		// Enable the button to add another access point
		$('#addAccess_btn').removeAttr('disabled');
	
		$('#addAccessModal').modal('hide');
	
	} else {
		$('#domain').parent().parent().addClass('error');
	}
	
});

$('#cancelAccess_btn').click(function() {
	$('#addAccessModal').modal('hide');
	if(accessDataArray.length === 0) {
		$('#deny_all_access').val('true');
	}
});
	
// Does user want to import an existing file?
if($('#fileExists').val() === 'true') {
	$('#importFileModal').modal('show');
}
	
$('#cancelImport_btn').click(function() {
	$('#importFileModal').modal('hide');
});

$('#confirmImport_btn').click(function() {
	$('#importFileModal').modal('hide');
	$.ajax({
		type: 'POST',
		url: 'cfcs/configBuilder.cfc',
		data: {
			method: 'readConfig',
			fileContent: localFileContent
		},
		success: function(data) {
			var obj = $.parseJSON(data);
			
			// Firstly, set all of the permission options to false
			$.each($('.permissionSelector'), function() {						
				$(this).val('false');
			})
			
			$.each(obj, function(k, v) {
								
				// Add in the access details to the table (if present)
				if(k === 'providedaccess') {
					var parsed = $.parseJSON($.trim(v));
					
					if(parsed.length) {
					
						var tableRow = '<tr>';
						var thisDomain = '';
						
						$.each(parsed, function() {						
							tableRow += '<td>'+this.origin+'</td><td>'+this.subdomains+'</td><td>'+this.browserOnly+'</td><td><a id="'+this.origin+'" rel="remove" class="btn btn-small btn-danger" title="Remove the access specification for '+ this.origin +'"><i class="icon-minus-sign icon-white"></i></a></td></tr>';
						})
						
						accessDataArray = parsed;
						
						$('#accessTableBody').append(tableRow);
						$('#deny_all_access').val('false');
						
						$('#accessTable').css('display', 'block');
		
						// Enable the button to add another access point
						$('#addAccess_btn').removeAttr('disabled');
					
					}
				} // Now let's add the images
				 else if(k === 'icondata' || k === 'splashdata') {
					var parsedIcons = $.parseJSON($.trim(v));
					if(parsedIcons.length) {
						$.each(parsedIcons, function() {
							$('#' + this.image_element + '_img').attr('src', '../' + this.image_path);
							$('#' + this.image_element + '_path').val(this.image_path);
						})
					}
				} else {
					// Now we can loop over all elements to set the correct values
					$('#' + k).val($.trim(v));
				}
				
			});
		},
		error: function(error) {
			console.log('--- ooops, something went wrong ---');
			console.log(JSON.stringify(error));
		}
	});
});
	
// Set tabs
$('#maintab a, #advanced_tabs a, #icons_tabs a, #splash_tabs a').click(function (e) {
	e.preventDefault();
	$(this).tab('show');
});

// Set tooltip popovers
$(function (){ 
	$(".help_popovers").popover({placement: 'right', trigger: 'hover'});  
});

$('#save_btn').click(function() {
	if($('#fileExists').val() === 'true') {
		$('#confirmOverwriteModal').modal('show');
	} else {
		$('#configForm').submit();
	}
});


$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

$('#cancelOverwrite_btn').click(function() {
	$('#confirmOverwriteModal').modal('hide');
});

$('#confirmOverwrite_btn').click(function() {
	// Form processing here
	$('#confirmOverwriteModal').modal('hide');
	$('#configForm').submit();	
});

$('#closeMissingFields_btn').click(function() {
	$('#requiredFieldsModal').modal('hide');
});

//validation

//=========================TEXTFIELD VALUES==============================
	//textfields to validate in form	
	var itemsToValidate = $('input[type="text"],textarea');
//=========================TEXTFIELD VALUES==============================
	
	$.each(itemsToValidate,function(index,value){
		
 		$(value).blur(function() {if($("form").validationEngine('validateField', value)) {
 			$(value).parent().parent().addClass('error');
  			
 			var title	=	'Required Value';
 			var content = 	'Please complete this entry.';
 			
 			switch($(value).attr('id')) {
 				case 'author_email':
 					title	= 'Invalid Email';
 					content = 'Please provide a valid email address';
 				break;
 				case 'author_url':
 					title	= 'Invalid URL';
 					content = 'Please provide a valid URL';
 				break;
 				case 'version':
 					title	= 'Invalid App Version';
 					content = 'Please provide a valid URL';
 				break;
 				case 'versionCode':
 					title	= 'Must be a valid integer';
 					content = 'Please provide a valid URL';
 				break;
 			}

 			$(value).tooltip({placement: 'top', title: title, content: content, delay: { show: 100, hide: 100 }});
			$(value).tooltip('show');
			globalValidationStatus = false;
		}else{
			$(value).parent().parent().removeClass('error');
 			//$(value).tooltip('destroy');
			}
		});	
	});

//form styling


// Hide the tooltip if it is visible
$("input").focusin(function() {
	$(this).tooltip('destroy');
});

$("input").focusout(function() {
	$(this).tooltip('destroy');
});

//form submit

if ($('form').length != 0) {

	$('form').submit(function() {
		
		//reset validation ready for pre-form submit re-check
		globalValidationStatus = true;
		
		var requiredList = '';
		
		if ($('input[type="text"],textarea').length != 0) {
			//inputs - textfields
						
			$(itemsToValidate).each(function(inputCount,inputVal){
				if($("form").validationEngine('validateField', inputVal)) {
										
					$(inputVal).parent().parent().addClass('error');
  			
		 			var title	=	'Required Value';
		 			var content = 	'Please complete this entry.';
		 			
		 			switch($(inputVal).attr('id')) {
		 				case 'author_email':
		 					title	= 'Invalid Email';
		 					content = 'Please provide a valid email address';
		 				break;
		 				case 'author_url':
		 					title	= 'Invalid URL';
		 					content = 'Please provide a valid URL';
		 				break;
		 				case 'version':
		 					title	= 'Invalid App Version';
		 					content = 'Please provide a valid URL';
		 				break;
		 				case 'versionCode':
		 					title	= 'Must be a valid integer';
		 					content = 'Please provide a valid URL';
		 				break;
		 			}
					
					//$(inputVal).tooltip({placement: 'top', title: title, content: content, delay: { show: 500, hide: 1000 }});
					//$(inputVal).tooltip('show');
					
					var elementname = $(inputVal).parent().parent().children('label').html();
					requiredList += '<li>' + elementname + '</li>';					
					
					globalValidationStatus = false;
				}else{
					$(inputVal).parent().parent().removeClass('error');
 					//$(inputVal).tooltip('destroy');
				}
			});

				if(requiredList.length > 0) {
			
					$('#missingFieldsBody').html('<p>The following fields must be provided:</p><p><ul>' + requiredList + '</ul></p>');
					$('#requiredFieldsModal').modal('show');
					
				}
			
		}
		
		
								
			//final validation status check
			if(globalValidationStatus) {
				 	
				//console.log("true");									
				
			} else {
				//reset var!
				//console.log("false");				
				globalValidationStatus = true;
				return false;
			}

	});		
	
	
}


});