<%@page import="am.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="am.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("s_no");
	String name = request.getParameter("s_name");
	String job = request.getParameter("s_job");
	String sal = request.getParameter("s_sal");
	
	EmpDAO.edit(no, name, job, sal);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h6>수정되었습니다.</h6>
</body>
</html>