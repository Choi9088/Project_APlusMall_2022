## ⭐ Project_APlusMall_[더조은]팀 프로젝트(작성중) ⭐ <br><br><br> 1. 프로젝트 개요

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

<br>

### 4-2. 회원가입

<img width="600" alt="스크린샷 2023-06-11 11 16 36" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/c40036b5-9a88-4991-9321-2543d7394e97">


- 회원가입 기능 구현
- ID중복여부, 비밀번호 일치여부, 주소 검색 및 입력기능 구현

<br>

### 4-3. 상품목록 및 상세페이지

<img width="600" alt="스크린샷 2023-06-11 11 19 18" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/eb2470e0-3707-4085-a180-4014dad004c9">

<img width="600" alt="스크린샷 2023-06-11 11 19 37" src="https://github.com/Choi9088/Project_APlusMall_2022/assets/132661247/bbe40aca-bedf-4b7c-bab2-ec5266b7082a">

- DB의 상품목록, 상품정보를 웹 페이지에 출력
- 상품목록페이지 : 카테고리를 부여해 상품의 종류별로 선택하여 조회
- 상품상세페이지 : 옵션 선택, 상품별 리뷰 조회
