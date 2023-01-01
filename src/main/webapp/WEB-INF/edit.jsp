<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="d-flex justify-content-between">
		<h1>Edit Expense</h1> 
		<a href="/expenses">Go Back</a>
	</div>
	<form:form modelAttribute="travelObj" action="/expenses/edit/${travelObj.id}" method="POST">
		<input type="hidden" name="_method" value="put" >
		<!-- modelAttrivute matches @modelAttribute in @Getmapping BookController -->
		<div class="form-group">
			<form:label path="expense" class="form-label">Expense name:</form:label>
			<form:errors path="expense" class="text-danger" />
			<form:input path="expense" id="" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="vendor" class="form-label">Vendor:</form:label>
			<form:errors path="vendor" class="text-danger" />
			<form:input path="vendor" id="" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="amount" class="form-label">Amount:</form:label>
			<form:errors path="amount" class="text-danger" />
			<form:input type="number" step="0.01"  path="amount" id="" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="description" class="form-label">Description:</form:label>
			<form:errors path="description" class="text-danger" />
			<form:textarea path="description" id="" class="form-control"/>
		</div>
		<input type="submit" value="submit"/>
		<!-- submit button doesn't need form tag -->
		<!-- path names have to match member variables -->
	</form:form>
</body>
</html>