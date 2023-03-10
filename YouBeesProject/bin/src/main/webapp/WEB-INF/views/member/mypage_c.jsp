<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/myPage_n.css">
    <title>YouBees</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <main>
        <div class="myPageContainer">
            <div class="myPageTitle">마이페이지</div>

            <div class="profileBox">
                <img class="profileImg" src="${path}/resources/source/reading.png" alt="일반고객로고" onclick="">
                <div class="userInfo" onclick="location.href='myInfoEditC.me'">
                    <div>${loginUserC.name} 님 </div><p>수정하기</p>
                </div>
            </div>

            <table id="profileContent">
                <tr>
                    <th class="title"><a href="#">찜목록</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="sentRequest.re?cusNum=${loginUserC.cusNum}">보낸요청</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="cMatched.re?cusNum=${loginUserC.cusNum}">매칭내역</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="#">커뮤니티 작성글/댓글</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="#">공지사항</a></th>
                </tr>
            </table>
        </div>
    </main>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

