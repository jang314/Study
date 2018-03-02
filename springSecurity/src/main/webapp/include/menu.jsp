<%@page import="com.javalec.spring.model.MemberInfo"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
<link rel = "stylesheet" href="/spring/resources/css/menu2.css">
</head>
<body>
<div id="header">
	<div class="title">
			<sec:authorize access="isAnonymous()">
			로그인 후에 이용 가능합니다.
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				${userInfo.username}님 환영합니다.
			</sec:authorize>
	</div>	
	
	<div class="links">
	<ul>
		<li>
		<sec:authorize access="isAuthenticated()">
			<form:form action="${pageContext.request.contextPath}/logout" method="POST"> 
				<input type="submit" class="logout_btn"  value="로그아웃" />
			</form:form> 
		</sec:authorize>
		</li>

	<sec:authorize access="isAnonymous()">
			<li><a href="/spring//loginForm">로그인</a></li>
			<li><a href="#">회원가입</a></li>
	</sec:authorize>

	<!-- 관리자 권한 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="#">회원관리</a></li>
			<li><a href="#">판매자관리</a></li>
			<li><a href="#">상품관리</a></li>
			<li><a href="#">주문관리</a></li>
	</sec:authorize>
	
	<!-- 판매자 권한 -->
	<sec:authorize access="hasRole('ROLE_VENDOR')">
		<li><a href="#">마이페이지</a></li>
		<li><a href="#">상품관리</a></li>
		<li><a href="#">주문관리</a></li>
	</sec:authorize>
	
	<!-- 회원 권한 -->
	<sec:authorize access="hasRole('ROLE_USER')">
			<li><a href="#">마이페이지</a></li>
			<li><a href="#">장바구니</a></li>
			<li><a href="#">주문내역</a></li>
			<li><a href="#">Q & A</a></li>
	</sec:authorize>
	</ul>
	</div>
</div>
<div id="logo">
		<div id="logo_title">
			<ul>
				<li>
					<img src="/spring/resources/img/그림1.png" class="logo_img"/>
				</li>
			</ul>
		</div>
		<div id="logo_search">
		<ul>
			<li>
					<input type="button" value="● 벼룩시장 판매자 등록">
			</li>
		</ul>
			<ul>
				<li>
					<input type="text"/>
				</li>
			</ul>
			<ul>
				<li><a href="#">♥ 즐겨찾기</a>	<a href="#">♥ 시작 페이지로</a></li>
			</ul>
		</div>
</div>
	<div id="topMenu" > 
		<ul>
			 <li><a class="menuLink" href="#">소개</a> 
			 		<ul class="submenu">
			 				<li><a href="#">홈페이지</a></li>
			 				<li><a href="#" >About Me</a></li>
			 		</ul>
			 </li>
			 <li><a class="menuLink" href="#">공지사항</a></li>
			 <li><a class="menuLink" href="#">프로젝트</a>
			 <ul class="submenu">
			 				<li><a href="#">studying</a></li>
			 				<li><a href="#" >project</a></li>
			 		</ul>
			 </li> 
			 <li><a class="menuLink" href="#">커뮤니티</a>
			 <ul class="submenu">
			 				<li><a href="#">준회원 게시판</a></li>
			 				<li><a href="#" >정회원 게시판</a></li>
			 		</ul>
			 </li> 
			 <li><a class="menuLink" href="#">마켓</a>
			 <ul class="submenu">
			 				<li><a href="#">플리마켓</a></li>
			 				<li><a href="#" >벼룩시장</a></li>
			 		</ul>
			 </li> 
		</ul> 
</div>
</body>
</html>