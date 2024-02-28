-- order by 
-- order by 절은 select 문과 함께 사용하며
-- 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용한다. 

select
	menu_code,
    menu_name,
    menu_price
from tbl_menu
order by 
	menu_price asc;  -- asc 는 오름차순, desc 는 내림차순이다. 
    
select 
	menu_code,
    menu_name,
    menu_price
from tbl_menu
order by 
	menu_price desc;
    
    -- tbl_menu 에서 메뉴 코드랑 메뉴 이름, 메뉴 가격을 조회해줘. 근데 메뉴 이름은 내림차순으로 조회해줘.
select
	menu_code,
    menu_name,
    menu_price
from tbl_menu
order by
	menu_name desc;
    
-- 여러 열로 정렬
SELECT 
	menu_code,
    menu_name,
    menu_price
FROM tbl_menu
ORDER BY 
	menu_price desc,
    menu_name asc;
    
-- order by 절을 사용해 연산 결과로 결과 집합 정렬
SELECT 
	menu_code,
    menu_price,
    menu_code * menu_price -- 곱셈
FROM
	tbl_menu
ORDER BY
	menu_code * menu_price desc;
    
SELECT 
	menu_code,
    menu_price,
    menu_code * menu_price as 연산결과 
FROM tbl_menu
ORDER BY
	menu_code * menu_price desc;

-- order by 절을 사용하여 사용자 지정 목록을 사용하여 데이터 정렬 

-- 맨 왼쪽 값이 2번째 인자 이후 값과 일치하면 해당 위치 값을 반환 
SELECT field('c','a','b','c');

SELECT 
	field(orderable_status, 'N', 'Y')
FROM tbl_menu;

-- tbl_menu 테이블에서 메뉴 이름, 판매 상태를 조회하는데 판매 상태가 N인 친구들이 위로 오게 
SELECT
	menu_name,
    orderable_status
FROM tbl_menu
ORDER BY field(orderable_status, 'N', 'Y');

-- null 값이 있는 컬럼에 대한 정렬
SELECT
	*
FROM tbl_category;

-- 오름차순 시 null 값이 처음으로 (default) 
SELECT 
	category_code,
    category_name,
    ref_category_code
FROM tbl_category
ORDER BY 
	ref_category_code desc;

SELECT
	category_code,
    category_name,
    ref_category_code
FROM tbl_category
ORDER BY 
	ref_category_code is null asc;
    
    