<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Language Page</title>
<link rel="stylesheet" href="https://bootswatch.com/4/superhero/bootstrap.css">
<style>
	form {
		display: inline-block;
	}
</style>
</head>
<body class="text-center">
		<header class="bg-dark p-3 mb-5">
		<h1><c:out value="${ language.name }"/></h1>
	</header>
	<div class="row w-50 m-auto">
		<div class="col">
			<h3>Creator</h3>
		</div>
		<div class="col">
			<h3>Version</h3>
		</div>
	</div>
	<div class="row w-50 m-auto">
		<div class="col">
			<h3><c:out value="${ language.creator }"/></h3>
		</div>
		<div class="col">
			<h3><c:out value="${ language.version }"/></h3>
		</div>
	</div>
	<a href="/languages/${ language.id }/edit" class="btn btn-warning mt-5 mr-2">Edit</a>
	<form action="/languages/${ language.id  }" method="POST">
		<input type="hidden" name="_method" value="delete">
		<input type="submit" class="btn btn-danger mt-5 mr-2" value="Delete">
	</form>
	<a href="/languages" class="btn btn-info mt-5">Dashboard</a>

</body>
</html>