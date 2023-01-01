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
		<h1>SAVE TRAVELS</h1>
	<table class="table table-dark">
	    <thead>
	        <tr>
	            <th>Expense</th>
	            <th>Vendor</th>
	            <th>Amount</th>
	            <th>Actions</th>
	        </tr>
	    </thead>
	    <tbody>
	         <!-- loop over all the books to show the details as in the wireframe! -->
	        <c:forEach var="travel" items="${travels}">
	   			<tr>
	    		 	<td> 
	    		 		<a href="/travels/${travel.id}">
	    		 			<c:out value="${travel.expense}" /> 
	    		 		</a>
	    		 	</td>
	    		 	<td> <c:out value="${travel.vendor}" /> </td>
	     			<td> $<c:out value="${travel.amount}" /></td>
	     			<td> 
	     				<a class="btn btn-primary" href="/expenses/edit/${travel.id}"> edit</a>
	     				<form action="/expenses/${travel.id}" method="POST">
	     					<input type="hidden" name="_method" value="delete" >
	     					<button class="btn btn-danger">DELETE</button>
	     				</form>
	     			</td>
	  			</tr>
	 		</c:forEach>
	    </tbody>
	</table>
	<form:form modelAttribute="aTravel" action="/expenses" method="POST">
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