<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>도시정보 보기</title>
</head>

<body>

<table class="tbl detail">
  <colgroup>
    <col class="code"/>
    <col/>
    <col class="code"/>
    <col/>
  </colgroup>
  <tr>
    <th>ID</th>
    <td><c:out value="${output.id}"/></td>
    <th>name</th>
    <td><c:out value="${output.name}"/></td>
  </tr>
  <tr>
    <th>국가명</th>
    <td><c:out value="${output.country}"/></td>
    <th>국가ISO코드</th>
    <td><c:out value="${output.countryIsoCode}"/></td>
  </tr>
  <tr>
    <th>공항</th>
    <td><c:out value="${output.airport}"/></td>
    <th>언어</th>
    <td><c:out value="${output.language}"/></td>
  </tr>
</table>

</body>
</html>