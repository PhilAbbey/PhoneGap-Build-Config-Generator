<cfsetting showdebugoutput="false">
<cfset helper = new cfcs.builderHelper(ideeventinfo) />
<cfset runType = helper.getRunType() />

<cfset application.projectFolderLocation ='' />

<cfset xmldoc 					= xmlParse(ideeventinfo) />
<cfset response 				= xmlSearch(xmldoc,"//resource") />
<cfset application.projectFolderLocation 	= response[1].XmlAttributes.path />
<cfset application.callbackURL = helper.getCallbackURL() />

<cfheader name="Content-Type" value="text/xml">
<cfoutput>
<response showresponse="true">
<ide url="#helper.getRootURL()#configResult.cfm">
	<dialog width="900" height="800" title="Config.xml Generator" />
</ide>
</response>
</cfoutput>