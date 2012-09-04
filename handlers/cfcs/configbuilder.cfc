<cfcomponent output="false">
	
	<cffunction name="init" output="false" access="public" hint="I am the constructor method.">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="createFileContent" output="false" hint="I create the content for the Config.xml file.">
		<cfargument name="formData" required="true" type="Struct" hint="The submitted form data." />
			<cfset var fileContent = '' />
				<cfxml variable="fileContent"><cfoutput><?xml version="1.0" encoding="UTF_8" ?>
			    <widget xmlns = "http://www.w3.org/ns/widgets"
			        xmlns:gap = "http://phonegap.com/ns/1.0"
			        id        = "#arguments.formData.ID#"
			        versionCode="#arguments.formData.versionCode#" 
			        version   = "#arguments.formData.version#">
	<name>#arguments.formData.name#</name>
	<description>
		#arguments.formData.description#
	</description>
	<author href="#arguments.formData.author_url#" email="#arguments.formData.author_email#">
	    #arguments.formData.author_name#
	</author>
	<preference name="phonegap-version" value="#arguments.formData.phonegap_version#" />
	<preference name="orientation" value="#arguments.formData.orientation#" />
	<preference name="target-device" value="#arguments.formData.target_device#" />
	<preference name="fullscreen" value="#arguments.formData.fullscreen#" />
	<preference name="webviewbounce" value="#arguments.formData.webviewbounce#" />
	<preference name="prerendered-icon" value="#arguments.formData.prerendered_icon#" />
	<preference name="stay-in-webview" value="#arguments.formData.stay_in_webview#" />
	<preference name="ios-statusbarstyle" value="#arguments.formData.ios_statusbarstyle#" />
	<preference name="disable-cursor" value="#arguments.formData.disable_cursor#" />
	<preference name="android-minSdkVersion" value="#arguments.formData.android_minsdkversion#" />
	<preference name="android-maxSdkVersion" value="#arguments.formData.android_maxsdkversion#" />
	<preference name="android-installLocation" value="#arguments.formData.android_installLocation#" />
	<cfif arguments.formData.permission_battery>
	<feature name="http://api.phonegap.com/1.0/battery"/></cfif>
	<cfif arguments.formData.permission_camera>
	<feature name="http://api.phonegap.com/1.0/camera"/></cfif>
	<cfif arguments.formData.permission_contacts>
	<feature name="http://api.phonegap.com/1.0/contacts"/></cfif>
	<cfif arguments.formData.permission_device>
	<feature name="http://api.phonegap.com/1.0/device"/></cfif>
	<cfif arguments.formData.permission_file>
	<feature name="http://api.phonegap.com/1.0/file"/></cfif>
	<cfif arguments.formData.permission_geolocation>
	<feature name="http://api.phonegap.com/1.0/geolocation"/></cfif>
	<cfif arguments.formData.permission_media>
	<feature name="http://api.phonegap.com/1.0/media"/></cfif>
	<cfif arguments.formData.permission_network>
	<feature name="http://api.phonegap.com/1.0/network"/></cfif>
	<cfif arguments.formData.permission_notification>
	<feature name="http://api.phonegap.com/1.0/notification"/></cfif>
	<!--- START ICONS --->
	<!--- Default icon --->
	<cfif structKeyExists(arguments.formData, 'icons_default_64x64_path') and arguments.formData.icons_default_64x64_path NEQ ''>
	<icon src="#arguments.formData.icons_default_64x64_path#" /></cfif>
	<!--- iOS icons --->
	<cfif structKeyExists(arguments.formData, 'icons_ios_57x57_path') and arguments.formData.icons_ios_57x57_path NEQ ''>
	<icon src="#arguments.formData.icons_ios_57x57_path#"  gap:platform="ios" width="57" height="57" /></cfif>
	<cfif structKeyExists(arguments.formData, 'icons_ios_72x72_path') and arguments.formData.icons_ios_72x72_path NEQ ''>
	<icon src="#arguments.formData.icons_ios_72x72_path#" gap:platform="ios" width="72" height="72" /></cfif>
	<cfif structKeyExists(arguments.formData, 'icons_ios_114x114_path') and arguments.formData.icons_ios_114x114_path NEQ ''>
	<icon src="#arguments.formData.icons_ios_114x114_path#" gap:platform="ios" width="114" height="114" /></cfif>
	<!--- Android icons --->
	<cfif structKeyExists(arguments.formData, 'icons_android_36x36_path') and arguments.formData.icons_android_36x36_path NEQ ''>
	<icon src="#arguments.formData.icons_android_36x36_path#" gap:platform="android" gap:density="ldpi" /></cfif>
	<cfif structKeyExists(arguments.formData, 'icons_android_48x48_path') and arguments.formData.icons_android_48x48_path NEQ ''>
	<icon src="#arguments.formData.icons_android_48x48_path#" gap:platform="android" gap:density="mdpi" /></cfif>
	<cfif structKeyExists(arguments.formData, 'icons_android_36x36_path') and arguments.formData.icons_android_72x72_path NEQ ''>
	<icon src="#arguments.formData.icons_android_72x72_path#" gap:platform="android" gap:density="hdpi" /></cfif>
	<cfif structKeyExists(arguments.formData, 'icons_android_96x96_path') and arguments.formData.icons_android_96x96_path NEQ ''>
	<icon src="#arguments.formData.icons_android_96x96_path#" gap:platform="android" gap:density="xhdpi" /></cfif>
	<!--- BlackBerry icons --->
	<cfif structKeyExists(arguments.formData, 'icons_bb_68x68_path') and arguments.formData.icons_bb_68x68_path NEQ ''>
	<icon src="#arguments.formData.icons_bb_68x68_path#" gap:platform="blackberry" /></cfif>
	<!---<icon src="icons/bb/icon_hover.png" gap:platform="blackberry" gap:state="hover"/>--->
	<!--- WinPhone icons --->
	<cfif structKeyExists(arguments.formData, 'icons_winphone_48x48_path') and arguments.formData.icons_winphone_48x48_path NEQ ''>
	<icon src="#arguments.formData.icons_winphone_48x48_path#" gap:platform="winphone" /></cfif>
	<!---<icon src="icons/winphone/tileicon.png" gap:platform="winphone" gap:role="background" />--->
	<!--- WebOS icons --->
	<cfif structKeyExists(arguments.formData, 'icons_webos_64x64_path') and arguments.formData.icons_webos_64x64_path NEQ ''>
	<icon src="#arguments.formData.icons_webos_64x64_path#" gap:platform="webos" /></cfif>
	<!--- END ICONS --->
			
	<!--- START SPLASH SCREENS --->
	<!--- iOS splash --->
	<cfif structKeyExists(arguments.formData, 'splash_ios_320x480_path') and arguments.formData.splash_ios_320x480_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_ios_320x480_path#" gap:platform="ios" width="320" height="480" /></cfif>
	<cfif structKeyExists(arguments.formData, 'splash_ios_640x960_path') and arguments.formData.splash_ios_640x960_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_ios_640x960_path#" gap:platform="ios" width="640" height="960" /></cfif>
	<cfif structKeyExists(arguments.formData, 'splash_ios_1024x768_path') and arguments.formData.splash_ios_1024x768_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_ios_1024x768_path#" gap:platform="ios" width="1024" height="768" /></cfif>
	<cfif structKeyExists(arguments.formData, 'splash_ios_768x1024_path') and arguments.formData.splash_ios_768x1024_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_ios_768x1024_path#" gap:platform="ios" width="768" height="1024" /></cfif>
	
	<!--- Android splash --->
	<cfif structKeyExists(arguments.formData, 'splash_android_36x36_path') and arguments.formData.splash_android_36x36_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_android_36x36_path#" gap:platform="android" gap:density="ldpi" /></cfif>
	<cfif structKeyExists(arguments.formData, 'splash_android_48x48_path') and arguments.formData.splash_android_48x48_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_android_48x48_path#" gap:platform="android" gap:density="mdpi" /></cfif>
	<cfif structKeyExists(arguments.formData, 'splash_android_72x72_path') and arguments.formData.splash_android_72x72_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_android_72x72_path#" gap:platform="android" gap:density="hdpi" /></cfif>
	<cfif structKeyExists(arguments.formData, 'splash_android_96x96_path') and arguments.formData.splash_android_96x96_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_android_96x96_path#" gap:platform="android" gap:density="xhdpi" /></cfif>
	
	<!--- BlackBerry splash --->
	<cfif structKeyExists(arguments.formData, 'splash_bb_36x36_path') and arguments.formData.splash_bb_36x36_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_bb_36x36_path#" gap:platform="blackberry" /></cfif>
	
	<!--- WinPhone splash --->
	<cfif structKeyExists(arguments.formData, 'splash_winphone_36x36_path') and arguments.formData.splash_winphone_36x36_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_winphone_36x36_path#" gap:platform="winphone" /></cfif>
	
	<!--- Default splash --->
	<cfif structKeyExists(arguments.formData, 'splash_default_36x36_path') and arguments.formData.splash_default_36x36_path NEQ ''>
	<gap:splash src="#arguments.formData.splash_default_36x36_path#" /></cfif>
	
	<!--- END SPLASH SCREENS --->
		
	<!--- Access Permissions --->
	<cfset accessData = deserializeJSON(arguments.formData['providedaccess']) />
	<cfif arrayLen(accessData)>
	<cfloop array="#accessData#" index="accessItem">
	<cfif accessItem['subdomains'] EQ 'YES'><cfset accessItem['subdomains'] = true /></cfif>
	<cfif accessItem['subdomains'] EQ 'NO'><cfset accessItem['subdomains'] = false /></cfif>
	<cfif accessItem['browserOnly'] EQ 'YES'><cfset accessItem['browserOnly'] = true /></cfif>
	<cfif accessItem['browserOnly'] EQ 'NO'><cfset accessItem['browserOnly'] = false /></cfif>
	<access origin="#accessItem['origin']#" subdomains="#accessItem['subdomains']#" browserOnly="#accessItem['browserOnly']#" /></cfloop>
	<cfelse>
	<access />
	</cfif>
</widget></cfoutput></cfxml>
		<cfreturn fileContent />
	</cffunction>
	
	<cffunction name="readConfig" access="remote" output="false" returnformat="JSON" hint="I read the contents of the existing Config.xml file.">
		<cfargument name="fileContent" required="true" type="string" hint="The contents of the file." />
			<cfset var xmlData = xmlParse(arguments.fileContent) />
			<cfset var stuDetails = {
				'id' = xmlData.widget.XmlAttributes['id'],
				'name' = xmlData.widget.name.XmlText,
				'description' = xmlData.widget.description.XmlText,
				'version' = xmlData.widget.XmlAttributes['version'],
				'versionCode' = xmlData.widget.XmlAttributes['versionCode'],
				'author_name' = xmlData.widget.author.XmlText,
				'author_email' = xmlData.widget.author.XmlAttributes['email'],
				'author_url' = xmlData.widget.author.XmlAttributes['href']
			} />
			
			<!--- Get preferences --->
			<cfset var arrayPreferences = xmlSearch(xmlData, "//*[local-name()='preference']") />
			<cfloop array="#arrayPreferences#" index="item">
				<cfset structInsert(stuDetails,replaceNoCase(item.XmlAttributes.name,'-','_'),trim(item.XmlAttributes.value)) />
			</cfloop>
			
			<!--- Get features --->
			<cfset var arrayFeatures = xmlSearch(xmlData, "//*[local-name()='feature']") />
			<cfloop array="#arrayFeatures#" index="item">
				<cfset arrName = reMatchNoCase('([^/]+$)',item.XmlAttributes.name) />
				<cfset structInsert(stuDetails,'permission_#arrName[1]#',item.XmlAttributes.name) />
			</cfloop>
			
			<!--- Get icons --->
			<cfset var arrIcons = xmlSearch(xmlData, "//*[local-name()='icon']") />
			<cfset arrIconData = [] />		
			<cfloop array="#arrIcons#" index="iconItem">
				<cfif !structIsEmpty(iconItem.XmlAttributes)>
					<cfset arrayAppend(arrIconData,iconItem.XmlAttributes) />
				</cfif>
			</cfloop>
			<cfset structInsert(stuDetails,'icondata',serializeJSON(displayImages(arrIconData))) />
			
			<!--- Get splash images --->
			<cfset var arrSplash = xmlSearch(xmlData, "//*[local-name()='splash']") />
			<cfset arrSplashData = [] />		
			<cfloop array="#arrSplash#" index="splashItem">
				<cfif !structIsEmpty(splashItem.XmlAttributes)>
					<cfset arrayAppend(arrSplashData,splashItem.XmlAttributes) />
				</cfif>
			</cfloop>
			<cfset structInsert(stuDetails,'splashdata',serializeJSON(displaySplashImages(arrSplashData))) />
			
			<!--- Get access --->
			<cfset var arrayAccess = xmlSearch(xmlData, "//*[local-name()='access']") />
			<cfset arrAccessData = [] />		
			<cfloop array="#arrayAccess#" index="accessItem">
				<cfif !structIsEmpty(accessItem.XmlAttributes)>
					<cfset arrayAppend(arrAccessData,accessItem.XmlAttributes) />
				</cfif>
			</cfloop>
			<cfset structInsert(stuDetails,'providedaccess',serializeJSON(arrAccessData)) />
			
		<cfreturn serializeJSON(stuDetails) />
	</cffunction>
	
	<cffunction name="Upload" access="remote" output="false" returntype="any" returnformat="JSON">
		<cfargument name="qqfile" 			type="string" required="true">
		<cfargument name="image_element" 	type="string" required="true" />
		<cfargument name="folder_location" 	type="string" required="true" />
			<cfset var local = structNew() />
				<cfset local.response = structNew() />
				<cfset local.requestData = GetHttpRequestData() />
				<!--- check if XHR data exists --->
		        <cfif len(local.requestData.content) GT 0>
					<cfset local.response = UploadFileXhr(arguments.qqfile, local.requestData.content, arguments.image_element, arguments.folder_location)>       
				<cfelse>
				<!--- no XHR data process as standard form submission --->
					<cfset local.filedata = getFileDirData(arguments.image_element) />
					<cfset local.filelocation = arguments.folder_location & '/' & local.filedata['location'] />
					<cffile action="upload" fileField="arguments.qqfile" destination="#local.filelocation##arguments.qqfile#" nameConflict="makeunique">
		    		<!--- Read the file contents and save in the correct format --->
					<cfset uploadedFileContent = fileReadBinary('#local.filelocation##arguments.qqfile#') />
					<cffile action="write" file="#local.filelocation##local.filedata['image_name']#" output="#uploadedFileContent#">
		    		<cfset local.response['success'] = true>
		    		<cfset local.response['type'] = 'form'>
					<cfset local.response['image_element'] = arguments.image_element />
					<cfset local.response['filepath'] = '#local.filedata['location']##local.filedata['image_name']#' />
				</cfif>
		<cfreturn local.response>
	</cffunction>
    
    <cffunction name="UploadFileXhr" access="private" output="false">
		<cfargument name="qqfile" 			type="string" 	required="true">
		<cfargument name="content" 			type="any" 		required="true">
		<cfargument name="image_element" 	type="string" 	required="true" />
		<cfargument name="folder_location" 	type="string" 	required="true" />
			<cfset var local = structNew()>
				<cfset local.filedata = getFileDirData(arguments.image_element) />
				<cfset local.filelocation = arguments.folder_location & '/' & local.filedata['location'] />
				<cfif !directoryExists(local.filelocation)>
					<cfset directoryCreate(local.filelocation) />
				</cfif>
				<cffile action="write" file="#local.filelocation##local.filedata['image_name']#" output="#arguments.content#">
		    	<cfset local.response = structNew()>
		    	<cfset local.response['success'] = true>
		    	<cfset local.response['type'] = 'xhr'>
				<cfset local.response['image_element'] = arguments.image_element />
				<cfset local.response['filepath'] = '#local.filedata['location']##local.filedata['image_name']#' />
		<cfreturn local.response>
    </cffunction>
    
    <cffunction name="getFileDirData" output="false" access="public" hint="I take the submitted file name and create the directory and file data for the saved file.">
		<cfargument name="fileref" required="true" type="string" />
			<cfset var arrFileData = listToArray(arguments.fileref, '_') />
			<cfset var stuFileData = {} />
				<cfset local.icon = {
					'base_location' = arrFileData[1],
					'platform' 		= arrFileData[2],
					'image_size' 	= listGetAt(arrFileData[3], 1, 'x')
				} />
				<cfswitch expression="#local.icon['platform']#">
					<cfcase value="ios">
						<cfif local.icon['base_location'] EQ 'icons'>
							<cfswitch expression="#local.icon['image_size']#">
								<cfcase value="57">
									<cfset stuFileData['image_name'] = 'icon.png' />
								</cfcase>
								<cfcase value="72">
									<cfset stuFileData['image_name'] = 'icon-72.png' />
								</cfcase>
								<cfcase value="114">
									<cfset stuFileData['image_name'] = 'icon_at_2x.png' />
								</cfcase>
							</cfswitch>
						<cfelse>
							<cfswitch expression="#local.icon['image_size']#">
								<cfcase value="320"><!--- Classic --->
									<cfset stuFileData['image_name'] = 'Default.png' />
								</cfcase>
								<cfcase value="640"><!--- Retina --->
									<cfset stuFileData['image_name'] = 'Default_at_2x.png' />
								</cfcase>
								<cfcase value="768"><!--- Portrait iPad --->
									<cfset stuFileData['image_name'] = 'Default-Portrait.png' />
								</cfcase>
								<cfcase value="1024"><!--- Landscape iPad --->
									<cfset stuFileData['image_name'] = 'Default-Landscape.png' />
								</cfcase>
							</cfswitch>
						</cfif>
						<cfset stuFileData['location'] = local.icon['base_location'] & '/' & local.icon['platform'] & '/' />
					</cfcase>
					<cfcase value="android">
							<cfswitch expression="#local.icon['image_size']#">
								<cfcase value="36">
									<cfset stuFileData['image_name'] = 'ldpi.png' />
								</cfcase>
								<cfcase value="48">
									<cfset stuFileData['image_name'] = 'mdpi.png' />
								</cfcase>
								<cfcase value="72">
									<cfset stuFileData['image_name'] = 'hdpi.png' />
								</cfcase>
								<cfcase value="96">
									<cfset stuFileData['image_name'] = 'xhdpi.png' />
								</cfcase>
							</cfswitch>
						<cfset stuFileData['location'] = local.icon['base_location'] & '/' & local.icon['platform'] & '/' />
					</cfcase>
					<cfcase value="bb">
						<cfif local.icon['base_location'] EQ 'icons'>
							<cfswitch expression="#local.icon['image_size']#">
								<cfcase value="68">
									<cfset stuFileData['image_name'] = 'icon.png' />
								</cfcase>
							</cfswitch>
						<cfelse>
							<cfset stuFileData['image_name'] = 'splash.png' />
						</cfif>
						<cfset stuFileData['location'] = local.icon['base_location'] & '/' & local.icon['platform'] & '/' />
					</cfcase>
					<cfcase value="winphone">
						<cfif local.icon['base_location'] EQ 'icons'>
							<cfswitch expression="#local.icon['image_size']#">
								<cfcase value="48">
									<cfset stuFileData['image_name'] = 'icon.png' />
								</cfcase>
								<cfcase value="62">
									<cfset stuFileData['image_name'] = 'tileicon.png' />
								</cfcase>
							</cfswitch>
						<cfelse>
							<cfset stuFileData['image_name'] = 'splash.jpg' />
						</cfif>
					<cfset stuFileData['location'] = local.icon['base_location'] & '/' & local.icon['platform'] & '/' />
				</cfcase>
				<cfcase value="webos">
					<cfswitch expression="#local.icon['image_size']#">
						<cfcase value="64">
							<cfset stuFileData['image_name'] = 'icon.png' />
						</cfcase>
					</cfswitch>
					<cfset stuFileData['location'] = local.icon['base_location'] & '/' & local.icon['platform'] & '/' />
				</cfcase>
				<cfcase value="default">
					<cfif local.icon['base_location'] EQ 'icons'>
						<cfset stuFileData['image_name'] = 'icon.png' />
					<cfelse>
						<cfset stuFileData['image_name'] = 'splash.png' />
					</cfif>
					<cfset stuFileData['location'] = '/' />
				</cfcase>
			</cfswitch>	
		<cfreturn stuFileData />
	</cffunction>
	
	<cffunction name="displayImages" output="false" access="public" hint="I read the provided JSON and display the images in the config builder window.">
		<cfargument name="imageData" required="true" type="array" hint="JSON representation of image data from config.xml file." />
			<cfset var arrFileData = [] />
			<cfset var arrIconData = arguments.imageData />
				<cfloop array="#arrIconData#" index="iconItem">
					<cfset var stuFileData = {} />
					<cfif structKeyExists(iconItem,'gap:platform')>
						<cfset thisPlatform = iconItem['gap:platform'] />
						<cfswitch expression="#thisPlatform#">
							<cfcase value="ios">
								<cfswitch expression="#iconItem['height']#">
									<cfcase value="57">
										<cfset stuFileData['image_element'] = 'icons_ios_57x57' />
									</cfcase>
									<cfcase value="72">
										<cfset stuFileData['image_element'] = 'icons_ios_72x72' />
									</cfcase>
									<cfcase value="114">
										<cfset stuFileData['image_element'] = 'icons_ios_114x114' />
									</cfcase>
								</cfswitch>
							</cfcase>
							<cfcase value="android">
								<cfset thisDensity = iconItem['gap:density'] />
								<cfswitch expression="#thisDensity#">
									<cfcase value="ldpi">
										<cfset stuFileData['image_element'] = 'icons_android_36x36' />
									</cfcase>
									<cfcase value="mdpi">
										<cfset stuFileData['image_element'] = 'icons_android_48x48' />
									</cfcase>
									<cfcase value="hdpi">
										<cfset stuFileData['image_element'] = 'icons_android_72x72' />
									</cfcase>
									<cfcase value="xhdpi">
										<cfset stuFileData['image_element'] = 'icons_android_96x96' />
									</cfcase>
								</cfswitch>
							</cfcase>
							<cfcase value="blackberry">
								<cfset stuFileData['image_element'] = 'icons_bb_68x68' />
							</cfcase>
							<cfcase value="winphone">
								<cfset stuFileData['image_element'] = 'icons_winphone_48x48' />
							</cfcase>
							<cfcase value="webos">
								<cfset stuFileData['image_element'] = 'icons_webos_64x64' />
							</cfcase>
						</cfswitch>
						<cfset stuFileData['image_path'] = iconItem['src'] />
						<cfset arrayAppend(arrFileData,stuFileData) />
					<cfelse>
						<cfset stuFileData['image_path'] = iconItem['src'] />
						<cfset stuFileData['image_element'] = 'icons_default_64x64' />
						<cfset arrayAppend(arrFileData,stuFileData) />
					</cfif>
				</cfloop>
		<cfreturn arrFileData />
	</cffunction>
	
	<cffunction name="displaySplashImages" output="false" access="public" hint="I read the provided JSON and display the images in the config builder window.">
		<cfargument name="imageData" required="true" type="array" hint="JSON representation of image data from config.xml file." />
			<cfset var arrFileData = [] />
			<cfset var arrIconData = arguments.imageData />
				<cfloop array="#arrIconData#" index="iconItem">
					<cfset var stuFileData = {} />
					<cfif structKeyExists(iconItem,'gap:platform')>
						<cfset thisPlatform = iconItem['gap:platform'] />
						<cfswitch expression="#thisPlatform#">
							<cfcase value="ios">
								<cfswitch expression="#iconItem['width']#">
									<cfcase value="320">
										<cfset stuFileData['image_element'] = 'splash_ios_320x480' />
									</cfcase>
									<cfcase value="640">
										<cfset stuFileData['image_element'] = 'splash_ios_640x960' />
									</cfcase>
									<cfcase value="768">
										<cfset stuFileData['image_element'] = 'splash_ios_768x1024' />
									</cfcase>
									<cfcase value="1024">
										<cfset stuFileData['image_element'] = 'splash_ios_1024x768' />
									</cfcase>
								</cfswitch>
							</cfcase>
							<cfcase value="android">
								<cfset thisDensity = iconItem['gap:density'] />
								<cfswitch expression="#thisDensity#">
									<cfcase value="ldpi">
										<cfset stuFileData['image_element'] = 'splash_android_36x36' />
									</cfcase>
									<cfcase value="mdpi">
										<cfset stuFileData['image_element'] = 'splash_android_48x48' />
									</cfcase>
									<cfcase value="hdpi">
										<cfset stuFileData['image_element'] = 'splash_android_72x72' />
									</cfcase>
									<cfcase value="xhdpi">
										<cfset stuFileData['image_element'] = 'splash_android_96x96' />
									</cfcase>
								</cfswitch>
							</cfcase>
							<cfcase value="blackberry">
								<cfset stuFileData['image_element'] = 'splash_bb_36x36' />
							</cfcase>
							<cfcase value="winphone">
								<cfset stuFileData['image_element'] = 'splash_winphone_36x36' />
							</cfcase>
						</cfswitch>
					<cfset stuFileData['image_path'] = iconItem['src'] />
					<cfset arrayAppend(arrFileData,stuFileData) />
				<cfelse>
					<cfset stuFileData['image_path'] = iconItem['src'] />
					<cfset stuFileData['image_element'] = 'splash_default_36x36' />
					<cfset arrayAppend(arrFileData,stuFileData) />
				</cfif>
			</cfloop>
		<cfreturn arrFileData />
	</cffunction>
	
</cfcomponent>