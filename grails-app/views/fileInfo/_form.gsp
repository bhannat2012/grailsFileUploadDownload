<%@ page import="com.FileInfo" %>



<div class="fieldcontain ${hasErrors(bean: fileInfoInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="fileInfo.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileName" maxlength="50" required="" value="${fileInfoInstance?.fileName}"/>
</div>

<fieldset class="form">
    <input type="file" name="file" />
</fieldset>

