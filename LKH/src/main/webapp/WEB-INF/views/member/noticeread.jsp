<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../main_top.jsp" flush="false" />
<jsp:include page="../main_sidebar.jsp" flush="false" />
<style>
.errmsg,{
color:red;
}
</style>
<script>
	$(function() {
		
		// 목록버튼
		$("#btn4").on("click",function(e){
			e.preventDefault();
			location.href="/member/notice?reqPage=${rc.reqPage}";
		});

	});
</script>

<body>
<c:set var='user' value="${SPRING_SECURITY_CONTEXT.authentication.principal }"/>

	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">공지사항</h1>
	</div>
	<form:form modelAttribute="noticeDTO" action="" method="post">
		<form:hidden path="num" value="${noticeDTO.num }" />
		<input type="hidden" name="reqPage" value="${rc.reqPage }"/>
			<table class="table table-sm" summary="게시글 보기">
				<colgroup>
					<col width="20%">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<form:input class="form-control" path="title" type="text" readonly="true"
							value="${noticeDTO.title }" />
							<form:errors class="valid-feedback" path="title"></form:errors>
						</td>						
					</tr>
					<tr>
						<th>작성자</th>
						<td>&nbsp;관리자
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>								
							<form:textarea class="form-control" path="content" rows="15" cols="30" 
							value="${noticeDTO.content }" readonly="true" />
							<form:errors class="valid-feedback" path="content"></form:errors>	
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							
							<button type="button" id="btn4"	class="btn btn-sm btn-outline-dark">목록</button>
						</td>
					</tr>
				</tbody>
			</table>
			<jsp:include page="../reply/notice_reReply.jsp" flush="false" />
		</form:form>
</main>
</body>
</html>