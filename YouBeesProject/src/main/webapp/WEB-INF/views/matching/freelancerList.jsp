<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YouBees</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_list.css?aa">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/free_list.js?s"></script>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="container">

        <div class="filter">
            <div class="h2">${cName}</div>

            <div class="region">
                <div><button class="openMask">지역<img src="${path}/resources/source/dropdown.png" alt="" class="drp_icon"></button></div>
                <div class="selected">
                <c:choose>
                	<c:when test="${not empty selected.location}">
                    	<div class="location">${selected.location}<img src="${path}/resources/source/x.png" class="close_region"></div>                	
                	</c:when>
                	<c:otherwise>
                		<div class="location"></div>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>

            <div class="price">
                <div>
                    <button class="price_btn" onclick="priceBtn();">가격<img src="${path}/resources/source/dropdown.png" alt=""
                            class="drp_icon"></button>
                </div>
                <form action="freelancerList.ma" name="filteringFrm">
                    <input type="number" min="0" size="7" class="priceInp" name="price1" id="p1"> &ensp;~&ensp; <input type="number" min="0" size="7"
                        class="priceInp" name="price2" value="" id="p2">
                    <input type="hidden" name="location" class="filterLocation" value="${selectedLocation}">
			        <input type="hidden" name="cateNum" value="${selected.cateNum}">
			        <input type="hidden" name="cName" value="${cName}">
			    <c:choose>
			    	<c:when test="${not empty loginUserC}">
	       				<input type="hidden" name="cusNum" value="${loginUserC.cusNum}">
	       			</c:when>
	       			<c:otherwise>
	       				<input type="hidden" name="cusNum" value="0">
	       			</c:otherwise>
			    </c:choose>
                    <input type="button" class="price_search" value="검색" onclick="priceSubmit();"></input>
                    <input type="button" class="price_reset" value="초기화" onclick="resetList();"></input>
                
                <script>
                	function resetList(){
                		$(".priceInp").val("0");
                		$(".filterLocation").val("");
                		filteringFrm.submit();
                	}
                	function priceSubmit(){
                		if($("#p1").val() != "" && $("#p2").val())
	                	filteringFrm.submit();	              	             			
                	}
                </script>
            </div>

        </div>

        <div class="free_list">
            <div class="search">
                    <input class="search_bar" type="text" name="keyword" placeholder="어떤 프리랜서를 찾고 계신가요?">
                    <img src="${path}/resources/source/search.png" alt="" class="search_btn" onclick="">
                </form>
                <select name="orderBy" id="order">
                    <option value="1">리뷰많은순</option>
                    <option value="2">평점순</option>
                    <option value="3">매칭순</option>
                </select>
            </div>
            <div id="fListArea">
            <c:forEach var="l" items="${fList}">
	            <table class="free_pro">
	                <tr>
	                    <td colspan="4">
	                    <c:choose>
	                    	<c:when test="${not empty loginUserC}">
			                    <a href="freelancerDetail.ma?freeNum=${l.freeNum}&cusNum=${loginUserC.cusNum}"><h4>${l.f.name}</h4></a>
	                    	</c:when>
	                    	<c:otherwise>
			                    <a href="freelancerDetail.ma?freeNum=${l.freeNum}"><h4>${l.f.name}</h4></a>
	                    	</c:otherwise>
	                    </c:choose>
	                    </td>
	                    <c:choose>
	                    	<c:when test="${not empty l.f.changeName}">
			                    <td rowspan="3" class="pro_img"><img src="${path}/${l.f.changeName}" alt="" class="pro_img"></td>
	                    	</c:when>
	                    	<c:otherwise>
			                    <td rowspan="3" class="pro_img"><img src="${path}/resources/source/default.png" alt="" class="pro_img"></td>	                    	
	                    	</c:otherwise>
	                    </c:choose>
	                </tr>
	                <tr>
	                    <td colspan="4" class="title">${l.oneContent}</td>
	                </tr>
	                <tr class="review">
	                    <td width="15%"><img src="${path}/resources/source/star.png" alt="" class="review"> ${l.avgStar }(${l.rcount })</td>
	                    <td width="15%">경력 ${l.f.career}</td>
	                    <td width="20%">평균응답시간 1시간</td>
	                    <c:choose>
	                    	<c:when test="${l.status eq 'Y'}">
			                    <td><img src="${path}/resources/source/heart2.png" alt="" class="bookmark_icon" id="${l.freeNum}">찜하기</td>	                    		
	                    	</c:when>
	                    	<c:otherwise>
			                    <td><img src="${path}/resources/source/heart.png" alt="" class="bookmark_icon" id="${l.freeNum}">찜하기</td>	                    	
	                    	</c:otherwise>
	                    </c:choose>
	                </tr>
	            </table>
            </c:forEach>
            </div>
            <c:choose>
            	<c:when test="${pi.listCount gt 5}">
			       	<div id="pageArea">
			      		<ul class="pagination">
			               	
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
			                    <li class="page-item"><a class="page-link" href="javascript:paging(${p})">[${p}]</a></li>
							</c:forEach>
							
			           </ul>
			       	</div>
	       		</c:when>
	       	</c:choose>
       	</div>

       	<c:choose>
       		<c:when test="${not empty loginUserC}">
	       	<input type="hidden" id="cusNum" value="${loginUserC.cusNum}">
       			<script>
       			/* 좋아요 누르기 */
    		    $(document).on("click", ".bookmark_icon", function () {
    		    	let src = "";
    		    	let fNum = $(this).attr('id');
    	    		let cNum = ${loginUserC.cusNum};
    		    	if($(this).attr('src') === '${path}/resources/source/heart.png'){
    		    		src = '/spring/resources/source/heart2.png';
    		    		$.ajax({
    		    			url:"insertDib.ma",
    		    			data:{cusNum:cNum, freeNum:fNum},
    		    			success:function(result){
    		    				console.log(result);
    		    			},
    		    			error:function(){
    		    				console.log("찜하기 ajax 통신 실패");
    		    			}
    		    		});
    		    	}else{
    		    		src = '/spring/resources/source/heart.png';
    		    		fNum = $(this).attr('id');
    		    		cNum = ${loginUserC.cusNum};
    		    		$.ajax({
    		    			url:"updateDib.ma",
    		    			data:{cusNum:cNum, freeNum:fNum},
    		    			success:function(result){
    		    				console.log(result);
    		    			},
    		    			error:function(){
    		    				console.log("찜하기 ajax 통신 실패");
    		    			}
    		    		});
    		    	}
    		            $(this).attr('src', src);
    		    }); 
       			</script>
       		</c:when>
       		<c:otherwise>
       		<input type="hidden" id="cusNum" value="0">
       			<script>
       			$(document).on("click", ".bookmark_icon", function (){
       				alert("일반 회원으로 로그인 후 이용이 가능합니다");
       			});
       			</script>
       		</c:otherwise>
       	</c:choose>
       	
       	
       	
		<script>
		$(function () {
			/* 지역리스트 */
		    $("ul.locationList>li").click(function () {
		        $(this).next().toggleClass("hidden");
		    });

		    /* 지역 선택 후 div에 띄우기 */
		    $(".cityList>li").on({
		    	'click' : function(){
		    		let value = $(this).text();		    		
		    		$(".location").empty();
		    		$(".location").append('<img src="${path}/resources/source/x.png" class="close_region">');
		    		$(".location").append(value).show();
		    		$("#mask, .window").hide();
		    		$(".filterLocation").val(value);
		    		$("#filterForm").submit();
		    	}
		    })
		    
		    $(document).on("click", ".close_region", function() {
		    		$(".location").hide();
		    		$("#filterForm").submit();
		    });
		   
		});
	
		/* 페이징 처리 ajax */
		 function paging(p){
			$.ajax({
				url:"freelancerListPaging.ma",
				data:{nowPage:p, cusNum:$("#cusNum").val(), cateNum:${selected.cateNum}, price1:${selected.price1}, price2:${selected.price2}},
				success:function(fList){
					console.log(fList);
					let value = '';
					for(let i in fList){
						value += '<table class="free_pro">'
							  + ' <tr><td colspan="4">'							  
							  + '<a href="freelancerDetail.ma?freeNum='+fList[i].freeNum+'&cusNum='+$("#cusNum").val()+'">'
							  + '<h4>'+fList[i].f.name+'</h4></a></td>';
							  if(fList[i].f.changeName != null){
								  value += '<td rowspan="3" class="pro_img"><img src="/spring/'+fList[i].f.changeName+'" alt="" class="pro_img"></td></tr>';
							  }else{
								  value += '<td rowspan="3" class="pro_img"><img src="/spring/resources/source/default.png" alt="" class="pro_img"></td></tr>';
							  }
					    value += '<tr><td colspan="4" class="title">'+fList[i].oneContent+'</td></tr>'
							  + '<tr class="review">'
							  + '<td width="15%"><img src="/spring/resources/source/star.png" alt="" class="review"> 3.5(256)</td><td width="15%">경력 '+fList[i].f.career+'</td>'
							  + '<td width="20%">평균응답시간 1시간</td><td>';
							  if(fList[i].status == 'Y'){
								  value += '<img src="/spring/resources/source/heart2.png" ';
							  }else{
								  value += '<img src="/spring/resources/source/heart.png" ';
							  }
			             value += 'alt="" class="bookmark_icon" id="'+fList[i].freeNum+'">찜하기</td></tr></table>';
					}
					$("#fListArea").empty();
					$("#fListArea").html(value);
				},
    			error:function(){
    				console.log("페이징처리 ajax 통신 실패");
    			}
			});
		} 
		</script>

        <!-- 지역선택 모달창 -->
        <form action="freelancerList.ma" id="filterForm">
        <input type="hidden" name="location" class="filterLocation" value="">
        <input type="hidden" name="cateNum" value="${selected.cateNum}">
        <c:choose>
        	<c:when test="${not empty loginUserC}">
		        <input type="hidden" name="cusNum" value="${loginUserC.cusNum}">        	
        	</c:when>
        	<c:otherwise>
		        <input type="hidden" name="cusNum" value="0">        	        	
        	</c:otherwise>
        </c:choose>
        <input type="hidden" name="cName" value="${cName}">
        <div id="mask"></div>
        <div class="window">
            <div>
                <span>지역 선택</span>
                <span style="text-align:center; font-size: small;"><a href="#" class="close">닫기X</a></span>
            </div>
            <ul class="locationList">
            <c:forEach var='l' items='${lList}'>
                <li class="loca">&ensp;${l.location}</li>
                <ul class="cityList hidden">
                <c:forEach var='c' items='${cList}'>
                	<c:choose>
                		<c:when test="${c.locNum eq l.locNum}">
                    		<li>${c.city}</li>
                    	</c:when>
                    </c:choose>
                </c:forEach>
                </ul>            	
            </c:forEach>
            </ul>
        </div>
    </div>
    </form>
    
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>