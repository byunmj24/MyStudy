<%@page import="mybatis.vo.MemoVO"%>
<%@page import="mybatis.dao.MemoDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{ font-size: 12px }
	table{
		border-collapse: collapse;
		width: 500px;
	}
	table th, table tbody td{
		border: 1px solid black;
		padding: 4px;
	}
	table thead tr:first-child{ line-height: 40px; }
	table thead td:last-child{ text-align: right; }
	table caption { text-indent: -9999px; height: 0; }
	.h70{
		height:70px;
		line-height:70px;
		text-align:center;
	}
</style>
</head>
<body>
	<h1>메모 검색 결과</h1>
	<table>
		<colgroup>
			<col width="60px"/> <!-- 번호 -->
			<col width="*"/> <!-- 내용 -->
			<col width="100px"/> <!-- 글쓴이 -->
			<col width="100px"/> <!-- 글쓴날짜 -->
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>글쓴이</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
<% 			
			request.setCharacterEncoding("utf-8");
			String value = request.getParameter("searchValue");
			String type = request.getParameter("searchType");
			List<MemoVO> list = MemoDAO.search(type, value);
			if(list.size()>0){
				for(MemoVO vo : list){
%>
			<tr>
				<td><%=vo.getIdx()%></td>
				<td><a href="memoView.jsp?idx=<%=vo.getIdx()%>"><%=vo.getContent()%></a></td>	
				<td><%=vo.getWriter()%></td>
				<td><%=vo.getReg_date()%></td>
			</tr>
<% 
				}
			} else {
				//목록이 하나도 없는 경우
%>
			<tr>
				<td colspan="4" class="h70">검색된 메모가 없습니다.</td>
			</tr>
<%
			}
%>			
		</tbody>	
	</table>
</body>
</html>