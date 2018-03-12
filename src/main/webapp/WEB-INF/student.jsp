<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student</title>
</head>
<body>
<c:forEach items="${subjects}" var="subject">
    <ul>
        <li><a href="/getSubjectId?id=${subject.id}">${subject.name}</a></li>
        <li>${subject.description}</li>
    </ul>
</c:forEach>
</body>
</html>
