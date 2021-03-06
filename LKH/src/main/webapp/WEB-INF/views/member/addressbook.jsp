

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="../main_top.jsp" flush="false" />
<jsp:include page="../main_sidebar.jsp" flush="false" />
<script>
	$(function() {

		$('#searchbtn').on('click', function() {
			var a = $('#key').val().trim().length;
			console.log(a);
			if ($('#key').val().trim().length == 0) {
				alert('검색어를 입력하세요.');
				return;
			} else {
				var searchType = $("#searchType").val();
				var keyword = $('#key').val().trim();
				console.log(searchType);
				console.log(keyword);
				$("form").submit();
			}
		})

	});
</script>
<body>



	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">주소록</h1>
		<div class="btn-toolbar mb-2 mb-md-0">
			<div class="btn-group mr-2">
				<form action="/member/addressbook" method="post">
					<input type="text" id="key" name="keyword" placeholder="이름으로찾기"/>
					<button id="searchbtn">검색</button>
				</form>

			</div>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">부서</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="/member/addressbook?keyword=ROLE_HR">경영지원</a>
					<a class="dropdown-item" href="/member/addressbook?keyword=ROLE_SALE">영업</a>
					<a class="dropdown-item" href="/member/addressbook?keyword=ROLE_IT">개발</a>
					<a class="dropdown-item" href="/member/addressbook?keyword=ROLE_TEST">테스트</a>
				</div>
			</div>
		</div>
	</div>

	<div class="table-responsive">
		<table class="table table-sm">
			<thead class="thead-light">
				<tr>
					<th>이름</th>
					<th>부서</th>
					<th>직책</th>
					<th>e-mail</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="memberDTO">
					<tr>
						<td>${memberDTO.name }</td>
						<td>${memberDTO.division }</td>
						<td>${memberDTO.position }</td>
						<td>${memberDTO.id }</td>
						<td>${memberDTO.tel }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<ul class="pagination pagination-sm justify-content-center">

		<c:if test="${pc.prev }">
			<li class="page-item"><a class="page-link"
				href="/member/addressbook?${pc.makeSearchURL(1) }&searchType=${pc.searchType}&keyword=${pc.keyword}">처음</a></li>
			<li class="page-item"><a class="page-link"
				href="/member/addressbook?${pc.makeSearchURL(pc.startPage - 1) }&searchType=${pc.searchType}&keyword=${pc.keyword}">이전</a></li>
		</c:if>



		<c:forEach begin="${pc.startPage }" end="${pc.endPage }" var="pageNum">
			<!-- 현재페이지와 요청페이지가 다르면 -->
			<c:if test="${pc.recordCriteria.reqPage != pageNum }">
				<li class="page-item"><a class="page-link"
					href="/member/addressbook?${pc.makeSearchURL(pageNum) }&searchType=${pc.searchType}&keyword=${pc.keyword}">${pageNum }</a>
				</li>
			</c:if>

			<!-- 현재페이지와 요청'페이지가 같으면 강조표시 -->
			<c:if test="${pc.recordCriteria.reqPage == pageNum }">
				<li class="page-item active"><a class="page-link"
					href="/member/addressbook?${pc.makeSearchURL(pageNum) }&searchType=${pc.searchType}&keyword=${pc.keyword}">${pageNum }</a>
				</li>
			</c:if>
			<!-- 요청페이지와 현재페이지가 같으면 강조표시 -->
		</c:forEach>


		<c:if test="${pc.next }">
			<li class="page-item"><a class="page-link"
				href="/member/addressbook?${pc.makeSearchURL(pc.endPage + 1) }&searchType=${pc.searchType}&keyword=${pc.keyword}">다음</a></li>
			<li class="page-item"><a class="page-link"
				href="/member/addressbook?${pc.makeSearchURL(pc.finalEndPage) }&searchType=${pc.searchType}&keyword=${pc.keyword}">마지막</a></li>
		</c:if>
	</ul>
	</main>

</body>
</html>
