<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="로그인비번 찾기" />
<%@ include file="../../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span><i class="fas fa-key"></i></span><span>${pageTitle}</span>
	</h1>
</div>

<div>
	<script>
		let DoFindLoginPwForm__submited = false;
		function DoFindLoginPwForm__submit(form) {
			if (DoFindLoginPwForm__submited) {
				alert('처리중입니다.');
				return;
			}
			form.loginPw.value = form.loginPw.value.trim();
			if (form.loginPw.value.length == 0) {
				alert('로그인 아이디를 입력해주세요.');
				form.loginPw.focus();
				return;
			}
			if (form.loginPw.value == form.loginPwReal.value) {
				alert('비밀번호를 바꿔주시길 바랍니다.');
				form.loginPw.focus();
				return;
			}
			form.loginPwReal.value = sha256(form.loginPw.value);
			form.loginPw.value = "";
			form.submit();
			DoFindLoginPwForm__submited = true;
		}
	</script>
	<form action="doFindLoginPw" method="POST"
		onsubmit="DoFindLoginPwForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" />
		<hr />
		<div>
			<div>로그인아이디</div>
			<div>
				<input name="loginId" type="text" maxlength="50"
					placeholder="로그인아이디를 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>이메일</div>
			<div>
				<input name="email" type="email" maxlength="50"
					placeholder="가입시 입력한 이메일을 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>로그인비번 찾기</div>
			<div class="btn-wrap">
				<button type="submit" value="로그인비번찾기" class="btn btn-success" href="#">로그인비번찾기</button>
				<button class="btn btn-info" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>