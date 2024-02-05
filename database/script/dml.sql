/**
 * 데이터 조회 SQL  
 * 	1. 맛집 찾기 ( 이름으로, 평점으로, 메뉴로 )
 * 	2. 지역별로 랜덤 맛집 하나만 보여주기
 * 	3. 지역별로 찾기 
 *	4. 평점순(5점 만점) 으로 보여주기
 * 	5. 수정(평점)
 */

SELECT * FROM tbl_place;
SELECT * FROM tbl_menu;
SELECT * FROM tbl_place_address;


-- 1. 맛집찾기 
-- (이름, 평점, 메뉴)
SELECT  tp.place_seq
	  , name
	  , open_time 
	  , close_time
	  , tpa.address
	  , tm.menu_name
	  , tm.price
FROM  tbl_place tp
	, tbl_menu tm
	, tbl_place_address tpa
WHERE tp.place_seq = tm.place_seq
    AND tp.place_seq = tpa.place_seq 
    
  	-- 이름으로 찾으면 실행
	AND tp.name LIKE '%' || '낙곱새'  ||'%'
	
	-- 평점으로 몇점이상인 맛집 찾으면 실행
	AND rate >= 4.5
	
	-- 메뉴로 찾으면 실행
    -- AND tm.menu_name LIKE '%' || '낙곱새'  ||'%'
;


-- 2. 지역별로 랜덤 맛집 하나만 보여주기
SELECT *
FROM (
	SELECT   tp.place_seq
			, tp.name
			, open_time 
		  	, close_time
		  	, tpa.address
	FROM  tbl_place tp
		, tbl_place_address tpa
		, tbl_area_unit au
	WHERE tp.place_seq = tpa.place_seq
	  AND substr(tpa.address,0,2) = au.unit_name
	  AND au.unit_name = '대구'
	ORDER BY DBMS_RANDOM.VALUE
)
WHERE ROWNUM <=3;


-- 3. 지역별로 찾기 
-- 서울 / 인천 /부산 /대구 /광주 /제주 
SELECT   tp.place_seq
		,tp.name
		, open_time 
	  	, close_time
	  	, tpa.address
FROM  tbl_place tp
	, tbl_place_address tpa
	, tbl_area_unit au
WHERE tp.place_seq = tpa.place_seq
  AND substr(tpa.address,0,2) = au.unit_name
  AND au.unit_name = '대구'
;	

SELECT * FROM tbl_place;

-- 4. 평점순(5점 만점) 으로 보여주기
SELECT    tp.place_seq
		, tp.name
		, open_time 
	  	, close_time
	  	, tpa.address
	  	, tp.rate
FROM  tbl_place tp
	, tbl_place_address tpa
WHERE tp.place_seq = tpa.place_seq
-- 평점 높은 순으로 정렬
ORDER BY rate DESC;
;	

-- 5. 수정(평점) 
UPDATE tbl_place 
SET rate = '4.7'
WHERE place_seq = 22
;


