<cfsetting showdebugoutput="false" />
<cfparam name="showForm" 	type="boolean" default="true" />
<cfparam name="fileExists" 	type="boolean" default="false" />
<cfset objConfigHelper = new cfcs.configbuilder() />
<cfset showForm = true />
<cfset fileLocation = '#application.projectFolderLocation#/Config.xml' />
<cfif structKeyExists(form, "submit_configData")>
	<cfset formData = form />
	<cfset fileContent = objConfigHelper.createFileContent(formData) />
	<cffile action="write" file="#fileLocation#" output="#trim(fileContent)#" />
	<cfset showForm = false />
</cfif>
<!--- Check to see if a Config.xml file already exists --->
<cfif fileExists(fileLocation)>
	<cfset fileExists = true />
	<cffile action="read" variable="fileContent" file="#fileLocation#" />
	<script>
		var localFileContent;
		<cfoutput>
			var #toScript(fileContent, "localFileContent")#
		</cfoutput>
	</script>
</cfif>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>PhoneGap Build - Config.xml Generator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A tool to generate the Config.xml file required for the PhoneGap Build service.">
    <meta name="author" content="Matt Gifford">

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
	<style>
		.container { margin: 10px; }
		.savebutton { margin-bottom: 20px; }
	</style>
  </head>

  <body>

    <div class="container tabs-left">

		<cfif showForm>
			
		<button class="btn btn-large btn-primary savebutton" id="save_btn" type="button">Save File</button>
			
		<div class="tabs-left">

	  	<ul class="nav nav-tabs" id="maintab">
			<li class="active"><a href="#general_settings">General Settings</a></li>
			<li><a href="#advanced_settings">Advanced Settings</a></li>
			<li><a href="#app_icons">App Icons</a></li>
			<li><a href="#splash_screens">Splash Screens</a></li>
			<li><a href="#permissions">Permissions</a></li>
			<li><a href="#access">Access</a></li>
			<li><a href="#developer_info">Developer Info</a></li>
		</ul>
			
		<form id="configForm" name="configForm" class="form-horizontal" method="POST">
		
		<div class="tab-content">
		  <div class="tab-pane active" id="general_settings">
		  	
			<!--- START GENERAL SETTINGS FORM --->
			
			<div class="control-group">
				<label class="control-label" for="name">Name</label>
				<div class="controls">
			    	<input type="text" id="name" name="name" class="validate[required]" placeholder="Application Name" />
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Application Name" data-content="The name of the application."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="description">Description</label>
				<div class="controls">
					<textarea rows="3" id="description" name="description" class="validate[required]"></textarea>
			    	<!---<input type="text" id="description" name="description" class="validate[required]" placeholder="Application Description" />--->
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Application Description" data-content="A description for your application."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="id">App Id</label>
				<div class="controls">
			    	<input type="text" id="id" name="id" class="validate[required]" placeholder="App Id" />
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="App Id" data-content="The unique identifier for your application. To support all supported platforms, this must be reverse-domain name style (e.g. com.yourcompany.yourapp)"><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>

			<div class="control-group">
				<label class="control-label" for="version">App Version</label>
				<div class="controls">
			    	<input type="text" id="version" name="version" class="validate[required, custom[appVersion]]" placeholder="App Version" />
			    	<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="App Version" data-content="The version number of the application. Use a major/minor/patch style version, with three numbers, such as 0.0.1."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>

			<div class="control-group">
				<label class="control-label" for="versionCode">Version Code</label>
				<div class="controls">
			    	<input type="text" id="versionCode" name="versionCode" class="validate[custom[integer]]" placeholder="Version Code" />
			    	<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Version Code" data-content="An integer value that represents the version of the application code, relative to other versions."><i class="icon-question-sign icon-white"></i></a>
			    	<span class="help-block">An optional value that applies to Android only.</span>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="phonegap_version">PhoneGap Version</label>
				<div class="controls">
			    	<select id="phonegap_version" name="phonegap_version">
                        <option value="2.0.0" selected>2.0.0</option>
                        <option value="1.9.0">1.9.0</option>
                        <option value="1.8.1">1.8.1</option>
                        <option value="1.7.0">1.7.0</option>
						<option value="1.6.1">1.6.1</option>
						<option value="1.5.0">1.5.0</option>
						<option value="1.4.1">1.4.1</option>
						<option value="1.3.0">1.3.0</option>
						<option value="1.2.0">1.2.0</option>
						<option value="1.1.0">1.1.0</option>
                    </select>
			    	<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="PhoneGap Version" data-content="Your selected release of PhoneGap."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="orientation">Orientation</label>
				<div class="controls">
			    	<select id="orientation" name="orientation">
                        <option value="default" selected>Both</option>
                        <option value="landscape">Landscape</option>
                        <option value="portrait">Portrait</option>
                    </select>
			    	<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Orientation" data-content="The allowed orientation of the application on the device."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>

			<div class="control-group">
				<label class="control-label" for="target_device">Target Device Type</label>
				<div class="controls">
			    	<select id="target_device" name="target_device">
                        <option value="universal" selected>Universal</option>
                        <option value="handset">Handset</option>
                        <option value="tablet">Tablet</option>
                    </select>
			    	<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Target Device Type" data-content="This currently only applies to iOS builds."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="fullscreen">Fullscreen Mode</label>
				<div class="controls">
			    	<select id="fullscreen" name="fullscreen">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
			    	<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Fullscreen Mode" data-content="This option hides the status bar at the top of the screen if set to true."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<!--- END GENERAL SETTINGS FORM --->
			
		  </div>
		  <div class="tab-pane" id="advanced_settings">
		  	
			<!--- START ADVANCED SETTINGS FORM --->
			
			<ul class="nav nav-tabs" id="advanced_tabs">
				<li class="active"><a href="#advanced_ios">iOS</a></li>
				<li><a href="#advanced_android">Android</a></li>
				<li><a href="#advanced_blackberry">BlackBerry</a></li>
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active" id="advanced_ios">
			  		
				   <div class="control-group">
						<label class="control-label" for="webviewbounce">WebView Bounce</label>
						<div class="controls">
					    	<select id="webviewbounce" name="webviewbounce">
		                        <option value="true" selected>true</option>
		                        <option value="false">false</option>>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="WebView Bounce" data-content="Option to control whether the screen 'bounces' when scrolled beyond the top or bottom on iOS. By default, the bounce is on."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
				 
				 	<div class="control-group">
						<label class="control-label" for="prerendered_icon">Prerendered Icon</label>
						<div class="controls">
					    	<select id="prerendered_icon" name="prerendered_icon">
		                        <option value="true" selected>true</option>
		                        <option value="false">false</option>>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Prerendered Icon" data-content="Option to prerender the icon. If icon is prerendered, iOS will not apply it's gloss to the app's icon on the user's home screen."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>

					<div class="control-group">
						<label class="control-label" for="stay_in_webview">Stay in WebView</label>
						<div class="controls">
					    	<select id="stay_in_webview" name="stay_in_webview">
		                        <option value="true" selected>true</option>
		                        <option value="false">false</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Stay in WebView" data-content="Option to open all links in WebView. If set to true, all links (even with target set to blank) will open in the app's webview. Only use this preference if you want pages from your server to take over your entire app."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
	
					<div class="control-group">
						<label class="control-label" for="ios_statusbarstyle">Status Bar Style</label>
						<div class="controls">
					    	<select id="ios_statusbarstyle" name="ios_statusbarstyle">
		                        <option value="default" selected>Default</option>
		                        <option value="black-opaque">black-opaque</option>
		                        <option value="black-translucent">black-translucent</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Status Bar Style" data-content="Option to change the style of the status bar."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>

					<div class="control-group">
						<label class="control-label" for="exit_on_suspend">Exit On Suspend</label>
						<div class="controls">
					    	<select id="exit_on_suspend" name="exit_on_suspend">
		                        <option value="true" selected>true</option>
			                    <option value="false">false</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Exit On Suspend" data-content="Option to exit the application when suspended. If set to false, app will continue to run on suspend."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="show_splash_screen_spinner">Show Splash Screen Spinner</label>
						<div class="controls">
					    	<select id="show_splash_screen_spinner" name="show_splash_screen_spinner">
		                        <option value="true" selected>true</option>
			                    <option value="false">false</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Show Splash Screen Spinner" data-content="Option to show the splash screen spinner. If set to false, the spinner won't appear on the splash screen during app loading."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>		
					
					<div class="control-group">
						<label class="control-label" for="auto_hide_splash_screen">Auto-Hide Splash Screen</label>
						<div class="controls">
					    	<select id="auto_hide_splash_screen" name="auto_hide_splash_screen">
		                        <option value="true" selected>true</option>
			                    <option value="false">false</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Auto-Hide Splash Screen" data-content="Option to hide the splash screen. If set to false, the splash screen must be hidden using a JavaScript API."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>		
					
				</div>
				
				<div class="tab-pane" id="advanced_android">
					
					<div class="control-group">
						<label class="control-label" for="android_minSdkVersion">Min SDK Version</label>
						<div class="controls">
					    	<select id="android_minSdkVersion" name="android_minSdkVersion">
		                        <option value="16">16</option>
								<option value="15">15</option>
								<option value="14">14</option>
								<option value="13">13</option>
								<option value="12">12</option>
								<option value="11">11</option>
								<option value="10">10</option>
		                        <option value="9">9</option>
								<option value="8">8</option>
								<option value="7" selected>7</option>
		                        <option value="6">6</option>
								<option value="5">5</option>
								<option value="4">4</option>
								<option value="3">3</option>
								<option value="2">2</option>
								<option value="1">1</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Minimum SDK Version" data-content="Option to select the minimum SDK to use."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
							
					<div class="control-group">
						<label class="control-label" for="android_maxSdkVersion">Max SDK Version</label>
						<div class="controls">
					    	<select id="android_maxSdkVersion" name="android_maxSdkVersion">
		                        <option value="16">16</option>
								<option value="15" selected>15</option>
								<option value="14">14</option>
								<option value="13">13</option>
								<option value="12">12</option>
								<option value="11">11</option>
								<option value="10">10</option>
		                        <option value="9">9</option>
								<option value="8">8</option>
								<option value="7">7</option>
		                        <option value="6">6</option>
								<option value="5">5</option>
								<option value="4">4</option>
								<option value="3">3</option>
								<option value="2">2</option>
								<option value="1">1</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Maximum SDK Version" data-content="Option to select the maximum SDK to use."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
							
					<div class="control-group">
						<label class="control-label" for="android_installLocation">Install Location</label>
						<div class="controls">
					    	<select id="android_installLocation" name="android_installLocation">
		                        <option value="auto" selected>Auto</option>
		                        <option value="internalOnly">Internal Only</option>
		                        <option value="preferExternal">Prefer External</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Install Location" data-content="Option to select where an app can be installed."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
							
				</div>
				
				<div class="tab-pane" id="advanced_blackberry">
					
					<div class="control-group">
						<label class="control-label" for="disable_cursor">Disable Cursor</label>
						<div class="controls">
					    	<select id="disable_cursor" name="disable_cursor">
		                        <option value="true" selected>true</option>
		                        <option value="false">false</option>
		                    </select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Disable Cursor" data-content="Option to prevent a mouse-icon/cursor from being displayed on the app."><i class="icon-question-sign icon-white"></i></a>
					    </div>
					</div>
					
				</div>
			</div>
			
			<!--- END ADVANCED SETTINGS FORM --->
			
		  </div>
		  <div class="tab-pane" id="app_icons">
		  
		  	<!--- START ICONS FORM --->
			
			<ul class="nav nav-tabs" id="icons_tabs">
				<li class="active"><a href="#icons_ios_tab">iOS</a></li>
				<li><a href="#icons_android_tab">Android</a></li>
				<li><a href="#icons_winphone_tab">WinPhone</a></li>
				<li><a href="#icons_blackberry_tab">BlackBerry</a></li>
				<li><a href="#icons_webos_tab">webOS</a></li>
				<li><a href="#icons_default_tab">Default</a></li>
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active" id="icons_ios_tab">

					    <div class="thumbnail">
					      <img id="icons_ios_57x57_img" name="vios_57x57_img" src="ui/imgs/placeholder/57x57.gif" width="57" height="57" alt="">
						  <button id="icons_ios_57x57" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_ios_57x57_path" id="icons_ios_57x57_path" />
					    </div>

					    <div class="thumbnail">
					      <img id="icons_ios_72x72_img" name="icons_ios_72x72_img" src="ui/imgs/placeholder/72x72.gif" width="72" height="72" alt="">
					      <button id="icons_ios_72x72" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_ios_72x72_path" id="icons_ios_72x72_path" />
					    </div>

					    <div class="thumbnail">
					      <img id="icons_ios_114x114_img" name="icons_ios_114x114_img" src="ui/imgs/placeholder/114x114.gif" width="114" height="114" alt="">
					      <button id="icons_ios_114x114" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_ios_114x114_path" id="icons_ios_114x114_path" />
					    </div>

				</div>
				<div class="tab-pane" id="icons_android_tab">

						<div class="thumbnail">
					      <img id="icons_android_36x36_img" name="icons_android_36x36_img" src="ui/imgs/placeholder/36x36.gif" width="36" height="36" alt="">
					      <button id="icons_android_36x36" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_android_36x36_path" id="icons_android_36x36_path" />
					    </div>

					    <div class="thumbnail">
					      <img id="icons_android_48x48_img" name="icons_android_48x48_img" src="ui/imgs/placeholder/48x48.gif" width="48" height="48" alt="">
					      <button id="icons_android_48x48" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_android_48x48_path" id="icons_android_48x48_path" />
					    </div>

					    <div class="thumbnail">
					      <img id="icons_android_72x72_img" name="icons_android_72x72_img" src="ui/imgs/placeholder/72x72.gif" width="72" height="72" alt="">
					      <button id="icons_android_72x72" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_android_72x72_path" id="icons_android_72x72_path" />
					    </div>

					    <div class="thumbnail">
					      <img id="icons_android_96x96_img" name="icons_android_96x96_img" src="ui/imgs/placeholder/96x96.gif" width="96" height="96" alt="">
					      <button id="icons_android_96x96" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
						  <input type="hidden" name="icons_android_96x96_path" id="icons_android_96x96_path" />
					    </div>

				</div>
				<div class="tab-pane" id="icons_winphone_tab">

					<div class="thumbnail">
				      <img id="icons_winphone_48x48_img" name="icons_winphone_48x48_img" src="ui/imgs/placeholder/48x48.gif" width="48" height="48" alt="">
				      <button id="icons_winphone_48x48" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  <input type="hidden" name="icons_winphone_48x48_path" id="icons_winphone_48x48_path" />
				    </div>

				    <div class="thumbnail">
				      <img id="icons_winphone_62x62_img" name="icons_winphone_62x62_img" src="ui/imgs/placeholder/62x62.gif" width="62" height="62" alt="">
				      <button id="icons_winphone_62x62" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  <input type="hidden" name="icons_winphone_62x62_path" id="icons_winphone_62x62_path" />
				    </div>

				</div>
				<div class="tab-pane" id="icons_blackberry_tab">

					<div class="thumbnail">
				      <img id="icons_bb_68x68_img" name="icons_bb_68x68_img" src="ui/imgs/placeholder/68x68.gif" width="68" height="68 alt="">
				      <button id="icons_bb_68x68" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  <input type="hidden" name="icons_bb_68x68_path" id="icons_bb_68x68_path" />
				    </div>

				</div>
				<div class="tab-pane" id="icons_webos_tab">

					<div class="thumbnail">
				      <img id="icons_webos_64x64_img" name="icons_webos_64x64_img" src="ui/imgs/placeholder/64x64.gif" width="64" height="64" alt="">
				      <button id="icons_webos_64x64" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  <input type="hidden" name="icons_webos_64x64_path" id="icons_webos_64x64_path" />
				    </div>

				</div>
				<div class="tab-pane" id="icons_default_tab">

					<div class="thumbnail">
				      <img id="icons_default_64x64_img" name="icons_default_64x64_img" src="ui/imgs/placeholder/64x64.gif" width="64" height="64" alt="">
				      <button id="icons_default_64x64" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  <input type="hidden" name="icons_default_64x64_path" id="icons_default_64x64_path" />
				    </div>

				</div>
			</div>
			
			<!--- END ICONS FORM --->
		  	
		  </div>
		  <div class="tab-pane" id="splash_screens"> 
		  	
			<!--- START SPLASH SCREEN FORM --->
			
			<ul class="nav nav-tabs" id="splash_tabs">
				<li class="active"><a href="#splash_iphone">iPhone</a></li>
				<li><a href="#splash_ipad">iPad</a></li>
				<li><a href="#splash_android">Android</a></li>
				<li><a href="#splash_winphone">WinPhone</a></li>
				<li><a href="#splash_blackberry">BlackBerry</a></li>
				<li><a href="#splash_default">Default</a></li>
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active" id="splash_iphone">

					    <div class="thumbnail">
					      	<img id="splash_ios_320x480_img" name="splash_ios_320x480_img" src="ui/imgs/placeholder/320x480.gif" width="160" height="240" alt="">
					      	<button id="splash_ios_320x480" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_ios_320x480_path" id="splash_ios_320x480_path" />
					    </div>

					    <div class="thumbnail">
					      	<img id="splash_ios_640x960_img" name="splash_ios_640x960_img" src="ui/imgs/placeholder/640x960.gif" width="320" height="480" alt="">
					      	<button id="splash_ios_640x960" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_ios_640x960_path" id="splash_ios_640x960_path" />
					    </div>

				</div>
				
				<div class="tab-pane" id="splash_ipad">

					    <div class="thumbnail">
					      	<img id="splash_ios_1024x768_img" name="splash_ios_1024x768_img" src="ui/imgs/placeholder/1024x768.gif" width="512" height="384" alt="">
					      	<button id="splash_ios_1024x768" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_ios_1024x768_path" id="splash_ios_1024x768_path" />
					    </div>

					    <div class="thumbnail">
					      	<img id="splash_ios_768x1024_img" name="splash_ios_768x1024_img" src="ui/imgs/placeholder/768x1024.gif" width="384" height="512" alt="">
					      	<button id="splash_ios_768x1024" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_ios_768x1024_path" id="splash_ios_768x1024_path" />
					    </div>

				</div>
				
				<div class="tab-pane" id="splash_android">

						<div class="thumbnail">
					      	<img id="splash_android_36x36_img" name="splash_android_36x36_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_android_36x36" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_android_36x36_path" id="splash_android_36x36_path" />
					    </div>

					    <div class="thumbnail">
					      	<img id="splash_android_48x48_img" name="splash_android_48x48_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_android_48x48" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_android_48x48_path" id="splash_android_48x48_path" />
					    </div>

					    <div class="thumbnail">
					      	<img id="splash_android_72x72_img" name="splash_android_72x72_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_android_72x72" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_android_72x72_path" id="splash_android_72x72_path" />
					    </div>

					    <div class="thumbnail">
					      	<img id="splash_android_96x96_img" name="splash_android_96x96_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_android_96x96" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_android_96x96_path" id="splash_android_96x96_path" />
					    </div>

				</div>
				<div class="tab-pane" id="splash_winphone">
						
						<div class="thumbnail">
					      	<img id="splash_winphone_36x36_img" name="splash_winphone_36x36_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_winphone_36x36" class="imageUpload_btn btn btn-warning" data-allowed="jpg">select image</button>
					  		<input type="hidden" name="splash_winphone_36x36_path" id="splash_winphone_36x36_path" />
					    </div>
						
				</div>
				<div class="tab-pane" id="splash_blackberry">
					
						<div class="thumbnail">
					      	<img id="splash_bb_36x36_img" name="splash_bb_36x36_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_bb_36x36" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_bb_36x36_path" id="splash_bb_36x36_path" />
					    </div>
					
				</div>
				<div class="tab-pane" id="splash_default">
						
						<div class="thumbnail">
					      	<img id="splash_default_36x36_img" name="splash_default_36x36_img" src="ui/imgs/placeholder/generic.gif" alt="">
					      	<button id="splash_default_36x36" class="imageUpload_btn btn btn-warning" data-allowed="png">select image</button>
					  		<input type="hidden" name="splash_default_36x36_path" id="splash_default_36x36_path" />
					    </div>
						
				</div>
				
			</div>
			
			<!--- END SPLASH SCREEN FORM --->
			
		  </div>
		  <div class="tab-pane" id="permissions">
		  
		  	<div class="control-group">
				<label class="control-label" for="permission_battery">Battery</label>
				<div class="controls">
			    	<select id="permission_battery" name="permission_battery" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Battery" data-content="Option to select the battery features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
		  
			<div class="control-group">
				<label class="control-label" for="permission_camera">Camera</label>
				<div class="controls">
			    	<select id="permission_camera" name="permission_camera" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Camera" data-content="Option to select the camera features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_contacts">Contacts</label>
				<div class="controls">
			    	<select id="permission_contacts" name="permission_contacts" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Contacts" data-content="Option to select the contacts features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_device">Device</label>
				<div class="controls">
			    	<select id="permission_device" name="permission_device" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Device" data-content="Option to select the device features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_file">File</label>
				<div class="controls">
			    	<select id="permission_file" name="permission_file" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="File" data-content="Option to select the file features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_geolocation">GeoLocation</label>
				<div class="controls">
			    	<select id="permission_geolocation" name="permission_geolocation" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="GeoLocation" data-content="Option to select the geolocation features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_media">Media</label>
				<div class="controls">
			    	<select id="permission_media" name="permission_media" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Media" data-content="Option to select the media features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_network">Network</label>
				<div class="controls">
			    	<select id="permission_network" name="permission_network" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Network" data-content="Option to select the network features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="permission_notification">Notification</label>
				<div class="controls">
			    	<select id="permission_notification" name="permission_notification" class="permissionSelector">
                        <option value="true" selected>true</option>
                        <option value="false">false</option>
                    </select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Notification" data-content="Option to select the notification features."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
		  </div>
		  
		  	<div class="tab-pane" id="access">
		  			
					<div class="control-group">
						<label class="control-label" for="deny_all_access">Deny All</label>
						<div class="controls">
					    	<select id="deny_all_access" name="deny_all_access">
		                        <option value="true" selected>true</option>
                        		<option value="false">false</option>
                    		</select>
							<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Deny All Access" data-content="Option to select if access to all external resources is denied. If FALSE, you will need to enter the domains you wish to grant access to."><i class="icon-question-sign icon-white"></i></a>
			   			</div>
					</div>
					
					<div id="accessTable">
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Domain</th>
								<th>Subdomains</th>
								<th>Browser Only</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="accessTableBody">
						</tbody>
					</table>
					
					<p><button class="btn btn-primary" id="addAccess_btn" type="button">Add Another</button></p>
					
					</div>
		  			
			</div>
		  
		  <div class="tab-pane" id="developer_info">
		  	
			<div class="control-group">
				<label class="control-label" for="author_name">Author Name</label>
				<div class="controls">
			    	<input type="text" id="author_name" name="author_name" class="validate[required]" placeholder="Author Name" />
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Author Name" data-content="The name of the author."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="author_email">Author Email</label>
				<div class="controls">
			    	<input type="text" id="author_email" name="author_email" class="validate[required, custom[email]]" placeholder="Author Email" />
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Author Email" data-content="The author's email address."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="author_url">Author URL</label>
				<div class="controls">
			    	<input type="text" id="author_url" name="author_url" class="validate[required, custom[url]]" placeholder="Author URL" />
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Author URL" data-content="The author's URL."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
		  </div>
		</div>
		<input type="hidden" 	id="submit_configData" 	name="submit_configData" value="true" />
		<input type="hidden" 	id="fileExists" 		name="fileExists" value="<cfoutput>#fileExists#</cfoutput>" />
		<input type="text"		id="providedaccess" 	name="providedaccess" />
		
		</form>
		</div>
	<cfelse>
		
		<cfoutput>
        	<p>Congratulations! Your Config.xml file has been saved within the selected project folder: #fileLocation#.</p>
		</cfoutput>
		
		<cftry>
			<cfsavecontent variable="commandxml"> 
			<cfoutput> 
			    <response> 
			        <ide> 
			            <commands> 
			                <command type="refreshFolder"> 
								<params> 
									<param key="foldername" value="#application.projectFolderLocation#" /> 
								</params> 
							</command>
							<command type="openFile"> 
								<params> 
									<param key="filename" value="#fileLocation#" /> 
								</params> 
							</command>
			            </commands>     
			        </ide> 
			    </response> 
			</cfoutput>
			</cfsavecontent>
	
			<cfhttp method="post" url="#application.callbackURL#" result="commandresponse"> 
			    <cfhttpparam type="body" value="#commandxml#"> 
			</cfhttp>
			<cfcatch></cfcatch>
		</cftry>
		
		<cfset application.projectFolderLocation = '' />
		
	</cfif>

    </div> <!-- /container -->
	
	<div class="modal hide fade" id="addAccessModal">
		<div class="modal-header">
			<h3>Domain Access</h3>
		</div>
		<div class="modal-body">
			<form id="accessForm" name="accessForm">
			<div class="control-group">
				<label class="control-label" for="domain">Domain</label>
				<div class="controls">
			    	<input type="text" id="domain" name="domain" placeholder="http://www.php.net" />
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Domain" data-content="The domain to allow access to. Can be a full URL or a wildcard (*) to allow access to all external resources."><i class="icon-question-sign icon-white"></i></a>
			    </div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="subdomains">Subdomains</label>
				<div class="controls">
			    	<select id="subdomains" name="subdomains">
                        <option value="true" selected>true</option>
                		<option value="false">false</option>
            		</select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Subdomains" data-content="Option to select if access to all subdomains of the given domain are allowed."><i class="icon-question-sign icon-white"></i></a>
	   			</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="browserOnly">Browser Only</label>
				<div class="controls">
			    	<select id="browserOnly" name="browserOnly">
                        <option value="true" selected>true</option>
                		<option value="false">false</option>
            		</select>
					<a class="btn btn-small btn-info help_popovers" rel="popover" data-title="Browser Only" data-content="Option to select if the domain takes over the entire webview or not."><i class="icon-question-sign icon-white"></i></a>
	   			</div>
			</div>
			</form>
			
		</div>
		<div class="modal-footer">
			<a class="btn" id="cancelAccess_btn">Cancel</a>
	    	<a class="btn btn-primary" id="saveAccess_btn">Save</a>
		</div>
	</div>
	
	<div class="modal hide fade" id="confirmOverwriteModal">
		<div class="modal-header">
			<h3>File Overwrite Confirmation</h3>
		</div>
		<div class="modal-body">
			<p>A Config.xml file already exists in this location. Are you sure you want to overwrite it?</p>
		</div>
		<div class="modal-footer">
			<a class="btn" id="cancelOverwrite_btn">Cancel</a>
	    	<a class="btn btn-primary" id="confirmOverwrite_btn">Overwrite</a>
		</div>
	</div>
	
	<div class="modal hide fade" id="importFileModal">
		<div class="modal-header">
			<h3>Import File</h3>
		</div>
		<div class="modal-body">
			<p>A Config.xml file already exists in this location. Would you like to amend that file?</p>
		</div>
		<div class="modal-footer">
			<a class="btn" id="cancelImport_btn">Cancel</a>
	    	<a class="btn btn-primary" id="confirmImport_btn">Import</a>
		</div>
	</div>
	
	<div class="modal hide fade" id="requiredFieldsModal">
		<div class="modal-header">
			<h3>Missing Fields</h3>
		</div>
		<div class="modal-body" id="missingFieldsBody">
		</div>
		<div class="modal-footer">
			<a class="btn" id="closeMissingFields_btn">OK</a>
		</div>
	</div>
	
	<ul id="basicUploadSuccessExample" style="display: none;"></ul>
	

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <cfoutput>
    	<script src="ui/js/jquery-1.8.0.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="ui/js/formControls.js?#createUUID()#"></script>
		<script src="ui/js/fileuploader.js?#createUUID()#"></script>
		<script src="ui/js/script.js?#createUUID()#"></script>
    </cfoutput>
	<cfif showForm>
	<script>
	$(document).ready(function(){
		
		$('.imageUpload_btn').each(function(){

			var buttonID = $(this).attr('id');
			var imgElement = $('#' + buttonID + '_img');
			var pathElement = $('#' + buttonID + '_path');
						
			new qq.FileUploader({
				action: 'cfcs/configBuilder.cfc',
				autoUpload: true,
				button: this,
				element: $('#basicUploadSuccessExample')[0],
				params: {
					method: 'Upload',
					image_element: $(this).attr('id'),
					folder_location: <cfoutput>'#application.projectFolderLocation#'</cfoutput>,
				},
				multiple: false,
				allowedExtensions: ['' + $(this).attr('data-allowed') + ''],
				onSubmit: function(id, fileName){

				},
				onComplete: function(id, fileName, responseJSON){
					$(imgElement).attr('src', '../' + responseJSON.filepath);
					$(pathElement).val(responseJSON.filepath);
				}
			});
		});
		
	});
	</script>
	</cfif>

  </body>
</html>
