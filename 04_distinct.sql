-- DISTINCT 
-- DISTINCT 는 중복된 값을 제거하는데 사용된다.
-- 컬럼에 있는 컬럼값들의 종류를 쉽게 파악할 수 있다. 

SELECT
	*
FROM
	tbl_menu
ORDER BY
	category_code;
-- 단일 열(컬럼) 중복 제거
SELECT
	DISTINCT category_code
FROM
	tbl_menu
ORDER BY 
	category_code;
    
-- NULL 값을 포함한 열의 DISTINCT 사용 
SELECT 
	*
FROM 
	tbl_category;
SELECT 
	DISTINCT ref_category_code
FROM 
	tbl_category;
    
-- 다중 열(컬럼) DISTINCT 사용
-- 다중열들의 값이 모두 동일하면 중복된 것으로 판별한다. 
SELECT 
	category_code,
    orderable_status
FROM
	tbl_menu;
    
SELECT DISTINCT 
	category_code
    orderable_status
FROM 
	tbl_menu;
    

