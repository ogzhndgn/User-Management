<%--
  User: thePoet
  Date: 17.11.2013
  Time: 18:45
--%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <script src="<s:url value="/script/jquery-1.9.1.js"/>"></script>
    <script src="<s:url value="/script/jquery-ui.js"/>"></script>
    <script src="<s:url value="/script/ajax-insert.js"/>"></script>
    <script src="<s:url value="/script/jquery.maskedinput.js"/>"></script>
    <meta charset="utf-8"/>
    <title>User Management</title>
</head>
<body>

<form:form method="POST" action="${pageContext.request.contextPath}/update">
    <fieldset>
        <table>
            <form:hidden path="id"/>
            <tr>
                <td><form:label path="name">Name</form:label></td>
                <td><form:input path="name" id="name" cssClass="text ui-widget-content ui-corner-all"/></td>
            </tr>
            <tr>
                <td><form:label path="surname">Surname</form:label></td>
                <td><form:input path="surname" id="surname" cssClass="text ui-widget-content ui-corner-all"/></td>
            </tr>
            <tr>
                <td><form:label path="phone">Phone</form:label></td>
                <td><form:input path="phone" id="phone" cssClass="text ui-widget-content ui-corner-all"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </fieldset>
</form:form>


</body>
</html>