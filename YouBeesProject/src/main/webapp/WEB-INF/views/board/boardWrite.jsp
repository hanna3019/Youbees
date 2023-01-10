<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/resources/css/write.css">
    <title></title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="main_container">
        <form action="" method="post" class="write_form">
            <div class="name_box">
                <label for="name_content">
                    <input type="text" name="name_content" placeholder="제목을 입력해 주세요.">
                </label>
            </div>

            <div class="service_region">
                <select class="service_box">
                    <option value="service">(선택) 서비스</option>
                    <option value="1">통번역</option>
					<option value="2">마케팅</option>
					<option value="3">컨설팅</option>
					<option value="4">보안</option>
					<option value="5">인쇄</option>
					<option value="6">기타</option>
                </select>
                <select class="region_box">
                    <option value="">(선택) 지역</option>
					<option value="1">서울</option>
					<option value="2">세종</option>
					<option value="3">강원</option>
					<option value="4">인천</option>
					<option value="5">경기</option>
					<option value="6">충북</option>
					<option value="7">충남</option>
					<option value="8">경북</option>
					<option value="9">대전</option>
					<option value="10">대구</option>
					<option value="11">전북</option>
					<option value="12">경남</option>
					<option value="13">울산</option>
					<option value="14">광주</option>
					<option value="15">부산</option>
					<option value="16">전남</option>
					<option value="17">제주</option>
                </select>
            </div>

            <textarea class="content_write"
                placeholder="궁금한 점 또는 하고 싶은 말을 자유롭게 작성해 보세요.&#13;&#10;타인에게 불쾌감을 주거나 커뮤니티 이용정책에 위배되는 글은 숨김처리 및 삭제될 수 있습니다."></textarea>

            <div class="image_upload">
                <label for="file_input">
                    <img src="${path}/resources/source/camera.png" class="camimg" />
                </label>
                <input id="file_input" type="file" />
                <span class="imgCnt">0/1</span>
                <div class="uploadedFile">
                </div>
            </div>

            <div class="btn_container">
                <input type="submit" name="" value="등록" class="postBtn">
                <input type="button" name="" value="목록" class="listBtn" onclick="location.href='board.html'">
            </div>
        </form>
    </div>
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>