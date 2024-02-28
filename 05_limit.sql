-- LIMIT 
-- LIMIT 절은 SELECT 문의 결과 집합에서 반환할 행의 수를 제한하는데 사용된다. 

SELECT 
	*
FROM 
	tbl_menu
ORDER BY 
	menu_price DESC; 
    
SELECT 
	* 
FROM
	tbl_menu
ORDER BY 
	menu_price DESC
LIMIT 5;

-- LIMIT [OFFSET, ] ROW_COUNT 
-- OFFSET : 시작할 행의 번호 (인덱스 체계)
-- ROW_COUNT : 이후 행부터 반환받을 행의 개수 

SELECT 
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC
LIMIT 
	1, 4;