<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="${board.name} 댓글 수정" />
<%@ include file="../../part/head.jspf"%>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span> <i class="fas fa-newspaper"></i>
		</span> <span>${pageTitle}</span>
	</h1>
</div>

<div class="article-modify-form-box form-box padding-0-10 con-min-width">
	<div class="con">
		<script>
			let checkModifyForm_submited = false;
			function checkModifyForm_submit(form) {
				if (checkModifyForm_submited) {
					alert("처리중입니다.");
					return;
				}

				const editor = $(form).find('.toast-ui-editor').data(
						'data-toast-editor');
				const body = editor.getMarkdown().trim();

				if (body.length == 0) {
					alert('내용을 입력해주세요.');
					editor.focus();

					return;
				}

				form.body.value = body;

				form.submit();
				checkModifyForm_submited = true;
			}
		</script>
		<form action="doModify" method="POST"
			onsubmit="checkModifyForm_submit(this); return false;">
			<input type="hidden" name="id" value="${reply.id}"> <input
				type="hidden" name="body" />
			<div>
				<script type="text/x-template">${reply.body}</script>
				<div class="toast-ui-editor"></div>
			</div>
			<br>
			<div class="btn-wrap">
				<input class="btn btn-primary" type="submit" value="수정" />
				<button class="btn btn-info" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../../part/foot.jspf"%>