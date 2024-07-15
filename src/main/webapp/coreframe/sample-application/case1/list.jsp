<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="coreframe.data.*"%>
<%@ page import="java.util.Enumeration" %>

<%
	InteractionBean interact = new InteractionBean();
	int startPage = 1;
	int endPage = 10;
	int totalPages = 2;

	DataSet input = interact.getDataSet(request);
	DataSet output = new DataSet();

	Enumeration params = request.getParameterNames();
	while(params.hasMoreElements()) {
		String name = (String) params.nextElement();
		System.out.println("[CHOI] list.jsp >> " + name + " : " + request.getParameter(name) + "     ");
	}

	if ("delete".equals(request.getParameter("cmd")))
		interact.execute("samples/database/deleteCity", input);
	interact.execute("samples/database/listCities", input, output);
	//totalPages = output.getCount("id") / 5

	DataSet output2 = new DataSet();
	interact.execute("samples/database/countCity", input, output2);

	System.out.println("[CHOI] list.jsp(my BLD DB) >> " + output2.getInt("cnt"));
%>

<html>
<head>
<title>BLD및 JSP를 이용한 coreframe 개발방법(case1): 목록예제</title>
<meta name="keywords"
	content="coreframe, framework, developement, web standard" />
<meta name="description"
	content="coreframe을 통한 개발방법중  BLD및 JSP 만을 이용한 개발방법입니다." />
<meta name="author"
	content="Sungkwon Kim, manpower@cyber-i.com, CyberImagination,Inc." />	
</head>


<body>
<form action="" method="post" class="boardListForm">
<fieldset><legend>게시물 목록</legend>

<table cellspacing="0" class="tbl" summary="List of Cities">
	<colgroup>
		<col width="5%" class="code" />
		<col width="20%"/>
		<col width="20%"/>
		<col width="10%"/>
		<col width="20%"/>
		<col width="25%"/>
	</colgroup>

	<thead>
		<tr>
			<th scope="col">id</th>
			<th scope="col">name</th>
			<th scope="col">country</th>
			<th scope="col">airport</th>
			<th scope="col">language</th>
			<th scope="col">action</th>
		</tr>
	</thead>
	<tbody>
		<%
			for (int i = 0, n = output.getCount("id"); i < 5; i++) {
				String id = output.getText("id", i);
		%>
		<tr>
			<td><%=id%></td>
			<td><a href="./view.jsp?id=<%=id%>"><%=output.getText("name", i)%></a></td>
			<td><%=output.getText("country", i)%></td>
			<td><%=output.getText("airport", i)%></td>
			<td><%=output.getText("language", i)%></td>
			<td>			
			<span class="btn_pack medium icon">
				<span class="update">
				</span>
			<button type="button" onclick="update('<%=id%>');">update</button>
			</span>
			
			<span class="btn_pack medium icon">
				<span class="delete">
				</span>
			<button type="button" onclick="del('<%=id%>');">delete</button>
			</span>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</fieldset>

<div id="searchbarbg">
<div id="searchbar">
	<span class="b rightTab">검색 조건</span>	
	<select name="searchType">
	<option>제목+내용</option>
	<option>제목</option>
	<option>내용</option>
	</select> 
	
	<input name="btn" type="text" class="inputText" title="검색" /> 
	 <span class="btn_pack medium">
		<button >search</button>
	</span>
</div>
</div>

</form>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<% if (startPage == 1) {%>
		<li class="page-item disabled"><a class="page-link" href="#"
										  tabindex="-1" aria-disabled="true">Previous</a></li>
		<% } else {%>
		<li class="page-item"><a class="page-link"
								 href="list.jsp?page=<%=startPage - 1%>" tabindex="-1"
								 aria-disabled="true">Previous</a></li>
		<% }%>
		<% for (int i = startPage; i <= endPage; i++) {%>
		<li class="page-item">
			<a class="page-link" href="list.jsp?page=<%=i %>"><%=i%></a></li>
		<% }%>
		<%
			// 마지막 페이지 숫자와 startPage에서 pageLength 더해준 값이 일치할 때
			// (즉 마지막 페이지 블럭일 때)
			if (totalPages == endPage) {
		%>
		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		<% } else {%>
		<li class="page-item">
			<a class="page-link" href="./list.jsp?page=<%=endPage + 1%>">Next</a>
		</li>
		<% }%>
	</ul>
</nav>

<script type="text/javascript">
	//<![CDATA[
	function view(id) {
		window.location.href = './view.jsp?id=' + id;
	}

	function update(id) {
		window.location.href = './update.jsp?id=' + id;
	}

	function del(id) {
		if (window.confirm('삭제하시겠습니까?')) {
			window.location.href = '?cmd=delete&id=' + id;
		}
	}
	//]]>
</script>
</body>
</html>