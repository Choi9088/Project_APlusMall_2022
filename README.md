## ⭐ Project_APlusMall_[더조은]팀 프로젝트 ⭐ <br><br><br> 1. 프로젝트 개요

- **주제 :** SpringMVC패턴을 활용한 웹 쇼핑몰 구현

  - 사용자의 상품구매, 주문조회, 리뷰작성 등의 기능 구현
  - 관리자의 회원관리, 상품관리, 주문관리, 게시판관리 등의 기능 구현

- **진행기간 :** 22.09.13 ~ 22.11.02 (약 7주)

- **참여인원 :** 4명

- **담당역할 :** 회의록 작성, View 담당, 회원가입/상품목록 페이지 구현

<br>

## 2. 사용기술

- **Front :** Html, CSS, JavaScript(Jquary,ajax), JSP 2.3

- **Back :** Java 1.8, Maven, SpringFramework 5.3.22

- **DataBase :** Oracle 11g

<br>

## 3. 설계

- **UseCaseDiagram**
![https://user-images.githubusercontent.com/112682766/202073982-d789066e-8de7-4f1e-b5a0-668ac6764ac0.png](https://user-images.githubusercontent.com/112682766/202073982-d789066e-8de7-4f1e-b5a0-668ac6764ac0.png)

- **ERD**
![erd](https://user-images.githubusercontent.com/112682766/204685853-c14204eb-72c8-434f-9de2-8f79a9048d2d.png)

<br>

## 4. UI 및 주요기능

### 4-1. 메인페이지

<img width="600" alt="스크린샷 2023-06-11 11 18 56" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/145c4fef-7db5-42e1-a410-cf3030c4a02a">

- Tiles설정을 이용해 전체 페이지에 헤더와 푸터 일괄적용
- 부트스트랩으로 슬라이더를 적용시켜 이벤트, 상품페이지로 이동 구현

<details><summary><h4> 메인페이지 구현 코드</h4></summary>
<p>

#### (1)main.jsp
```html
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set> --%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>APLUS MALL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>
	<div class="wrapper">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
		<script>
			$('.carousel').carousel({
				interval : 4000 //기본 4초
			})
		</script>

		<div id="image_slide_wrapper">
			<div class="carousel slide" data-ride="carousel">
				<div id="demo" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<!-- 슬라이드 쇼 -->
						<div class="carousel-item active">
							<!--가로-->
							<a href="/eventDetail?num=14"> <img id="slideradius"
								class="d-block w-100"
								src="../resources/img/slide3.png?auto=compress&cs=tinysrgb&h=650&w=940"
								alt="First slide"></a>
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
						<div class="carousel-item">
							<a href="/eventDetail?num=14"> <img id="slideradius"
								class="d-block w-100"
								src="../resources/img/slide2.png?auto=compress&cs=tinysrgb&h=650&w=940"
								alt="Second slide"></a>
						</div>
						<div class="carousel-item">
							<a href="/eventDetail?num=14"> <img id="slideradius"
								class="d-block w-100"
								src="../resources/img/slide.png?auto=compress&cs=tinysrgb&h=650&w=940"
								alt="Third slide"></a>
						</div>
						<!-- / 슬라이드 쇼 끝 -->

						<!-- 왼쪽 오른쪽 화살표 버튼 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<!-- <span>Previous</span> -->
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<!-- <span>Next</span> -->
						</a>
						<!-- / 화살표 버튼 끝 -->

						<!-- 인디케이터 -->
						<ul class="carousel-indicators">
							<!--0번부터시작-->
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul> <!-- 인디케이터 끝 -->
					</div>
				</div>
			</div>
		</div>
		<!-- 이미지 슬라이드 끝 -->

		<!-- 상품 바로가기 이미지 -->
		<div id="boot_imgradius2">
			<div id="image_click_mainwrapper">
				<a href="http://localhost:8181/itemListL?cat=1"> <img
					class="bd-placeholder-img rounded float-end" width="460"
					height="340" src="../resources/img/banner2.png" role="img" />
				</a> <a href="http://localhost:8181/itemListL?cat=2"> <img
					class="bd-placeholder-img rounded float-end" width="460"
					height="340" src="../resources/img/banner.png" role="img" />
				</a> <a href="http://localhost:8181/itemListL?cat=6"> <img
					class="bd-placeholder-img rounded float-end" width="460"
					height="340" src="../resources/img/banner3.png" role="img" />
				</a>

			</div>
		</div>
		<!-- 상품 바로가기 이미지 끝 -->

	</div>
</body>
</html>  
```
#### (2)MainController.java
```java
@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	/* 홈 진입 */
	@RequestMapping("/")
	public String homeGet() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>home 진입");
		return "redirect:/main";
	}

	/* 메인 페이지 진입 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGet() {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>mainPage 진입");
		return "main/main";
	}
}
```
</p>
</details>

<br>

### 4-2. 회원가입

<img width="600" alt="스크린샷 2023-06-11 11 16 36" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/c40036b5-9a88-4991-9321-2543d7394e97">


- 회원가입 기능 구현
- ID중복여부, 비밀번호 일치여부, 주소 검색 및 입력기능 구현

<details><summary><h4> 회원가입 페이지 구현 코드</h4></summary>
<p>

#### (1-1)join.jsp(body)
```html
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  (...)
</head>

<body>
	<!-- wrapper : 화면 전체랩 -->
	<div class="wrap">
		<!-- form -->
		<form id="join_form" method="post">

			<!-- 아이디 -->
			<div>
				<div class="sub_title">아이디</div>
				
				<input class="id_input" name="id" id="id" placeholder="아이디">
				
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span> 
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			</div>

			<!-- 비밀번호 -->
			<div>
				<div class="sub_title">비밀번호</div>
				
				<input class="pw_input" type="password" id="pw" name="pw" placeholder="비밀번호"/> 
				<input class="pwck_input" type="password" id="pwcheck" placeholder="비밀번호 확인"/>
				
				<div>
					<!-- 비밀번호 일치여부 확인 -->
					<font id="chkNotice" size="3"></font>
				</div>
			</div>

			<!-- 이름 -->
			<div>
				<div class="sub_title">이름</div>
				<input class="user_input" id ="name" name="name" placeholder="이름">
			</div>

			<!-- 전화번호 -->
			<div>
				<div class="sub_title">전화번호</div>
				<input class="mobile_input" id="mobile" name="mobile" placeholder="전화번호">
			</div>

			<!-- 이메일 전체영역 -->
			<div>
				<div class="sub_title">이메일</div>

				<div class="mail_input_box">
					<input class="mail_input"id="email" name="email" placeholder="이메일">
				</div>

				<div class="mail_check_input_box" id="mail_check_input_box_false">
					<input class="mail_check_input" disabled="disabled" id ="mail_check" placeholder="이메일 인증번호">
				</div>
				<div class="mail_check_button">인증번호 전송</div>
				<div class="clearfix"></div>
				<span id="mail_check_input_box_warn"></span>
			</div>

			<!-- 주소 전체영역 -->
			<div>
				<div class="sub_title">주소</div>
				<div class="address_input_1_box">
					<input class="address_input_1" name="postcode" id="postcode" readonly="readonly"
						placeholder="우편번호">
				</div>
				<div class="address_button" onclick="execution_daum_address()">주소찾기</div>
				<div class="clearfix"></div>
				<input class="address_input_2" name="address" readonly="readonly" placeholder="주소"> 
				<input class="address_input_3" name="addressDetail" id="addressDetail" placeholder="상세주소">
			</div>

			<!-- 가입하기 버튼 -->
			<input type="button" class="join_button" value="가입하기">

		</form>
		<!-- form 끝 -->
	</div>
	<!-- 화면 전체랩 끝 -->

</body>
</html>
```

#### (1-2)join.jsp(script)  
```html
<script>
//1. 회원가입 버튼 동작
$(function() { //기존 $(document).ready(function(){ 의 단순버전
	// 회원가입 버튼, 공란 확인
	$(".join_button").click(function() { //이름이 join_button인 클래스를 클릭하면 아래 코드가 실행된다.
		//ID 공백확인
		if ($("#id").val() == "") { //id가 'id'인 항목의 값이 ""(공백)인 경우 
			alert("아이디를 입력해주세요"); // "아이디를 입력해주세요" 라는 경고창이 뜨고
			$("#id").focus(); //id 항목으로 포커스가 이동한다.
			//PW 공백, 일치여부 확인
		} else if ($("#pw").val() == "") {
			alert("비밀번호를 입력해주세요");
			$("#pw").focus();
		} else if ($("#pwcheck").val() == "") {
			alert("비밀번호 확인 입력해주세요");
			$("#pwcheck").focus();
		} else if ($("#pwcheck").val() != $('#pw').val()) {
			alert("비밀번호가 일치하지 않음");
			$("#pwcheck").focus();
			//이름 공백확인
		} else if ($("#name").val() == "") {
			alert("이름 입력해주세요");
			$("#name").focus();
			//휴대폰번호 공백확인
		} else if ($("#mobile").val() == "") {
			alert("휴대폰번호를 입력해주세요");
			$("#mobile").focus();
			//이메일 공백, 인증번호 공백, 일치여부 확인
		} else if ($("#email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#email").focus(); 
		}/* 이메일 인증 잠시 주석처리
      else if ($("#mail_check").val() == "") {
			alert("이메일 인증번호를 입력해주세요");
			$("#postcode").focus();
		} else if ($("#mail_check").val() != code) {
			alert("인증번호를 다시확인해주세요 ");
			$("#mail_check").focus();
		}*/
			//주소 공백확인
		else if ($("#postcode").val() == "") {
			alert("주소 입력해주세요");
			$("#postcode").focus();
		} else if ($("#addressDetail").val() == "") {
			alert("상세주소를 입력해주세요");
			$("#postcode").focus();
			//이상없을경우 회원가입 진행(/joinAction)
		} else {
			$("#join_form").attr("action", "/joinAction").submit();
		}
	})
})
//1. 회원가입 버튼 끝

//2. id 중복검사
$('.id_input').on("change keyup paste input",function() { //id가 'id_input'인 값을 사용할거야
	var id = $('.id_input').val(); //id 변수로 id_input에 입력된 값을 선언
	var data = { id : id } // 이게 뭔지 모르겠ㅇ...id값으로 id를 받는다는거같은데 json 방식인건
	
	if (id == "") { //id에 입력된 값이 없는경우 
		$('.id_input_re_1').css("display", "none"); //id_input_re_1에 해당하는 항목을 안 보이게 한다
		$('.id_input_re_2').css("display", "none"); //id_input_re_2에 해당하는 항목을 안 보이게 한다
	} else { //id에 입력된 값이 있으면
		$.ajax({ 
			type : "post", //전송은 post방식으로 
			url : "/memberIdChk", //Controller에서 memberIdChk메소드를 찾아 실행한다.
			data : data, 
			success : function(result) { //Controller실행결과(return)가 result로 전달되어 아래 코드로 넘어간다.
				//console.log("확인 : " + result);
				if (result != 'fail') { //return값이 fail 인 경우
					$('.id_input_re_1').css("display", "inline-block"); 
					$('.id_input_re_2').css("display", "none"); //얘를 안 하니까 두 문구가 같이뜨네요?
				} else { //return 값이 success인 경우 
					$('.id_input_re_2').css("display", "inline-block");
					$('.id_input_re_1').css("display", "none");
				}
			}
		}); // ajax 끝
	}
})
//2. id 중복검사 끝

//3. 비밀번호 일치 여부
$(function() {
	$('#pw').keyup(function() {
		$('#chkNotice').html('');
	});	
	$('#pwcheck').keyup(function() {
		if ($('#pw').val() != $('#pwcheck').val()) {
			$('#chkNotice').html('비밀번호 일치하지 않음').attr('color', 'red');
		} else {
			$('#chkNotice').html('비밀번호 일치함').attr('color', 'green');
		}
	});
});
//3. 비밀번호 일치 여부 끝
</script>
```
#### (2)MemberController.java
```java
@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	/* 회원가입 실행 */
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinPost(MemberVO member) throws Exception {
  
		memberService.memberJoin(member);

		return "redirect:/main";
	}

	/* 아이디 중복 검사 */
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception {
		
		logger.info("vo 진입" + id);
		int result = memberService.idCheck(id);

		logger.info("결과값 : " + result);

		if (result != 0) {
			return "fail"; /* 중복아이디가 존재하면 fail */
		} else {
			return "success"; /* 중복아이디가 존재하지 않는다면 success */
		}
	}
}
```
#### (3)MemberServiceImpl.java
```java
@Service
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	MemberDAO dao;

	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		dao.memberJoin(member);
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}
}
```  

#### (4)MemberDAOImpl.java
```java
@Repository
public class MemberDAOimpl implements MemberDAO {
	@Autowired
	SqlSession sql;

	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		sql.insert("mapper.Member_SQL.memberJoin", member);
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String id) throws Exception {
		int result = sql.selectOne("mapper.Member_SQL.idCheck", id);
		return result;
	}
}
```  

#### (5)Member_SQL.xml
```xml
<mapper namespace="mapper.Member_SQL">

	<!-- 회원가입 -->
	<insert id="memberJoin">
		insert into member values(#{id},
		#{name}, #{pw},
		#{email},#{mobile}, #{postcode},
		#{address}, #{addressDetail}, 0,
		sysdate, 5000000, 0 )
	</insert>

	<!-- 아이디 중복검사 -->
	<select id="idCheck" resultType="int">
		SELECT count(id)
		FROM member
		WHERE
		id = #{id}
	</select>
</mapper>
```  
</p>
</details>

<br>

### 4-3. 상품목록 및 상세페이지

<table>
  <tr>
    <td>
      <img width="600" alt="스크린샷 2023-06-11 11 19 18" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/eb2470e0-3707-4085-a180-4014dad004c9">
    </td>
    <td>
      <img width="600" alt="스크린샷 2023-06-11 11 19 37" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/bbe40aca-bedf-4b7c-bab2-ec5266b7082a">
    </td>
  <tr>
</table>

- DB의 상품목록, 상품정보를 웹 페이지에 출력
- 상품목록페이지 : 카테고리를 부여해 상품의 종류별로 선택하여 조회
- 상품상세페이지 : 옵션 선택, 상품별 리뷰 조회

<details>
<summary><h4> 상품목록 페이지 구현 코드</h4></summary>
<p>

#### (1-1)itemList.jsp(body)
```html
(...생략...)

<body>
  <c:forEach items="${itemlist}" var="itemlist">
    <div class="card h-100" OnClick="location.href ='/itemDetail?num=${itemlist.itemnum}'" style="cursor:pointer;" >
       
        <!-- Product image-->
        <a>
          <img class="card-img-top" src="${itemlist.itemimg}" alt="..." />
        </a>
            
        <!-- Product name-->
        <h5 class="fw-bolder"><c:out value="${itemlist.itemname}" /></h5>
   
        <!-- Product actions-->
          <div class="text-center">
            <a class="btn btn-outline-dark mt-auto">제품 상세보기</a>
          </div>
        
    </div>
  </c:forEach>
</body>
```
  
#### (2)itemController.java
```java
(... 생략 ...)

@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService itemService;

	/* 상품 리스트 페이지 (카테고리-대분류) */
	@RequestMapping(value = "/itemListL", method = RequestMethod.GET)
	public String itemListL(Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");

		List<ItemVO> list = itemService.itemListL(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);

		return "item/itemList";
	}

	/* 상품 리스트 페이지 (카테고리-중분류) */
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(Model model, HttpServletResponse response, Integer cat) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 상품 리스트 페이지 진입");

		List<ItemVO> list = itemService.itemList(cat);
		logger.info("---------------글 목록 확인---------" + list);
		model.addAttribute("itemlist", list);

		return "item/itemList";
	}

}
```

#### (3)itemServiceImpl.java
```java
(... 생략 ...)

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemDAO dao;

	/* 상품 목록 대분류 */
	@Override
	public List<ItemVO> itemListL(Integer cat) throws Exception {
		return dao.itemListL(cat);
	}

	/* 상품 목록 중분류 */
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {
		return dao.itemList(cat);
	}
}
```

#### (4)itemDAOImpl.java
```java
(... 생략 ...)

@Repository
public class ItemDAOImpl implements ItemDAO {
	@Autowired
	SqlSession sql;

	/* 상품 목록 대분류 */
	@Override
	public List<ItemVO> itemListL(Integer cat) throws Exception {

		return sql.selectList("mapper.Item_SQL.item_listL", cat);
	}

	/* 상품 목록 중분류 */
	@Override
	public List<ItemVO> itemList(Integer cat) throws Exception {
		return sql.selectList("mapper.Item_SQL.item_list", cat);
	}
}
```
  
#### (5)Item_SQL.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
  <mapper namespace="mapper.Item_SQL">
    
	<resultMap type="ItemVO" id="itemlist">
		<result column="ITEMNUM" property="itemnum" jdbcType="INTEGER" javaType="Integer" />
		<result column="ITEMCAT1" property="itemcat1" jdbcType="INTEGER" javaType="Integer" />
		<result column="ITEMCAT2" property="itemcat2" jdbcType="INTEGER" javaType="Integer" />
		<result column="ITEMNAME" property="itemname" jdbcType="VARCHAR" javaType="String" />
	</resultMap>
	
  	<!-- 대분류 -->
	<select id="item_listL" resultMap="itemlist">
		SELECT *
		FROM ITEM
		WHERE itemcat1 = #{itemcat1}
	</select>
	
	<!-- 중분류 -->
	<select id="item_list" resultMap="itemlist">
		SELECT *
		FROM ITEM
		WHERE itemcat2 = #{itemcat2}
	</select>
</mapper>
```
</p>
</details>

<details>
<summary><h4> 상품 상세페이지 구현 코드</h4></summary>
<p>

#### (1-1)itemDetail.jsp(body)
```html
(... 생략 ...)
<body>
	<div id="wrapper"> <!-- 화면 전체영역 -->
		<input type="hidden" id="IDX" name="IDX" value="${detail.itemnum}"> <br>
			
			<!-- 상품정보 좌측 이미지 영역 -->
			<div style="float: left; width: 500;">
				<table>
					<tr><td><img src="${detail.itemdetailimg}" width="500" height="500" /></td></tr>
				</table>
			</div>
			
			<!-- 상품정보 우측영역 -->
				<!-- 상품명 -->
				<table> 
					<tr><td class="itemtext">${detail.itemname}</td></tr>
				</table>
				
				<!-- 상품 옵션선택 영역 -->
				<div id="item_option">
					<table>
						<tr> <td> <select name="OptionList" id="OptionList" class="OptionList1">
									<option value="">================ (필수)옵션: 색상/용량 선택 ================</option>
									
									<c:forEach var="list1" items="${list1}" varStatus="index">
										<c:if test="${list1.itemstock == 0}"> <!-- 재고0인 상품은 선택 불가 -->
											<option id="ba" value="${list1.itemoption}" disabled="disabled">${list1.itemoption}(품절)</option>
										</c:if>
										<c:if test="${list1.itemstock != 0}">
											<option value="${list1.itemoption}">${list1.itemoption}</option>
										</c:if>
									</c:forEach>
							</select> </td> </tr>
					</table>
				</div>
				
				<!-- 총 상품금액 -->
				<div class="totals-item totals-item-total"
					style="float: left; margin-left: 400px;">
					<label class="total_price">총상품금액</label>&nbsp;&nbsp;
					<div class="total_price" style="float: right;">원</div>
					<div class="totals-value" id="cart-total" style="float: right;">0</div>
				</div> 
		<!-- 상품정보 영역 끝 -->

		<div style="clear: both;"></div>

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
```
  
#### (1-2)itemDetail.jsp(script)
```html
<script>

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
})
</script>
```
#### (2)itemController.java
```java
(... 생략 ...)

@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	private ItemService itemService;
	
	/* 상품 목록&상세&리뷰 */
	@RequestMapping(value = "/itemDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String itemDetail(Model model, Integer num, Integer itemnum, HttpServletResponse response) throws Exception {

		ItemVO vo = itemService.itemDetail(num); //상품정보 불러오기
		model.addAttribute("detail", vo);
		
		List<ItemAttrVO> list = itemService.itemAttr(num); //옵션 불러오기
		model.addAttribute("list1", list);
		
		List<ReviewVO> review = itemService.itemreviewlist(num); //리뷰 불러오기
		model.addAttribute("review", review);
		
		return "item/itemDetail";
	}

	/* 상품 상세페이지 option 선택 ajax */
	@RequestMapping(value = "/itemOp", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String itemOp(ItemAttrVO vo, Model model, @RequestParam("option") String option,
			@RequestParam("num") Integer num) throws Exception {
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  진입");
		vo.setItemoption(option);
		vo.setItemnum(num);
		vo = itemService.itemOp(vo);

		Integer cost = vo.getItemcost();
		String to = Integer.toString(cost);

		logger.info("itemOp.cost = " + cost);
		logger.info("vo = " + vo);

		return to;
	}
}
```

#### (3)itemServiceImpl.java
```java
(... 생략 ...)

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	ItemDAO dao;

	/* 상품 상세페이지 */
	@Override
	public ItemVO itemDetail(Integer num) throws Exception {
		return dao.itemDetail(num);
	}
	
	/* 옵션 불러오기 */
	@Override
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception {
		return dao.itemAttr(num);
	}

	/* 상품 옵션선택 ajax */
	@Override
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception {
		return dao.itemOp(vo);
	}
}
```

#### (4)itemDAOImpl.java
```java
@Repository
public class ItemDAOImpl implements ItemDAO {
	@Autowired
	SqlSession sql;

	/* 상품 상세 */
	@Override
	public ItemVO itemDetail(Integer num) throws Exception {
		return sql.selectOne("mapper.Item_SQL.item_detail", num);
	}
	
	/* 옵션 불러오기 ajax */
	@Override
	public List<ItemAttrVO> itemAttr(Integer num) throws Exception {
		return sql.selectList("mapper.Item_SQL.item_attr", num);
	}

	/* 상품 옵션별 금액 불러오기 ajax */
	@Override
	public ItemAttrVO itemOp(ItemAttrVO vo) throws Exception {
		return sql.selectOne("mapper.Item_SQL.item_op", vo);
	}
}
```
  
#### (5)Item_SQL.xml
```xml
<!-- 상품상세페이지 -->
<select id="item_detail" resultType="ItemVO">
	SELECT *
	FROM ITEM
	WHERE itemnum = #{itemnum}
</select>

<!-- 옵션 박스 ajax -->
<select id="item_attr" resultMap="itemAttr">
	SELECT *
	FROM ITEMATTR
	WHERE itemnum = #{itemnum}
</select>

<!-- 가격  받아오는 ajax-->
<select id="item_op" resultType="ItemAttrVO">
	SELECT *
	FROM ITEMATTR
	WHERE itemnum = #{itemnum}
	AND itemoption = #{itemoption}
</select>

<!-- 상품리뷰 목록 -->
<select id="itemreview_list" resultMap="reviewlist">
	SELECT *
	FROM REVIEW
	WHERE itemnum = #{itemnum}
</select>
```
  
</p>
</details>
