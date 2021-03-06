<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="로그인아이디 찾기" />
<%@ include file="../../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>


<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con flex flex-jc-c">
		<span><i class="far fa-address-card"></i></span><span>${pageTitle}</span>
	</h1>
</div>

<div>
	<script>
		let DoFindLoginIdForm__submited = false;
		function DoFindLoginIdForm__submit(form) {
			if (DoFindLoginIdForm__submited) {
				alert('처리중입니다.');
				return;
			}
			form.loginId.value = form.loginId.value.trim();
			if (form.loginId.value.length == 0) {
				alert('로그인 아이디를 입력해주세요.');
				form.loginId.focus();
				return;
			}
			form.loginPw.value = form.loginPw.value.trim();
			if (form.loginPw.value.length == 0) {
				alert('로그인 비밀번호를 입력해주세요.');
				form.loginPw.focus();
				return;
			}
			form.loginPwReal.value = sha256(form.loginPw.value);
			form.loginPw.value = "";
			form.submit();
			DoFindLoginIdForm__submited = true;
		}
	</script>
	<form class="signUp" id="signupForm" action="doFindLoginId" method="POST"
		onsubmit="DoFindLoginIdForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" />
		
		<h1 class="signUpTitle">아이디 찾기</h1>
		<div>
			<div>이름</div>
			<div>
				<input name="name" type="text" class="signUpInput" maxlength="50"
					placeholder="이름을 입력해주세요." />
			</div>
		</div>

		

		<div>
			<div>이메일</div>
			<div>
				<input name="email" type="email" class="signUpInput" maxlength="50"
					placeholder="회원의 이메일주소를 입력해주세요." />
			</div>
		</div>


		<div>
		<input type="submit" value="아이디 찾기"
			class="signUpButton">
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>