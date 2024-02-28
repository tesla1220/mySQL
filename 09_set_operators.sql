-- 09_set_operators

-- 두 개 이상의 select 문의 결과 집합을 결합할 때 사용 

-- union 
-- 두 개 이상의 select 문의 결과를 결합해 중복된 레코드를 제거한 후 반환하는 SQL 연산자 
        
-- 1
SELECT
	*
FROM 
	tbl_menu
WHERE 
	category_code = 10;
    
-- 2
SELECT 
	*
FROM 
	tbl_menu
WHERE
	menu_price < 9000;
    
-- 위에 두 개의 쿼리문 중복 제거해 합치기!! => 상기식 ; 제거 후 UNION 추가 
 
-- 1
SELECT
	*
FROM 
	tbl_menu
WHERE 
	category_code = 10
UNION
-- 2
SELECT 
	*
FROM 
	tbl_menu
WHERE
	menu_price < 9000;

-- union all 
-- 두 개 이상의 select 문의 결과를 결합해 모두 반환 (중복 레코드 제거x)

-- 1
SELECT
	*
FROM 
	tbl_menu
WHERE 
	category_code = 10
UNION ALL     
-- 2
SELECT 
	*
FROM 
	tbl_menu
WHERE
	menu_price < 9000;
    
-- intersect 
-- 두 select 문의 결과 중 공통 레코드만 반환하는 SQL 연산자
-- mySQL은 intersect 제공하지 않음
-- But, inner join 또는 in 연산자를 활용해 구현하는 것은 가능

-- inner join 활용

-- 1
SELECT 
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderatble_status
FROM 
	tbl_menu;

-- 2 
SELECT 
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE 
	menu_price < 9000;
    
-- 결과
SELECT 
	a.menu_code,
	a.menu_name,
	a.menu_price,
    a.category_code,
    a.orderable_status
FROM 
	tbl_menu a
INNER JOIN
			(
				SELECT 
					menu_code,
					menu_name,
					menu_price,
					category_code,
					orderable_status
			    FROM
					tbl_menu
			    WHERE 
					menu_price < 9000
			) b
            ON
            (a.menu_code = b.menu_code);
