
<%@ page import="com.FileInfo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'fileInfo.label', default: 'FileInfo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-fileInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-fileInfo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list fileInfo">
			
				<g:if test="${fileInfoInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="fileInfo.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${fileInfoInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileInfoInstance?.uploadKey}">
				<li class="fieldcontain">
					<span id="uploadKey-label" class="property-label"><g:message code="fileInfo.uploadKey.label" default="Upload Key" /></span>
					
						<span class="property-value" aria-labelledby="uploadKey-label"><g:fieldValue bean="${fileInfoInstance}" field="uploadKey"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fileInfoInstance?.fileFullPath}">
				<li class="fieldcontain">
					<span id="fileFullPath-label" class="property-label"><g:message code="fileInfo.fileFullPath.label" default="File Full Path" /></span>
					
						<span class="property-value" aria-labelledby="fileFullPath-label"><g:fieldValue bean="${fileInfoInstance}" field="fileFullPath"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:fileInfoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${fileInfoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
