<%--
  User: thePoet
  Date: 10.11.2013
  Time: 16:24
--%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>User Management</title>
    <script src="<s:url value="/script/jquery-1.9.1.js"/>"></script>
    <script src="<s:url value="/script/jquery-ui.js"/>"></script>
    <script src="<s:url value="/script/ajax-insert.js"/>"></script>
    <script src="<s:url value="/script/jquery.maskedinput.js"/>"></script>
    <script src="<s:url value="/script/ajax-delete.js"/>"></script>
    <link rel="stylesheet" href="<s:url value="/style/style.css"/>"/>
    <link rel="stylesheet" href="<s:url value="/style/jquery-ui.css"/>"/>
</head>
<body>

<div id="dialog-form" title="Create new user">
    <p class="validateTips">All form fields are required.</p>
    <form:form id="newuserform" method="POST" action="${pageContext.request.contextPath}/add.json">
        <fieldset>
            <form:label path="name">Name</form:label>
            <form:input path="name" id="name" cssClass="text ui-widget-content ui-corner-all"/>
            <form:label path="surname">Surname</form:label>
            <form:input path="surname" id="surname" cssClass="text ui-widget-content ui-corner-all"/>
            <form:label path="phone">Phone</form:label>
            <form:input path="phone" id="phone" cssClass="text ui-widget-content ui-corner-all"/>
        </fieldset>
    </form:form>
</div>

<div id="dialog-confirm" title="Are you sure?" style="display: none">
    Record will be deleted. Are you sure?
</div>

<div id="users-contain" class="ui-widget">
    <h1>Existing Users:</h1>
    <table id="users" class="ui-widget ui-widget-content">
        <thead>
        <tr class="ui-widget-header ">
            <th>ID</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Phone</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
            <tr id="tr_id_${user.id}">
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.surname}"/></td>
                <td><c:out value="${user.phone}"/></td>
                <td><s:url value="${pageContext.request.contextPath}/updateForm/${user.id}" var="updateUrl"/><a href="${updateUrl}">Update</a></td>
                <td><s:url value="${pageContext.request.contextPath}/delete/${user.id}" var="deleteUrl"/><a id="deletelink" href="${deleteUrl}.json">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<button id="create-user">Add new user</button>
</body>
</html>