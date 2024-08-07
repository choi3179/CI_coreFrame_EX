<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>수정모드</title>
<script>
function list() {
  window.location.href="./city.jsp";
}

function save() {
  document.frm.submit();
}

</script>
</head>

<body>


<form name="frm" action="?" method="post">
<input type="hidden" name="cmd" value="update" />
<input type="hidden" name="id" value="<c:out value="${output.id}"/>" />


<fieldset class="control">
  <legend>제어부</legend>

  <span id="msg"></span>

  <span class="button"><input type="button" value="목록보기" onclick="list();"/></span> 
  <span class="button"><input type="button" value="저장" onclick="save();"/></span>
</fieldset>


<fieldset class="section">
<legend>기본속성</legend>
<table class="tbl detail">
<colgroup>
    <col width="30%" class="code"/>
    <col width="70%"/>
  </colgroup>
	<tr>
	<th><label for="name" accesskey="c">name</label> </th>
	<td><input id="name" type="text" name="name" value="${output.name}" /></td>
	</tr>
	
	<tr>
	<th><label for="country" accesskey="c">country</label> </th>
	<td><input id="country" type="text" name="country" value="${output.name}" /></td>
	</tr>
	
	<tr>
	<th><label for="airport" accesskey="c">airport</label> </th>
	<td><input id="airport" type="text" name="airport" value="${output.name}" /></td>
	</tr>
	
	<tr>
	<th><label for="language" accesskey="c">language</label> </th>
	<td><input id="language" type="text" name="language" value="${output.name}" /></td>
	</tr>	
</table>

</fieldset>


</form>


</body>
</html>