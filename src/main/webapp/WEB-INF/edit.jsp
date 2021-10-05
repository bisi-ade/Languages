<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Language Page</title>
<link rel="stylesheet" href="https://bootswatch.com/4/superhero/bootstrap.css">
<style>
	.inline {
		display: inline-block;
	}
</style>
</head>
<body class="text-center">
		<header class="bg-dark p-3 mb-5">
		<h1>Edit Language Info</h1>
	</header>
	<form:form class="form w-50 m-auto" action="/languages/${ langup.id }" method="POST" modelAttribute="language">
		<input type="hidden" name="_method" value="put">
		<div class="form-group row">
			<form:label class="col-3" path="name">Name</form:label>
			<form:input class="form-control col-5" path="name" value="${ langup.name }"/>
			<form:errors class="col-4 text-danger" path="name" />
		</div>
		<div class="form-group row">
			<form:label class="col-3" path="creator">Creator</form:label>
			<form:input class="form-control col-5" path="creator" value="${ langup.creator }"/>
			<form:errors class="col-4 text-danger" path="creator"/>
		</div>
		<div class="form-group row">
			<form:label class="col-3" path="version">Version</form:label>
			<form:input class="form-control col-5" path="version" value="${ langup.version }"/>
			<form:errors class="col-4 text-danger" path="version"/>
		</div>
		<input type="submit" class="btn btn-success mt-2" value="Update Language">
	</form:form>
	<form class="inline" action="/languages/${ language.id  }" method="POST">
		<input type="hidden" name="_method" value="delete">
		<input type="submit" class="btn btn-danger mt-2" value="Delete">
	</form>

</body>
</html>