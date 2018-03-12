<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager</title>
</head>
<body>
<h4>Add Student</h4>
<spring:form action="/addStudent" method="post" modelAttribute="user">
    <spring:label path="name">Name:</spring:label><br>
    <spring:input path="name"/><br>
    <spring:label path="surname">Surname:</spring:label><br>
    <spring:input path="surname"/><br>
    <spring:label path="age">Age:</spring:label><br>
    <spring:input path="age"/><br>
    <spring:label path="phone">Phone:</spring:label><br>
    <spring:input path="phone"/><br>
    <spring:label path="Email">Email:</spring:label><br>
    <spring:input path="email"/><br>
    <spring:label path="password">Password:</spring:label><br>
    <spring:input path="password"/><br>
    <c:forEach items="${subjects}" var="subject">
        <input type="checkbox" name="${subject.name}" value="${subject.id}"/><br>
    </c:forEach>
    <input type="submit" value="Add Student"/>
</spring:form>
<h4>Add Subject</h4>
<spring:form action="/addSubject" method="post" modelAttribute="subject">
    <spring:label path="name">Name:</spring:label><br>
    <spring:input path="name"/><br>
    <spring:label path="description">Description:</spring:label><br>
    <spring:input path="description"/><br>
    <spring:label path="lecturer">Lecturer:</spring:label><br>
    <spring:input path="lecturer"/><br>
    <spring:label path="price">Phone:</spring:label><br>
    <spring:input path="price"/><br>
    <c:forEach items="${users}" var="user">
        <input type="checkbox" name="${user.name}" value="${user.id}"/><br>
    </c:forEach>
    <input type="submit" value="Add Student"/>
</spring:form>
<h4>Change Student</h4>
<c:forEach items="${users}" var="user">
    <ul>
        <li><a href="/changeStudent?id=${user.id}">${user.name} ${user.surname}</a></li>
    </ul>
</c:forEach>
<h4>Delete Student</h4>
<c:forEach items="${users}" var="user">
    <ul>
        <li>${user.name} ${user.surname} <a href="/deleteStudent?id=${user.id}">X</a></li>
    </ul>
</c:forEach>
</body>
</html>
