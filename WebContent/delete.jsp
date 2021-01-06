<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.guestDao" %>
<%@ page import="com.javaex.vo.guestVo" %>

<%
request.setCharacterEncoding("utf-8");
int no = Integer.parseInt(request.getParameter("no"));
String password = request.getParameter("password");

guestDao guDao = new guestDao();

guestVo gVo = guDao.getgusetWriting(no);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%if(password.equals(gVo.getPassword())) { 
			guDao.guestdelete(no);
			response.sendRedirect("./addList.jsp");
		}else{ %>
			비밀번호를 잘못 입력했습니다.<br>
			<a href="./deleteForm.jsp?no=<%=no%>">비밀번호 다시 입력</a><br>
			<a href="./addList.jsp">메인으로</a>
		<% } %>
</html>