<%@page import="am.dao.EmpDAO"%>
<%@page import="am.vo.EmpVO"%>
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
	
	String s_no = request.getParameter("s_no");
	String s_name = request.getParameter("s_name");
	String s_job = request.getParameter("s_job");
	String s_sal = request.getParameter("s_sal");
	
	//넘어온 파라미터들을 저장할 VO객체를 생성한다.
	EmpVO vo = new EmpVO();
	//각 파라미터 값들이 공백을 제거하고 길이가 0보다 큰 경우에만 저장한다.
	if(s_no.trim().length()>0)
		vo.setEmpno(s_no);
	if(s_name.trim().length()>0)
		vo.setEname(s_name);
	if(s_job.trim().length()>0)
		vo.setJob(s_job);
	if(s_sal.trim().length()>0)
		vo.setSal(s_sal);
	
	boolean ch = EmpDAO.add(vo);
	if(ch)
		out.println("저장 완료");
	else
		out.println("저장 실패");
%>
</body>
</html>