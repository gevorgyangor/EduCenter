<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Gor
  Date: 12.03.2018
  Time: 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Student</title>
</head>
<body>
<ul>
    <li><a>${user.name}</a></li>
    <li><a>${user.surname}</a></li>
    <li><a>${user.phone}</a></li>
    <li><a>${user.age}</a></li>
</ul>
<spring:form action="/changeStudentData" method="post" modelAttribute="user">

    <input type="hidden" name="${user.id}">
    <input type="text" name="name" placeholder="Please name"/><br>
    <input type="text" name="surname" placeholder="Please surname"/><br>
    <input type="text" name="phone" placeholder="Please phone"/><br>
    <input type="text" name="age" placeholder="Please age"/><br>
    <input type="submit" value="ok"/>
</spring:form>

</body>
</html>
