<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Students By Subject</title>
</head>
<body>
<c:forEach items="${users}" var="user">
    <ul>
        <li>${user.name} </li>
        <li>${user.surname} </li>
        <li>${user.age} </li>
        <li>${user.phone} </li>
        <li>${user.email} </li>
    </ul>
</c:forEach>
</body>
</html>
