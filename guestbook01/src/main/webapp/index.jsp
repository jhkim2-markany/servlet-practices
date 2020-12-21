<%@page import="java.util.List" %>	<!-- 지시자, 웹컨테이너가 jsp 페이지를 처리할 때 필요한 정보를 기술 -->
<%@page import="com.bitacademy.guestbook.dao.GuestbookDao" %>
<%@page import="com.bitacademy.guestbook.vo.GuestbookVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<GuestbookVo> list = new GuestbookDao().findAll();
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="add.jsp" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
				<td>비밀번호</td><td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="message" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE="등록"></td>
			</tr>
		</table>
	</form>

	<br>
	<%	int count = 1;
		for(GuestbookVo vo : list){
	%>
	<table width=510 border=1>
		<tr >
			<td>[<%= count %>]</td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getDate() %></td>
			<td ><a  href="/guestbook01/deleteform.jsp?no=<%=vo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=vo.getMessage() %></td>
		</tr>
	</table>
	<% count++;
		}
	%>
</body>
</html>