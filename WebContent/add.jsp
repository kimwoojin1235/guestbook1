
<%@page import="com.javaex.vo.GuestVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.javaex.dao.GuestDao"%>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String password = request.getParameter("password");
String content = request.getParameter("content");
	
GuestVo guVo =new GuestVo(name,password,content);

GuestDao guDao = new GuestDao();
guDao.guestinsert(guVo);

	
response.sendRedirect("./addList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>