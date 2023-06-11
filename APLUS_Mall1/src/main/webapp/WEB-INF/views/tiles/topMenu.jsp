<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c태그라이브러리 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>
/* 중앙정렬 (로고적용) */
.center {
	text-align: center;
}
</style>


<body>
	<div class="wrapper"> <!-- 화면전체영역 -->
		<div id="header_wrap"> <!-- 헤더전체영역 -->
			<div id="top_menu_area"> <!-- 탑메뉴영역 -->
				<div id="top_menu_left">
					<ul>
						<li><a href="#">매장안내</a></li>
						<li><a href="/event">이벤트</a></li>
					</ul>
				</div>
				<div id="top_menu_right">
					<ul>
						<li> <!-- 로그인버튼위치 > 로그인 후 > 회원이름 / 관리자 로 변경 -->
							<c:choose>
									<c:when test="${admin eq 0}">${name} 님</c:when>
									<c:when test="${admin eq 1}">관리자</c:when>
							</c:choose> 
								
							<c:if test="${name == null}">
								<a href="/login">로그인</a>
							</c:if>
						</li>
						
						<li> <!-- 회원가입 버튼 위치 > 로그인 후 > 로그아웃 버튼으로 변경 -->
							<c:if test="${name != null}">
								<a href="/logout">로그아웃</a>
							</c:if> 
							<c:if test="${name == null}">
								<a href="/join">회원가입</a>
							</c:if>
						</li>
						
						<li> <!-- 마이페이지 버튼 위치 > 로그인 후 마이페이지 / 관리자 페이지로 변경 -->
							<c:choose>
								<c:when test="${admin eq 0}">
									<a href="/mymain">마이페이지</a>
								</c:when>
								<c:when test="${admin eq 1}">
									<a href="/adminMain">관리자페이지</a>
								</c:when>
							</c:choose> 
							
							<c:if test="${name == null}"> <!-- 로그인 안 되어있을땐 로그인페이지로 이동하도록 구현 -->
								<a href="/login">마이페이지</a>
							</c:if>
						</li>
						
						<li> <!-- 장바구니 버튼 위치 -->
							<a href="/cart">장바구니</a>
						</li>
					</ul>
				</div>
			</div> <!-- 탑메뉴영역끝 -->
			
			<div id="logo_area"> <!-- 로고영역 -->
				<div id="logo">
					<a href="main"> 
						<img width="310" height="110" class="center" src="../resources/img/apluslogo.png" />
					</a>
				</div>
			</div> <!-- 로고영역끝 -->
		</div> <!-- 헤더전체영역끝 -->
	</div> <!-- 화면전체영역끝 -->
</body>
</html>