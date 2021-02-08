<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="가입하기" />
<%@ include file="../../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con flex flex-jc-c">
		<span><i class="far fa-hand-pointer"></i></span><span>${pageTitle}</span>
	</h1>
</div>
<div>
	<script>
	let DoJoinForm__submited = false;
	let DoJoinForm__checkedLoginId = "";
	
	// 로그인 아이디 중복체크
	function DoJoinForm__checkLoginIdDup(el) {
		const from = $(el).closest('form').get(0);
		const loginId = from.loginId.value;
		
		$.get(
			"getLoginIdDup",
			{
				loginId
			},
			function(data) {
				if ( data.msg ) {
					alert(data.msg);
				}
			
				if ( data.success ) {
					DoJoinForm__checkedLoginId = data.body.loginId;
				}
			},
			"json"
		);
	}
	
	
	// 폼 발송전 체크
	function DoJoinForm__submit(form) {
		if ( DoJoinForm__submited ) {
			alert('처리중입니다.');
			return;
		}
	
		form.loginId.value = form.loginId.value.trim();
	
		if ( form.loginId.value.length == 0 ) {
			alert('로그인 아이디를 입력해주세요.');
			form.loginId.focus();
			
			return;
		}
		
		if ( form.loginId.value != DoJoinForm__checkedLoginId ) {
			alert('로그인 아이디 중복검사를 해주세요.');
			form.btnLoginIdDupCheck.focus();
			return false;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
	
		if ( form.loginPw.value.length == 0 ) {
			alert('로그인 비밀번호를 입력해주세요.');
			form.loginPw.focus();
			
			return;
		}
		
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
	
		if ( form.loginPwConfirm.value.length == 0 ) {
			alert('로그인 비밀번호 확인을 입력해주세요.');
			form.loginPwConfirm.focus();
			
			return;
		}
		
		if ( form.loginPw.value != form.loginPwConfirm.value ) {
			alert('로그인 비밀번호가 일치하지 않습니다.');
			form.loginPwConfirm.focus();
			
			return;
		}
		
		form.name.value = form.name.value.trim();
	
		if ( form.name.value.length == 0 ) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			
			return;
		}
		
		form.nickname.value = form.nickname.value.trim();
	
		if ( form.nickname.value.length == 0 ) {
			alert('별명을 입력해주세요.');
			form.nickname.focus();
			
			return;
		}
		
		form.email.value = form.email.value.trim();
	
		if ( form.email.value.length == 0 ) {
			alert('이메일을 입력해주세요.');
			form.email.focus();
			
			return;
		}
		
		form.cellphoneNo.value = form.cellphoneNo.value.trim();
	
		if ( form.cellphoneNo.value.length == 0 ) {
			alert('전화번호를 입력해주세요.');
			form.cellphoneNo.focus();
			
			return;
		}
		
		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = "";
		form.loginPwConfirm.value = "";
		
		form.submit();
		DoJoinForm__submited = true;
	}
	</script>
	<form class="sign-Up" id="signupForm" action="doJoin" method="POST"
		onsubmit="DoJoinForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal" />
	<h1 class="signUpTitle">회원가입</h1>
		<div>
			<div>로그인 아이디</div>
			<div>
				<input name="loginId" type="text" class="signUpInput" maxlength="100"
					placeholder="로그인 아이디를 입력해주세요."></input>

				<button class="btn btn-success" onclick="DoJoinForm__checkLoginIdDup(this);"
					name="btnLoginIdDupCheck" type="button">중복체크</button>
			</div>
		</div>

		<br>
		<div>
			<div>로그인 비번</div>
			<div>
				<input name="loginPw" type="password" class="signUpInput" maxlength="100"
					placeholder="로그인 비밀번호를 입력해주세요." />
			</div>
		</div>


		<div>
			<div>로그인 비밀번호 확인</div>
			<div>
				<input name="loginPwConfirm" type="password" class="signUpInput" maxlength="100"
					placeholder="로그인 비밀번호 확인을 입력해주세요." />
			</div>
		</div>


		<div>
			<div>이름</div>
			<div>
				<input name="name" type="text" class="signUpInput" maxlength="100"
					placeholder="이름을 입력해주세요." />
			</div>
		</div>

		<div>
			<div>별명</div>
			<div>
				<input name="nickname" type="text" class="signUpInput" maxlength="100"
					placeholder="별명을 입력해주세요." />
			</div>
		</div>


		<div>
			<div>이메일</div>
			<div>
				<input name="email" type="email" class="signUpInput" maxlength="100"
					placeholder="이메일을 입력해주세요." />
			</div>
		</div>


		<div>
			<div>전화번호</div>
			<div>
				<input name="cellphoneNo" type="tel" class="signUpInput" maxlength="100"
					placeholder="전화번호를 입력해주세요." />
			</div>
		</div>


		<div>
			<input type="submit" value="가입하기"
			class="signUpButton">
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>