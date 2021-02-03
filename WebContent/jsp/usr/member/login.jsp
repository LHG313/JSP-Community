<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="로그인" />
<%@ include file="../../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>


<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con flex flex-jc-c">
		<span><i class="fas fa-sign-in-alt"></i></span><span>${pageTitle}</span>
	</h1>
</div>

<div>
	<script>
		let DoLoginForm__submited = false;
		function DoLoginForm__submit(form) {
			if (DoLoginForm__submited) {
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
			DoLoginForm__submited = true;
		}
	</script>
	<form class="signUp" id="signupForm" action="doLogin" method="POST"
		onsubmit="DoLoginForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" /> <input type="hidden"
			name="afterLoginUrl" value="${param.afterLoginUrl}" />
			
		<h1 class="signUpTitle">로그인</h1>
		<input name="loginId"type="text" class="signUpInput"
			placeholder="로그인 아이디를 입력해주세요." autofocus required> <input name="loginPw"
			type="password" class="signUpInput" placeholder="로그인 비밀번호를 입력해주세요."
			required> <input type="submit" value="로그인!"
			class="signUpButton">
			<div class="inp_chk"> <!-- 체크시 checked 추가 -->
          <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
          <label for="keepLogin" class="lab_g">
<span class="img_top ico_check"></span>
<span class="txt_lab">로그인 상태 유지</span>
  </label>
        </div>
        <br>
        <span class="txt_find">
           <a href="../member/findLoginId" class="link_find">아이디</a>
            / 
           <a href="../member/findLoginPw" class="link_find">비밀번호 찾기</a>
           <a href="../member/join" class="link_find">회원가입</a>
         </span>
          
      </div>
			
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>