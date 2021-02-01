<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="${article.extra__boardName} 게시물 상세페이지" />
<%@ include file="../../part/head.jspf"%>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span><i class="fas fa-search-plus"></i></span><span>${pageTitle}</span>
	</h1>
</div>

<div>
	번호 : ${article.id} <br /> 작성날짜 : ${article.regDate} <br /> 갱신날짜 :
	${article.updateDate} <br /> 작성자 : ${article.extra__writer} <br /> 제목
	: ${article.title}
	<hr />
	<script type="text/x-template">${article.body}</script>
	<div class="toast-ui-viewer"></div>
</div>

<hr />

<div>
	<a href="list?boardId=${article.boardId}">리스트로 이동</a> <a
		href="modify?id=${article.id}">수정</a> <a
		onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
		href="doDelete?id=${article.id}">삭제</a>
</div>

<%@ include file="../../part/foot.jspf"%>