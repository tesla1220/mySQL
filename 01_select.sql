-- select 절은 MySQL 의 가장 기본적인 명령어로 특정 테이블에서 원하는 데이터를 조회할 수 있다. 

select			-- 조회해줘
	menu_name	-- 어떤 컬럼을?
from tbl_menu;	-- 어디서?

select
	menu_code,
    menu_name,
    menu_price
from tbl_menu;

-- tbl_menu 테이블에서 메뉴코드와 카테고리코드, 메뉴가격을 조회해줘 
select
	menu_code,
    category_code,
    menu_price
from tbl_menu;

-- tbl_menu 테이블에서 모든 컬럼을 조회해줘 
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from tbl_menu;

-- * 
select 
		*
from tbl_menu;

-- mySQL 도 내장함수가 있다. 

select now();
select concat('이', '감사 ', '지은');

-- 컬럼에 별칭을 사용할 수 있다. 
select concat('이', '혜', '진') as 내이름; 
select concat('이', '혜', '진') as '내 이름'; 	-- 띄어쓰기가 들어가면 홀따옴표로 감싸줘야 함 

	