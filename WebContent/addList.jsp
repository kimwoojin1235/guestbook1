<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@ page import="com.javaex.dao.guestDao" %>
<%@ page import="com.javaex.vo.guestVo" %>

<%
guestDao gbDao = new guestDao();
	List<guestVo> guList = gbDao.getList();
	
	System.out.println(guList.toString());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form action="./add.jsp" method="get">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
					<td>비밀번호</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td colspan="4"> <textarea name="content"> </textarea> </td>
				</tr>
				<tr>
					<td colspan="4"> <button type="submit">확인</button></td>
				</tr>
			</table>
		</form>
		
		<br>
		<% for(int i=0; i<guList.size();i++) { %>
			<table border="1">
				<tr>
					<td><%= guList.get(i).getNo() %></td>
					<td><%= guList.get(i).getName() %></td>
					<td><%= guList.get(i).getRegdate() %></td>
					<td><a href="./deleteForm.jsp?no=<%=guList.get(i).getNo()%>">삭제</a></td>
				</tr>
				<tr>
					<td colspan="4"> <%= guList.get(i).getContent() %> </td>
				</tr>
			</table>
			<br>
		<%} %>
		
		
	</body>
</html>