<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel = "stylesheet" href="/spring/resources/css/member1.css">
</head>
<body>
<%@ include file="/include/menu.jsp" %>

<c:url var="loginUrl" value="/login" />
<form action="${loginUrl}"id="member" method="post" >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table class="login_table" >
		<caption>로그인</caption>
		<tr>
				<td>
						<input type="text" id="username" name="username"  placeholder="아이디"/>
				</td>
		</tr>
		<tr>
				<td>
						<input type="password" id="password" name="password" placeholder="비밀번호"/>
				</td>
		</tr>
		<tr>
				<td>
				<c:if test="${param.error != null }">
      			  <h2>Username/Password not corrrect</h2>
      			  <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL }">
        				message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
       			 </c:if>
</c:if>
				</td>
		</tr>
		<tr>
				<td>
							<input type="checkbox"  id="idSaveCheck" name="idSaveCheck"/>아이디 저장하기
				</td>
		</tr>
		<tr>
				<td class="buttons">
							<input type="submit"  value="로그인"/>
				</td>
		</tr>
		<tr class="buttons">
				<td>
							<a href="register">회원가입</a>&nbsp;&nbsp;|
							<a href="javascript:openFindMember();" >아이디/비밀번호 찾기</a>
				</td>
		</tr>
		</table>
</form>
</body>
</html>