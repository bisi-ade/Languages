<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages index page</title>
<link rel="stylesheet" href="https://bootswatch.com/4/superhero/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="/js/script.js"></script>
<style>
	.tablediv {
		height: 450px;
	}
	table tr[data-href] {
    	cursor: pointer;
	}
	th {
		font-size: 1.2em;
	}
	.inline {
		display: inline-block;
	}
</style>
</head>
<body class="text-center">
<header class="bg-dark p-3 mb-5">
		<h1>Languages Index</h1>
	</header>
	<div class="tablediv mb-2">
	<table class="table table-borderless w-50 m-auto">
		<thead>
			<tr>
				<th>Name</th>
				<th>Creator</th>
				<th>Version</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ languages }" var="language">
			<tr data-href="/languages/${ language.id }">
				<td>${ language.name }</td>
				<td>${ language.creator }</td>
				<td>${ language.version }</td>
				<td>
					<a href="/languages/${ language.id }/edit" class="btn btn-warning btn-sm" onclick=event.stopPropagation()>Edit</a>
					 <form class="inline" action="/languages/${ language.id  }" method="POST">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" class="btn btn-danger btn-sm" onclick=event.stopPropagation() value="Delete">
					</form>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<h3 class="mb-4">Add A New Language</h3>
	<form:form class="form w-50 m-auto" action="/languages" method="POST" modelAttribute="language">
		<div class="form-group row">
			<form:label class="col-3" path="name">Name</form:label>
			<form:input class="form-control col-5" path="name"/>
			<form:errors class="col-4 text-danger" path="name"/>
		</div>
		<div class="form-group row">
			<form:label class="col-3" path="creator">Creator</form:label>
			<form:input class="form-control col-5" path="creator"/>
			<form:errors class="col-4 text-danger" path="creator"/>
		</div>
		<div class="form-group row">
			<form:label class="col-3" path="version">Version</form:label>
			<form:input class="form-control col-5" path="version"/>
			<form:errors class="col-4 text-danger" path="version"/>
		</div>
		<input type="submit" class="btn btn-success mt-2" value="Add Language">
	</form:form>

</body>
</html>