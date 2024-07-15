<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="coreframe.data.*"%>
<%@ page import="java.util.Enumeration" %>

<%
	InteractionBean interact = new InteractionBean();

	int pageSize 	= 5; 	// 한 페이지에 나올 데이터 갯수
	int pageBlock 	= 5;	// 한 블록에 보일 페이지 갯수

	int cPage 		= Integer.parseInt(request.getParameter("page"));	// 현재 페이지

	DataSet input = interact.getDataSet(request);
	DataSet output = new DataSet();

	DataSet output2 = new DataSet();
	interact.execute("samples/database/countCity", input, output2);

	System.out.println("[CHOI] list.jsp(my BLD DB) >> " + output2.getInt("cnt") + " && " + cPage);
	int totalCount = output2.getInt("cnt");		// 총 데이터 개수
	int totalPage = (totalCount / pageSize) + (totalCount % pageSize == 0 ? 0 : 1);		// 전체 페이지 개수

	int startPageNum = ((cPage-1) / pageBlock) * pageBlock + 1;		// 현재 보고 있는 페이지의 블록의 시작 페이지 번호
	int endPageNum = ((cPage-1) / pageBlock) * pageBlock + pageBlock;
	if(endPageNum > totalPage)
		endPageNum = totalPage;

	/*Enumeration params = request.getParameterNames();
	while(params.hasMoreElements()) {
		String name = (String) params.nextElement();
		System.out.println("[CHOI] list.jsp >> " + name + " : " + request.getParameter(name) + "     ");
	}*/
	
	if ("delete".equals(request.getParameter("cmd")))
		interact.execute("samples/database/deleteCity", input);
	interact.execute("samples/database/listCities", input, output);

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
			for (int i = 0, n = output.getCount("id"); i < pageSize; i++) {
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
		<%
			// Previous 버튼은 블록의 첫 번째 번호가 블록 개수가 클 경우에만 보임
			if ( startPageNum > pageBlock ) {
		%>
		<li class="page-item">
			<a class="page-link" href="./list.jsp?page=<%=startPageNum - 1%>">Previous</a>
		</li>
		<% } %>

		<% for (int i = startPageNum; i <= endPageNum; i++) {%>
		<li class="page-item">
			<a class="page-link" href="list.jsp?page=<%=i %>"><%=i%></a></li>
		<% }%>
		<%
			// 전체 페이지 개수가 현재 블록의 마지막 페이지 번호보다는 클 경우 Next 버튼이 보임
			if (totalPage > endPageNum) {
		%>
		<li class="page-item">
			<a class="page-link" href="./list.jsp?page=<%=endPageNum + 1%>">Next</a>
		</li>
		<% } %>
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