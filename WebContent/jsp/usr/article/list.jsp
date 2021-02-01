<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="${board.name} 게시물 리스트" />
<%@ include file="../../part/head.jspf"%>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span><i class="far fa-list-alt"></i></span><span>${pageTitle}</span>
	</h1>
</div>
<hr />

<div>
	<script>
		let DoSearchForm__submited = false;
		function DoSearchForm__submit(form) {
			if (DoSearchForm__submited) {
				alert('처리중입니다');
				return;
			}
			form.searchKeyword.value = form.searchKeyword.value.trim();
			if (form.searchKeyword.value.length == 0) {
				alert('검색어를 입력해주세요.');
				form.searchKeyword.focus();
				return;
			}
			form.submit();
			DoSearchForm__submited = true;
		}
	</script>
	<form onsubmit="DoSearchForm__submit(this); return false;">
		<input type="hidden" name="boardId" value="${param.boardId}" /> <select
			name="searchKeywordType">
			<option value="titleAndBody">제목+본문</option>
			<option value="title">제목</option>
			<option value="body">본문</option>
		</select>
		<script>
			const param__searchKeywordType = '${param.searchKeywordType}';
			if (param__searchKeywordType) {
				$('select[name="searchKeywordType"]').val(
						param__searchKeywordType);
			}
		</script>
		<input value="${param.searchKeyword}" type="text" name="searchKeyword"
			placeholder="검색어를 입력해주세요." /> <input type="submit" value="검색" />
	</form>
</div>

<hr />

<div>총 게시물 수 : ${totalCount}</div>

<hr />

<div class="article-list-box padding-0-10 con-min-width">
		<div class="con">
			<table>
				<colgroup>
					<col width="100">
					<col width="200">
					<col width="150">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>날짜</th>
						<th>작성자</th>
						<th>제목</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="article" items="${articles}">
					<tr>
						<td><span class="article-list-box__id">${article.getId()}</span></td>
						<td><span class="article-list-box__reg-date">
								${article.getRegDate()} </span></td>
						<td><span class="article-list-box__writer"> ${article.getExtra__writer()} </span></td>
						<td><a href="detail?articleId=${article.id}" class="article-list-box__title hover-link">
								${article.getTitle()} </a></td>
						<td class="visible-sm-down">
							<div class="flex">
								<span class="article-list-box__id article-list-box__id--mobile">${article.getId()}</span>

								<a href="detail?articleId=${article.id}"
									class="article-list-box__title article-list-box__title--mobile flex-grow-1 hover-link">
									${article.getTitle()}
									
									</a>
							</div>
	
								<div class="flex">
									<span
										class="article-list-box__writer article-list-box__writer--mobile">${article.getExtra__writer()}</span>
									<span>|</span> <span
										class="article-list-box__reg-date article-list-box__reg-date--mobile">
										${article.regDate}
										</span>
							</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

<style>
.red {
	color: red;
}
</style>

<div class="con">
	<!--
	<c:set var="aUrl" value="?page=1&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a href="${aUrl}">◀◀</a>
	-->

	<c:if test="${pageBoxStartBeforeBtnNeedToShow}">
		<c:set var="aUrl"
			value="?page=${pageBoxStartBeforePage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
		<a href="${aUrl}">◀</a>
	</c:if>
	<c:forEach var="i" begin="${pageBoxStartPage}" end="${pageBoxEndPage}"
		step="1">
		<c:set var="aClass" value="${page == i ? 'red' : ''}" />
		<c:set var="aUrl"
			value="?page=${i}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
		<a class="${aClass}" href="${aUrl}">${i}</a>
	</c:forEach>

	<c:if test="${pageBoxEndAfterBtnNeedToShow}">
		<c:set var="aUrl"
			value="?page=${pageBoxEndAfterPage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
		<a href="${aUrl}">▶</a>
	</c:if>

	<!--
	<c:set var="aUrl" value="?page=${totalPage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a href="${aUrl}">▶▶</a>
	-->
</div>

<hr />
<hr />
<hr />
<hr />
<hr />

<div class="article-btn-box padding-0-10 con-min-width">
	<div class="con btn-wrap">
		<a class="btn btn-primary" href="write?boardId=${param.boardId}">WRITE</a>
		<button class="btn btn-info" onclick="history.back();">뒤로가기</button>
	</div>
</div>

<%@ include file="../../part/foot.jspf"%>