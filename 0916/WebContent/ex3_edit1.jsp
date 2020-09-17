<%@page import="am.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	//파라미터 받기(s_no, s_name, s_job, s_sal)
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	String s_job = request.getParameter("s_job");
	String s_sal = request.getParameter("s_sal");
	//type="text" 요소들은 입력하지 않아도 ""(공백)이 넘어온다. {value=""}가 기본값으로 존재
/*	out.println(s_no+"<br/>");
	out.println(s_name+"<br/>");
	out.println(s_job+"<br/>");
	out.println(s_sal+"<br/>");
*/
	boolean ch = EmpDAO.edit1(s_no, s_name, s_job, s_sal);
	if(ch){
		out.println("수정 완료!");
	}else{
		out.println("수정 실패!");
	}
%>
</body>
</html>