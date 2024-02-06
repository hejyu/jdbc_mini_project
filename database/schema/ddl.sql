/**
 * 테이블 정규화
 * 샘플 데이터 생성
 */


-- 테이블 삭제
DROP TABLE tbl_menu;
DROP TABLE tbl_place_address;
DROP TABLE tbl_place;
DROP TABLE tbl_area_unit;

DROP SEQUENCE place_seq;
DROP SEQUENCE address_seq;
DROP SEQUENCE menu_seq;


-- 데이터 삭제
TRUNCATE TABLE tbl_menu;
TRUNCATE TABLE tbl_place_address;
TRUNCATE TABLE tbl_place;
TRUNCATE TABLE tbl_area_unit;


-- 가게 정보 테이블
CREATE TABLE tbl_place(
	 place_seq number(8) PRIMARY KEY,
	 name varchar2(100) NOT NULL,
	 phone varchar2(100),
	 rate NUMBER(3,2) CHECK (rate >= 0 AND rate <= 5),
	 open_time varchar2(50) NOT NULL,
	 close_time varchar2(50) NOT NULL,
	 food_type  varchar2(50)
	 
);

-- 시퀀스 생성
CREATE SEQUENCE place_seq;

-- 샘플테이터 생성
INSERT INTO tbl_place tp
VALUES (place_seq.nextval, '닭치고낙곱새 현풍직영점', '0507-1346-8818', 4.5, '11:30', '22:00', '한식');

INSERT INTO tbl_place tp
VALUES (place_seq.nextval, '리안', '053-746-0203', 4.5, '11:30', '21:00', '중식');


SELECT * FROM tbl_place;


-- 기본 주소록 테이블
CREATE TABLE tbl_place_address (
	address_seq number(8) PRIMARY KEY,  
	address varchar2(500) NOT NULL,
	place_seq NUMBER(8) NOT NULL,
	FOREIGN KEY (place_seq)				
			REFERENCES tbl_place(place_seq)
);

CREATE SEQUENCE address_seq;

--TRUNCATE TABLE TBL_PLACE_ADDRESS;

-- 샘플 데이터 생성
INSERT INTO tbl_place_address tp
VALUES (address_seq.nextval, '대구 달성군 현풍읍 테크노중앙대로5길 16-6', 21);

INSERT INTO tbl_place_address tp
VALUES (address_seq.nextval, '대구 수성구 교학로4길 48', 22);

SELECT * FROM tbl_place_address;


-- 시퀀스 생성
-- 메뉴 정보 테이블
CREATE TABLE tbl_menu (
	menu_seq number(8) PRIMARY KEY ,
	place_seq number(8) NOT NULL,
	menu_name varchar2(100) NOT NULL ,	
	price number(8) NOT NULL,
	FOREIGN KEY (place_seq)				
			REFERENCES tbl_place(place_seq)
);

-- 시퀀스 생성
CREATE SEQUENCE menu_seq;

-- 샘플 데이터 생성
INSERT INTO tbl_menu tp
VALUES (menu_seq.nextval, 21,'2인)낙곱새 (공기밥별도)', 22000);

INSERT INTO tbl_menu tp
VALUES (menu_seq.nextval, 21,'2인)낙닭새 (공기밥별도)', 22000);

INSERT INTO tbl_menu tp
VALUES (menu_seq.nextval, 22,'짜장면', 5000);

INSERT INTO tbl_menu tp
VALUES (menu_seq.nextval, 22,'짬뽕', 7000);

SELECT * FROM TBL_MENU;


-- 지역 테이블 
CREATE TABLE tbl_area_unit (
	area_unit_code number(8) PRIMARY KEY,  
	unit_name varchar2(50) NOT NULL
);



INSERT INTO TBL_AREA_UNIT
VALUES (2,'서울');

INSERT INTO TBL_AREA_UNIT
VALUES (32,'인천');

INSERT INTO TBL_AREA_UNIT
VALUES (62,'광주');

INSERT INTO TBL_AREA_UNIT
VALUES (31,'경기');

INSERT INTO TBL_AREA_UNIT
VALUES (53,'대구');

INSERT INTO TBL_AREA_UNIT
VALUES (64,'제주');

SELECT * FROM TBL_AREA_UNIT;


-- 샘플데이터 INSERT

SELECT * FROM TBL_PLACE_ADDRESS tpa ;

SELECT * FROM TBL_PLACE ;

SELECT * FROM TBL_area_unit;





