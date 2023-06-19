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

<details><summary><h3> 메인페이지 구현 코드</h3></summary>
<p>

#### .jsp
```ruby
   
```

</p>
</details>

<br>

### 4-2. 회원가입

<img width="600" alt="스크린샷 2023-06-11 11 16 36" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/c40036b5-9a88-4991-9321-2543d7394e97">


- 회원가입 기능 구현
- ID중복여부, 비밀번호 일치여부, 주소 검색 및 입력기능 구현

<details><summary><h3> 회원가입 페이지 구현 코드</h3></summary>
<p>

#### (1-1)join.jsp(body)
```html
(...생략...)
	
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
package com.aplus.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aplus.model.MemberVO;
import com.aplus.service.MemberService;

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
  
		/* 회원가입 서비스 실행 */
		memberService.memberJoin(member);

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 회원가입 성공");

		return "redirect:/main";
	}

	/* 아이디 중복 검사 */
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception {

		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> memberIdChk 진입");
		
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
package com.aplus.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aplus.controller.LoginController;
import com.aplus.dao.MemberDAO;
import com.aplus.model.MemberVO;

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
package com.aplus.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aplus.model.MemberVO;

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
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
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
<summary><h3> 상품목록 페이지 구현 코드</h3></summary>
<p>

#### (1-1)item.jsp(body)
```html
```
</p>
</details>
