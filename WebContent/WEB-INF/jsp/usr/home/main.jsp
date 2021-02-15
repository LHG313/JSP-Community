<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageTitle" value="홈" />
<%@ include file="../../part/head.jspf"%>

<section class="section-top-banner con-min-width">
	<div class="con img-box">
		<div class="img">
			<div class="content">
				<div class="loading">
					<span>환</span> <span>영</span> <span>합</span> <span>니</span> <span>다</span>
					<span>~</span> <span>!</span>
				</div>
			</div>
			<div class="img-cover"></div>
		</div>
	</div>
</section>

<section class="section-prod-list con-min-width">
	<div class="con">

		<div class="prod-list-1">
			<ul class="row">
				<li class="cell">
					<div class="img-box">
						<img
							src="${pageContext.request.contextPath}/img/화면2.jpeg"
							alt="">
					</div>
					<div class="prod-name">
						<a href="../article/list?boardId=3" class="block"> <span>
								⚽ </span> <span>자유</span>
						</a>
					</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img
							src="${pageContext.request.contextPath}/img/화면3.jpeg"
							alt="">
					</div>
					<div class="prod-name">
						<a href="../article/list?boardId=4" class="block"> <span>
								👨‍🏫 </span> <span>한국사공부</span>
						</a>
					</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img
							src="${pageContext.request.contextPath}/img/화면4.jpeg"
							alt="">
					</div>
					<div class="prod-name">
						<a href="../article/list?boardId=1" class="block"> <span>
								<i class="far fa-flag"></i>
						</span> <span>공지사항</span>
						</a>
					</div>
				</li>
				<li class="cell">
					<div class="img-box">
						<img
							src="${pageContext.request.contextPath}/img/화면5.jpeg"
							alt="">
					</div>
					<div class="prod-name">
						<a href="../article/list?boardId=5" class="block"> <span>
								🏇
						</span> <span>고사성어</span>
						</a>
					</div>
				</li>
			</ul>
		</div>

	</div>
</section>
<%@ include file="../../part/foot.jspf"%>