<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>

<head>
	<meta charset="utf-8">
	<title>상품 상세보기</title>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		crossorigin="anonymous">
</head>

<style>
	/* 전체 wrap */
	#wrap {
		width: 500px;
		margin: 0 auto;
		s text-align: center;
		margin-bottom: 100px;
	}
	/* 상단 상품명 */
	.itemtext {
		font-weight: bold;
		float: left;
		box-sizing: border-box;
		margin-top: 40px;
		font-size: 50px;
		position: relative;
		box-sizing: border-box;
	}
	/* 셀렉트박스 품절 옵션 */
	#ba {
		background-color: lightgray;
	}
	/* 셀렉트박스 */
	.OptionList1 {
		width: 650px;
		height: 35px;
		border: 1px solid gray;
		border-radius: 10px;
		font-size: 16px;
		margin-bottom: 10px;
		text-align: center;
	}
	/* 장바구니 구매 버튼 */
	.btt {
		width: 330px;
		height: 60px;
		background-color: #24292F;
		color: white;
		text-align: center;
		border: none;
		border-radius: 10px;
		cursor: pointer;
		margin-bottom: 10px;
	}
	/* 총 상품금액 위치 */
	.totprice {
		float: left;
		margin-left: 520px;
	}
	/* 총 상품금액 폰트 */
	.totprice {
		float: left;
		margin-left: 520px;
	}
	/* 리뷰 타이틀 */
	#rtitle {
		font-weight: bold;
		margin-top: 40px;
		margin-bottom: 10px;
		font-size: 30px;
		position: relative;
	}
	/* 리뷰 테이블 속성 */
	#rtable {
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		text-align: center;
		margin-bottom: 100px;
		margin-top: 50px;
	}
	/* 가운데정렬 */
	.center {
		text-align: center;
	}
</style>

<body>
	<div id="wrapper"> <!-- 화면 전체영역 -->
		<input type="hidden" id="IDX" name="IDX" value="${detail.itemnum}"> <br>
		<!-- 상품상세페이지 상단(상품정보) 영역 -->
		<div style="width: 100%; position: relative; left: calc(50% - 600px); height: 600px; display: inline">
			
			<!-- 상품정보 좌측 이미지 영역 -->
			<div style="float: left; width: 500;">
				<table>
					<tr>
						<td><img src="${detail.itemdetailimg}" width="500" height="500" /></td>
					</tr>
				</table>
			</div>
			
			<!-- 상품정보 우측영역 -->
			<div>
				<!-- 상품명 -->
				<table> 
					<tr>
						<td class="itemtext">${detail.itemname}</td>
					</tr>
				</table>
				<hr style="border-top: 1px solid #bbb;" width=670px>
				<!-- 배송정보 -->
				<table> 
					<tr style="font-size:110%">
						<td width="350px">배송비</td>
						<td>&nbsp;선불3,000원(50,000원 이상 무료배송)</td>
					</tr>
				</table>
				<table>
					<tr style="font-size:110%">
						<td width="540px">배송종류</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국내배송</td>
					</tr>
				</table> <br> <br>
				
				<!-- 상품 옵션선택 영역 -->
				<div id="item_option">
					<table>
						<tr>
							<td> <select name="OptionList" id="OptionList" class="OptionList1">
									<option value="">================ (필수)옵션: 색상/용량 선택 ================</option>
									<c:forEach var="list1" items="${list1}" varStatus="index">
										<c:if test="${list1.itemstock == 0}"> <!-- 재고0인 상품은 선택 불가 -->
											<option id="ba" value="${list1.itemoption}" disabled="disabled">${list1.itemoption}(품절)</option>
										</c:if>
										<c:if test="${list1.itemstock != 0}">
											<option value="${list1.itemoption}">${list1.itemoption}</option>
										</c:if>
									</c:forEach>
							</select> </td>
						</tr>
					</table>
				</div>
				
				<!-- 총 상품금액 -->
				<div class="totals-item totals-item-total"
					style="float: left; margin-left: 400px;">
					<label class="total_price">총상품금액</label>&nbsp;&nbsp;
					<div class="total_price" style="float: right;">원</div>
					<div class="totals-value" id="cart-total" style="float: right;">0</div>
				</div> 
				<br>
				
				<!-- 중간 라인(생략가능) -->
				<table>
					<tr>
						<td><hr style="border-top: 1px solid #bbb;" width=670px><td>
					</tr>
				</table>

				<!-- 장바구니, 구매하기 버튼 -->
				<button class="btt" id="insertBasket">장바구니</button>
				<button class="btt" class="btn btn-outline-danger" id="goodsOrder">구매하기</button>
				<br>
			</div>
		</div> <!-- 상품정보 영역 끝 -->
		<br>
		<div style="clear: both;"></div>
		
		<!-- 상세이미지 영역(생략가능) -->
		<div align="center"> <hr width=1000px> </div>
		<br><br><br>
		<div class="center">상 품 상 세 이 미 지 영 역</div>
		<br><br><br>
		<div align="center"> <hr width=1000px> </div>
		<!-- 상세이미지 영역 끝(생략가능) -->
		
		<!-- 리뷰 영역 -->
		<div id="rtable" align="center">
			<div id="rtitle">상품리뷰</div>
			
			<table class="table">
				<!-- 게시판 상단 메뉴 -->
				<thead class="table-dark">
					<tr>
						<th scope="col" class="col-2" id="title">작성일</th>
						<th scope="col" class="col-2" id="title">작성자</th>
						<th scope="col" class="col-50" id="title">제목</th>
						<th scope="col" class="col-50" id="title">내용</th>
					</tr>
				</thead>
			
				<!-- 게시글 목록 -->
				<tbody>
					<c:forEach var="review" items="${review}" varStatus="index">
						<tbody id="reviewList" name="reviewList">
							<tr>
								<td class="center">${review.reviewdate}</td>
								<td class="center">${review.id}</td>
								<td class="center">${review.reviewtitle}</td>
								<td class="center">${review.reviewcontent}</td>
							</tr>
						</tbody>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- 리뷰 영역 끝 -->
	</div>
	<form id="commonForm" name="commonForm"></form>
</body>
</html>

<script type="text/javascript">

// 상품금액출력
var option;
var num;
$('#OptionList').on("change", function() {
	option = $("#OptionList option:selected").val();
	num = ${detail.itemnum}
	var data = {
		option : option,
		num : num
	}
	$.ajax({
		type : "get",
		url : "/itemOp",
		data : data,
		dataType : "json",
		success : function(result) {
			$('.totals-value').text(result);
			console.log("확인 : " + result);
			var a = result;
		},
		error : function() {
			// alert("에러 발생"+result); 
		}
	});
}) // 상품금액출력 끝

// 구매버튼 
var code;
$("#goodsOrder").on("click", function() {
	order();
});

function order() {
	if (num == undefined) {
		alert("상품을 선택해 주세요");
	} else {
		$.ajax({
			type : "get",
			url : "/itemCode",
			data : {
				option : option,
				num : num
			},
			async : false,// 전역 변수 보내기
			dataType : "json",
			success : function(result) {
				code = result;

				console.log("확인 : " + result);
				if (result) {
					// alert("완료"+code);  
				} else {
					// alert("전송된 값 없음"+result); 
				}
			},
			error : function() {
				// alert("에러 발생"+result); 
			}
		});// 아작스 끝 
		if (window.confirm("구매하시겠습니까?")) {
			location.href = "/order?code="+code;
         }
	}
}
	
//장바구니버튼
$("#insertBasket").on("click", function() { // 장바구니
	if (num == undefined) {
		alert("상품을 선택해 주세요");
	} else {
		$.ajax({
			type : "get",
			url : "/itemCode",
			data : {
				option : option,
				num : num
			},
			async : false,//전역 변수 보내기
			dataType : "json",
			success : function(result) {
				code = result;
				console.log("확인 : " + result);
				if (result) {
					// alert("완료"+code);  
					return code;
				} else {
					//alert("전송된 값 없음"+result);  
				}
			},
			error : function() {
				// alert("에러 발생"+result); 
			}
		});// 아작스 끝 alert("장바구니에 추가하시겠습니까?");
		location.href = "/cartInsertAction?code=" + code;
	}
});
</script>