<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	Date time = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String accTime = format.format(time);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Theme Region">
<meta name="description" content="">

<title>JAVARAJOB | MY PAGE | 문의하기</title>

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/icofont.css">
<link rel="stylesheet" href="css/slidr.css">
<link rel="stylesheet" href="css/main.css">
<link id="preset" rel="stylesheet" href="css/presets/preset1.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/table_kdb.css">

<!-- font -->
<link
	href='https://fonts.googleapis.com/css?family=Ubuntu:400,500,700,300'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Signika+Negative:400,300,600,700'
	rel='stylesheet' type='text/css'>

<!-- icons -->
<link rel="icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="images/ico/apple-touch-icon-57-precomposed.png">
<!-- icons -->
<script src="${path}/com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#refBtn").click(function(){			
			var no = $("input[name=no]").val();			
			$(location).attr("href","${path}/boardList.do?method=insert&no="+no);	
		});
		$("#uptBtn").click(function(){
			var pass = $("input[name=pass]").val();
			var inputPass = $("input[name=passChk]").val();
			if(pass==inputPass){
				$("form").attr("action","${path}/boardList.do?method=update");
				$("form").submit();
			}
			else{
				alert("비밀번호가 일치하지 않습니다.");
			}			
		});
		$("#delBtn").click(function(){			
			var pass = $("input[name=pass]").val();
			var inputPass = $("input[name=passChk]").val();
			if(pass==inputPass){
				$(location).attr("href","${path}/boardList.do?method=delete&no=${board.no}");
			}
			else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		});
		$("#listBtn").click(function(){
			$(location).attr("href","${path}/boardList.do?method=list");
			
		});	
	
	});
</script>
</head>
<body>
	<!-- header 11-->
	<jsp:include page="navHeader.jsp"/>

	<section class="job-bg-mypage page job-list-page container">
		<div class="list-view">
		<div class="container">
			<div class="breadcrumb-section">
				<ol class="breadcrumb">
					<li><a href="${path}/index.do">HOME</a></li>
					<li>MY PAGE</li>
					<li>문의하기</li>
				</ol>						
				<h2 class="title">My Profile</h2>
			</div><!-- breadcrumb-section -->
			
			<div class="job-profile section">	
				<div class="user-profile">
					<div class="user-images">
						<img src="upload/${resume.picName}" width="100%"
							onerror="this.src='upload/default.png'" class="img-responsive">
					</div>
					<div class="user">
						<h2><a href="#">${id}</a> 님 안녕하세요!</h2>
						
						<h5>마지막 로그인 <%=accTime %></h5>
					</div>

					<div class="favorites-user">
						<div class="my-ads">
							<a href="#">${careerFavCount}<small>Favorite Job</small></a>
						</div>
						<div class="favorites">
							<a href="#">${careerFavCountCompany}<small>Favorite Corp.</small></a>
						</div>
					</div>								
				</div><!-- user-profile -->
						
				<ul class="user-menu">					
					<li><a href="${path}/account.do?method=uptProcGuest1">회원정보 수정</a></li>
					<li><a href="${path}/account.do?method=delProcGuest1">탈퇴</a></li>
					<li><a href="${path}/account.do?bookmark">관심 직무</a></li>
					<li><a href="${path}/account.do?appliedjob">관심 기업</a></li>
					<li class="active"><a href="${path}/account.do?qanda">Q&A</a></li>
				</ul>
			</div><!-- ad-profile -->

			<div class="profile job-profile">
				<div class="user-pro-section">
					<!-- profile-details -->
					<div class="question-answer section">
						<h2>글 상세</h2>
						<form method="post">
							<input type="hidden" name="refno" size="50" value="${board.no}"/>
							<table class="kdb-table">
								<colgroup>
									<col width="15%">
									<col width="35%">
									<col width="15%">
									<col width="35%">
								</colgroup>
								<tr>
									<th class="preColor kdbheader">글번호</th>
										<td class="border-preset"><h4>${board.no}</h4><input type="hidden" name="no" size="50" value="${board.no}"/></td>
									<th class="preColor kdbheader">조회수</th>
										<td class="border-preset"><h4>${board.readcount}</h4></td></tr>		
								<tr>
									<th class="preColor kdbheader">기업</th>
										<td class="border-preset">
											<c:forEach var="companyList" items="${companyList}">
												<c:choose>
													<c:when test="${companyList.companyid == board.companyid}">
														<h4>${companyList.companyname}</h4>															
													</c:when>														
												</c:choose>														
											</c:forEach>
										</td>											
									<th class="preColor kdbheader-pw">PASSWORD</th>
										<td class="border-preset">										
										<input type="password" name="pass"  value="${board.pass}" size="50" hidden/>
										<input type="password" name="passChk" size="50" class="form-control"/>
										</td>
								</tr>		
								<tr>
									<th class="preColor kdbheader">제목</th>
										<td colspan="3" class="border-preset"><input type="text" name="subject" value="${board.subject}" size="50" class="form-control"/></td>
								</tr>
								<tr>
									<th class="preColor kdbheader">작성자</th>
										<td class="border-preset">
										<input type="text" name="writer" value="${board.writer}"  size="50" hidden/>
										<c:choose>
											<c:when test="${board.refno != 0}">
												<h4>인사담당자</h4>
											</c:when>
											<c:otherwise>
												<h4>${board.writer}</h4>											
											</c:otherwise>
										</c:choose>
										</td>		
								    <th class="preColor kdbheader">이메일</th>
								    	<td class="border-preset"><input type="text" name="email" size="50" value="${board.email}" class="form-control"/></td>
								</tr>
										
								<tr>
									<th class="preColor kdbheader">내용</th>
										<td colspan="3" class="border-preset">
											<textarea name="content" cols="40" rows="10" class="form-control">${board.content}</textarea>
										</td>
								</tr>		
								
								<tr align="right">
									<th colspan="4">
										<input type="button" id="listBtn" value="메인글" class="btn btn-hover-preset"/>			
										<input type="button" id="refBtn" value="답글달기" class="btn btn-hover-preset"/>
										<input type="button" id="uptBtn"  value="수정" class="btn btn-hover-preset"/>
										<input type="button" id="delBtn"  value="삭제" class="btn btn-hover-preset"/>
									</th>
								</tr>
							</table>
						</form>						
					</div>
					<!-- profile-details -->											
				</div>
				<!-- user-pro-edit -->
			</div>
		</div>
		</div>
		<!-- container -->
	<!-- ad-profile-page -->

	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<!-- footer -->
</section>

	<!--/Preset Style Chooser-->
	<div class="style-chooser">
		<div class="style-chooser-inner">
			<a href="#" class="toggler"><i class="fa fa-cog fa-spin"></i></a>
			<h4>Presets</h4>
			<ul class="preset-list clearfix">
				<li class="preset1 active" data-preset="1"><a href="#"
					data-color="preset1"></a></li>
				<li class="preset2" data-preset="2"><a href="#"
					data-color="preset2"></a></li>
				<li class="preset3" data-preset="3"><a href="#"
					data-color="preset3"></a></li>
				<li class="preset4" data-preset="4"><a href="#"
					data-color="preset4"></a></li>
			</ul>
		</div>
	</div>
	<!--/End:Preset Style Chooser-->

	<!-- JS -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/main.js"></script>
	<script src="js/switcher.js"></script>
</body>
</html>