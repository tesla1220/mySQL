-- subqueries 
-- 다른 쿼리 내에서 실행되는 쿼리다.
-- subquery의 결과를 활용해 복잡한 mainquery를 작성해 한 번에 여러 작업을 수행할 수 있다. 

-- tbl_menu 테이블에서 민트미역국과 같은 카테고리를 코드를 가지고 있는 행들의 모든 정보를 조회하시오.

SELECT 
	category_code
FROM 
	tbl_menu
WHERE 
	menu_name = '민트미역국';
    
SELECT 
	*
FROM 
	tbl_menu
WHERE 
	category_code = '4';
    
-- 해결

SELECT
	*
FROM
	tbl_menu
WHERE
	category_code = ( 
						SELECT 
							category_code
						FROM
							tbl_menu
						WHERE
							menu_name = '민트미역국'
					);

-- count() : 특정 열 또는 행의 수를 반환하는 데 사용

SELECT 
	category_code,
    count(*) AS 'count'
FROM 
	tbl_menu
GROUP BY 
	category_code;
    
-- FROM 절에 쓰인 서브쿼리(derived table, 파생 테이블) 
-- 반드시 자신의 별칭이 있어야 한다. 
-- 이 count 라는 컬럼이 가진 가장 큰 값 -> 6이라는 값을 도출하고 싶다. 

-- max() : 최대값 반환

SELECT 
	max(count)
FROM 
	(
		SELECT 
			count(*) AS 'count'
		FROM 
			tbl_menu
		GROUP BY 
			category_code
    ) AS countmenu;
    
-- 상관 서브쿼리
-- 메인쿼리가 서브쿼리 결과에 영향을 주는 경우 상관 서브쿼리라고 한다. 

-- tbl_menu 테이블에서 카테고리 코드가 4번인 친구들의 메뉴 가격 평균을 조회하시오.
-- avg()

SELECT
	avg(menu_price)
FROM 
	tbl_menu
WHERE
	category_code = 4;

-- 카테고리별 평균 가격보다 높은 가격을 가진 메뉴의 메뉴코드, 메뉴이름, 메뉴가격, 카테고리코드를 tbl_menud에서 조회하시오.

SELECT
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code
FROM
	tbl_menu a
WHERE 
	menu_price > ( SELECT 
						avg(menu_price)
					FROM
						tbl_menu
					WHERE
						category_code = a.category_code
					);
                    
-- cte (common table expressions)
-- 파생 테이블과 비슷한 개념. 코드의 가독성과 재사용성을 위해 파생 테이블 대신 사용

SELECT 
	a.menu_name,
    b.category_name
FROM 
	tbl_menu a
JOIN
	tbl_category b
    ON
    a.category_code = b.category_code;
    
WITH menucate AS ( 
					SELECT 
						a.menu_name,
						b.category_name
                    FROM
						tbl_menu a
					JOIN
						tbl_category b
                        ON
							a.category_code = b.category_code
                            ) 

SELECT
		*
        



