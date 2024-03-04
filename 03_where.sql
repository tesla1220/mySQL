-- WHERE 
-- WHERE 절은 특정 조건에 맞는 레코드만 선택하는데 사용되며, 
-- 다양한 방법으로 조건을 설정할 수 있다. 

SELECT 
	menu_name,
    menu_price,
    orderable_status
FROM 
	tbl_menu
WHERE 
	orderable_status = 'Y';

-- tbl_menu 테이블에서 메뉴 이름, 가격, 판매 상태를 조회할건데
-- 메뉴 가격이 13000원인 친구들만 조회해줘

SELECT 
	menu_name,
    menu_price,
    orderable_status
FROM 
	tbl_menu
WHERE
	menu_price = 13000;
    
    
    
<<<<<<< HEAD
-- 메뉴 코드, 이름, 판매 상태를 / tbl_menu 테이블에서 / 판매 상태가 Y가 아닌 애들만 조회해줘 
=======
-- tbl_menu 테이블에서 메뉴 코드, 이름, 판매 상태를 조회할건데 
-- 판매 상태가 Y가 아닌 애들만 조회해줘 
>>>>>>> 665abcdea11f14f61be6a3674a2f6dd94399dc5e

SELECT
	menu_code,
    menu_name,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status != 'Y';
    -- ( !=, <> ) 부정

    -- 메뉴 코드, 이름, 가격을 / tbl_menu 에서 / 가격이 20000원 초과인 녀석들만 조회해줘
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_price > 20000;
    
-- 메뉴 코드, 이름, 가격을 / tbl_menu 테이블에서 / 가격 10000원 이상 20000원 이하 항목들을 조회해줘 
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM 
	tbl_menu
WHERE
	10000 <= menu_price AND menu_price<= 20000;
    
    
-- and / or 연산자 
-- where 절과 함께 사용을 하며 
-- 자바랑 똑같다. 
-- (or) : 둘 다 null 이 아니면서 하나라도 0이 아닌 값을 있을 경우 1을 반환한다. 
	
-- or 테스트 
SELECT 1 OR 1, 1 OR 0, 0 OR 1;
SELECT 0 OR 0; 

SELECT 
	menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status = 'Y'
    OR
    category_code = 10
ORDER BY
	category_code;
    
-- 모든 컬럼을 tbl_menu 에서 조회하는데, 
-- 가격이 5000원이 넘거나 카테고리 코드가 10인 녀석들을 조회해줘
SELECT
	*
FROM 
	tbl_menu
WHERE 
	menu_price > 5000 
    OR 
    category_code = 10; 

    
-- (AND) 연산자
-- WHERE절과 함께 AND 연산자 사용 
    
SELECT 1 AND 1;
SELECT 1 AND 0, 0 AND 1, 0 AND 0;

-- 모든 컬럼을 tbl_menu 테이블에서 조회하는데,
-- 판매상태가 y이면서 카테고리 코드가 10인 녀석들만 조회해줘

SELECT
	*
FROM 
	tbl_menu
WHERE
	orderable_status = 'Y'
    AND 
    category_code = 10;

-- AND 와 OR 의 우선순위
-- AND 가 OR 보다 우선순위가 높다. 
-- 따라서 OR 의 우선순위를 높이고 싶으면 소괄호를 사용한다. 

SELECT 
	*
FROM
	tbl_menu
WHERE
	category_code = 4
	OR 
    menu_price = 9000
    AND 
    menu_code > 10;
    
-- BETWEEN 연산자랑 WHERE
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price BETWEEN 10000 AND 20000;
    
-- 부정 BETWEEN 
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price NOT BETWEEN 10000 AND 20000;

-- LIKE 연산자
-- 메뉴 이름, 가격을 tbl_menu 테이블에서 조회하는데
-- 메뉴 이름이 '마늘' 단어를 포함하고 있는 녀석들만 조회해줘 

SELECT 
	menu_name,
    menu_price
FROM
	tbl_menu
WHERE 
	menu_name LIKE '%마늘%';
    
-- 모든 컬럼을 tbl_menu 테이블에서 조회하는데
-- 가격이 5000원 넘으면서 카테고리 코드가 10이면서 '갈치' 단어를 포함하고 있는 녀석을 출력해줘

SELECT
	*
FROM 
	tbl_menu
WHERE 
	menu_price > 5000
    AND
    category_code = 10 
    AND
	menu_name LIKE '%갈치%';
    
-- IN 연산자 활용
-- 메뉴 이름, 카테고리 코드를 tbl_menu 테이블에서 조회하는데
-- 카테고리 코드가 4, 5, 6인 애들을 조회해줘 

SELECT 
	menu_name,
    category_code
FROM 
	tbl_menu
WHERE
	category_code IN (4, 5, 6);
    

-- IS NULL 연산자 활용 
SELECT
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
WHERE
	ref_category_code IS NOT NULL;
    