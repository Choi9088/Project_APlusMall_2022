--  DDL for Table MEMBER
--------------------------------------------------------
   CREATE TABLE MEMBER (
     ID   VARCHAR2(20)   NOT NULL   PRIMARY KEY,
     NAME   VARCHAR2(100)   NOT NULL,
     PW   VARCHAR2(20)   NOT NULL,
     EMAIL   VARCHAR2(50)   NOT NULL   UNIQUE,
     MOBILE   VARCHAR2(20)   NOT NULL,
     POSTCODE   CHAR(5)   NOT NULL,
     ADDRESS   VARCHAR2(300)   NOT NULL,
     ADDRESSDETAIL   VARCHAR2(300)   NOT NULL,
     ADMIN   CHAR DEFAULT'0',
     JOINDATE   DATE ,
     POINT   NUMBER,
     LEAVE   CHAR   DEFAULT'0'      
   );
   
      COMMENT ON COLUMN MEMBER.ID IS '회원아이디';
      COMMENT ON COLUMN MEMBER.NAME IS '회원이름';
      COMMENT ON COLUMN MEMBER.PW IS '비밀번호';
      COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
      COMMENT ON COLUMN MEMBER.MOBILE IS '핸드폰';
      COMMENT ON COLUMN MEMBER.POSTCODE IS '우편번호';
      COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
      COMMENT ON COLUMN MEMBER.ADDRESSDETAIL IS '상세주소';
      COMMENT ON COLUMN MEMBER.ADMIN IS '관리자구분';
      COMMENT ON COLUMN MEMBER.JOINDATE IS '가입날짜';
      COMMENT ON COLUMN MEMBER.POINT IS '포인트';
      COMMENT ON COLUMN MEMBER.LEAVE IS '회원상태';
      
--------------------------------------------------------
--  DDL for Table ORDERTABLE
--------------------------------------------------------  
   CREATE TABLE ORDERTABLE (
     ID   VARCHAR2(20),
     ORDERNUM   NUMBER   PRIMARY KEY,
     SHIPPINGNUM   VARCHAR2(20),
     SHIPPINGCOST   VARCHAR2(20),
     ORDERCOST   NUMBER,
     ORDERDATE   DATE,
     PAYMENT   VARCHAR2(20),
     POSTCODE   VARCHAR2(20),
     ADDRESS   VARCHAR2(45),
     ADDRESSDETAIL   VARCHAR2(45),
     MOBILE   VARCHAR2(20),
     NAME   VARCHAR2(20),
     ITEMCODE   NUMBER,
     REVIEW   NUMBER,
     STATE   VARCHAR2(20)   DEFAULT '주문완료' 
   );

      COMMENT ON COLUMN ORDERTABLE.ID IS '아이디';
      COMMENT ON COLUMN ORDERTABLE.ORDERNUM IS '주문번호';
      COMMENT ON COLUMN ORDERTABLE.SHIPPINGNUM IS '운송장번호';
      COMMENT ON COLUMN ORDERTABLE.SHIPPINGCOST IS '배송비';
      COMMENT ON COLUMN ORDERTABLE.ORDERCOST IS '결제가격';
      COMMENT ON COLUMN ORDERTABLE.ORDERDATE IS '결제날짜';
      COMMENT ON COLUMN ORDERTABLE.PAYMENT IS '결제수단';
      COMMENT ON COLUMN ORDERTABLE.POSTCODE IS '우편번호';
      COMMENT ON COLUMN ORDERTABLE.ADDRESS IS '주소';
      COMMENT ON COLUMN ORDERTABLE.ADDRESSDETAIL IS '상세주소';
      COMMENT ON COLUMN ORDERTABLE.MOBILE IS '핸드폰';
      COMMENT ON COLUMN ORDERTABLE.NAME IS '이름';
      COMMENT ON COLUMN ORDERTABLE.ITEMCODE IS '상품번호';
      COMMENT ON COLUMN ORDERTABLE.REVIEW IS '리뷰작성여부';
      COMMENT ON COLUMN ORDERTABLE.STATE IS '주문배송상태';   
      
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------
   CREATE TABLE EVENT (
     EVENTNUM   NUMBER   PRIMARY KEY,
     EVENTDATE   DATE,
     EVENTTITLE   VARCHAR(255),
     EVENTCONTENT   VARCHAR(4000)       
   );

      COMMENT ON COLUMN EVENT.EVENTNUM IS '이벤트번호';
      COMMENT ON COLUMN EVENT.EVENTDATE IS '이벤트작성날짜';
      COMMENT ON COLUMN EVENT.EVENTTITLE IS '이벤트제목';
      COMMENT ON COLUMN EVENT.EVENTCONTENT IS '이벤트내용'; 
      
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------
   CREATE TABLE REVIEW (
     ITEMNUM   NUMBER,
     ID   VARCHAR(255),
     REVIEWNUM   NUMBER   PRIMARY KEY,
     REVIEWDATE   DATE,
     REVIEWTITLE   VARCHAR(255),
     REVIEWCONTENT   VARCHAR(4000),
     ORDERNUM NUMBER
   );

      COMMENT ON COLUMN REVIEW.ITEMNUM IS '상품번호';
      COMMENT ON COLUMN REVIEW.ID IS '아이디';
      COMMENT ON COLUMN REVIEW.REVIEWNUM IS '리뷰번호';
      COMMENT ON COLUMN REVIEW.REVIEWDATE IS '리뷰작성날짜'; 
      COMMENT ON COLUMN REVIEW.REVIEWTITLE IS '리뷰제목';
      COMMENT ON COLUMN REVIEW.REVIEWCONTENT IS '리뷰내용';
      COMMENT ON COLUMN REVIEW.ORDERNUM IS '주문번호';
      
--------------------------------------------------------
--  DDL for Table ITEM
--------------------------------------------------------
   CREATE TABLE ITEM (
     ITEMNUM   NUMBER   PRIMARY KEY,
     ITEMNAME   VARCHAR(255),
     ITEMCAT2   NUMBER,
     ITEMIMG   VARCHAR2(200),
     ITEMDETAILIMG   VARCHAR2(200),
     ITEMCAT1   NUMBER    
   );

      COMMENT ON COLUMN ITEM.ITEMNUM IS '상품번호';
      COMMENT ON COLUMN ITEM.ITEMNAME IS '상품이름';
      COMMENT ON COLUMN ITEM.ITEMCAT2 IS '카테고리2';
      COMMENT ON COLUMN ITEM.ITEMIMG IS '썸네일'; 
      COMMENT ON COLUMN ITEM.ITEMDETAILIMG IS '상세이미지';
      COMMENT ON COLUMN ITEM.ITEMCAT1 IS '카테고리1';
      
--------------------------------------------------------
--  DDL for Table ITEMATTR
--------------------------------------------------------   
   CREATE TABLE ITEMATTR (
     ITEMNUM   NUMBER   ,
     ITEMCODE   NUMBER PRIMARY KEY,
     ITEMNAME   VARCHAR(20),
     ITEMCOST   NUMBER,
     ITEMSTOCK   NUMBER,
     ITEMOPTION   VARCHAR(20)
   );

      COMMENT ON COLUMN ITEMATTR.ITEMNUM IS '상품번호';
      COMMENT ON COLUMN ITEMATTR.ITEMCODE IS '상품코드';
      COMMENT ON COLUMN ITEMATTR.ITEMNAME IS '상품이름';
      COMMENT ON COLUMN ITEMATTR.ITEMCOST IS '상품가격';
      COMMENT ON COLUMN ITEMATTR.ITEMSTOCK IS '재고'; 
      COMMENT ON COLUMN ITEMATTR.ITEMOPTION IS '옵션';
      
      
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------
   CREATE TABLE CART(
     ID   VARCHAR(20),
     ITEMNAME   VARCHAR(200),
     ITEMCODE   NUMBER,
     ITEMCOST   NUMBER,
     ITEMIMG   VARCHAR(200), 
     ITEMOPTION   VARCHAR(200)
   );
 
      COMMENT ON COLUMN CART.ID IS '아이디';
      COMMENT ON COLUMN CART.ITEMNAME IS '상품이름';
      COMMENT ON COLUMN CART.ITEMCODE IS '상품코드';
      COMMENT ON COLUMN CART.ITEMCOST IS '상품가격'; 
      COMMENT ON COLUMN CART.ITEMIMG IS '썸네일';
      COMMENT ON COLUMN CART.ITEMOPTION IS '상품속성';
   
----------------------------
--  DDL for Sequence EVENTNUM_SEQ
----------------------------
CREATE SEQUENCE  EVENTNUM_SEQ  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;

----------------------------
--  DDL for Sequence REVIEWNUM_SEQ
----------------------------
CREATE SEQUENCE  REVIEWNUM_SEQ  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;

----------------------------
--  DDL for Sequence ITEMNUM_SEQ
----------------------------
CREATE SEQUENCE  ITEMNUM_SEQ  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE ORDER NOCYCLE ;
