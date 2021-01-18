<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="회원가입" />
<%@ include file="../../part/head.jspf"%>
<h1>${pageTitle}</h1>

<div>
	<form action="doJoin" method="POST">
		<hr />
		<div>
			<div>로그인 아이디</div>
			<div>
				<input name="loginId" type="text" maxlength="50"
					placeholder="로그인 아이디를 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>로그인 비번</div>
			<div>
				<input name="loginPw" type="password" maxlength="50"
					placeholder="로그인 비번을 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>이름</div>
			<div>
				<input name="name" type="text" maxlength="50"
					placeholder="이름을 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>별명</div>
			<div>
				<input name="nickname" type="text" maxlength="50"
					placeholder="별명을 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>이메일</div>
			<div>
				<input name="email" type="email" maxlength="100"
					placeholder="이메일을 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>전화번호</div>
			<div>
				<input name="cellphoneNo" type="number" maxlength="100"
					placeholder="전화번호를 입력해주세요." />
			</div>
		</div>

		<hr />

		<div>
			<div>가입</div>
			<div>
				<input type="submit" value="가입" />
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>

<script>
	function check() {

		if (join.loginId.value == '') {
			alert('id를 입력하세요');
			join.loginId.focus();
			return false;
		}
		if (join.loginPw.value == '') {
			alert('비밀번호를 입력하세요');
			join.loginPw.focus();
			return false;
		}

		if (join.loginPw.value != join.loginPw.value) {
			alert('비밀번호가 다릅니다. 다시 입력하세요');
			formcheck.loginPw_check.focus();
			return false;
		}
		if (join.name.value == '') {
			alert('이름을 입력하세요');
			join.name.focus();
			return false;
		}
		if (join.nickname.value == '') {

			alert('별명을 입력하세요');
			join.nickname.focus();
			return false;
		}

		if (join.email.value == '') {

			alert('이메일을 입력하세요');
			join.email.focus();
			return false;
		}
		return true;
	}
</script>
