<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.GuestDao" %>
<%@ page import="com.javaex.vo.GuestVo" %>

<%
	request.setCharacterEncoding("utf-8");
int no = Integer.parseInt(request.getParameter("no"));
String password = request.getParameter("password");

GuestDao guDao = new GuestDao();

GuestVo gVo = guDao.getgusetWriting(no);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%if(password.equals(gVo.getPassword())) {%>
			guDao.guestdelete(no);
			response.sendRedirect("./addList.jsp");
		<% } %>
</html>