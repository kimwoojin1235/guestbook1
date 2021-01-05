<%@page import="com.javaex.vo.guestVo"%>
<%@page import="com.javaex.dao.guestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	
	guestDao guDao = new guestDao();
	
	guestVo guVo = guDao.getgusetWriting(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(password.equals(guVo.getPassword())) { 
			guDao.guestdelete(no);
			response.sendRedirect("./addList.jsp");
		}else{ %>
			비밀번호를 잘 못 입력하셨습니다.<br>
			<a href="./deleteForm.jsp?no=<%=no%>">비밀번호 다시 입력하기</a><br>
			<a href="./addList.jsp">메인으로 돌아가기</a>
		<% } %>
</body>
</html>