<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.GuestDao" %>
<%@ page import="com.javaex.vo.GuestVo" %>

<%
request.setCharacterEncoding("utf-8");
int on = Integer.parseInt(request.getParameter("no"));
String password = request.getParameter("password");

GuestVo guVo =new GuestVo(on,password); 

GuestDao guDao = new GuestDao();
guDao.guestdelete(guVo);
response.sendRedirect("./addList.jsp");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
</html>