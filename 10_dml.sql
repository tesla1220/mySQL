-- DML (Date Manipulation Laguage)
-- 데이터 조작 언어, 테이블에 값을 삽입·수정·삭제하는 
-- (데이터베이스 내의 데이터를 조작하는데 사용하는) SQL의 한 부분이다.

-- insert
-- 새로운 행을 추가하는 구문이다.
-- 테이블 행의 수가 증가한다.

-- 값이 잘 들어갔는 지 확인 조회용
SELECT 	*  FROM tbl_menu;

-- 값을 넣을 거야. 어디에? tbl_menu. 그러면 값은? values (); 
INSERT INTO tbl_menu VALUES (null, '바나나해장국', 8500, 4, 'Y'); 

DESCRIBE tbl_menu;

-- auto increment : 자동으로 증가되는 기능 / 값을 넣지 않는다면 자동으로 번호를 부여받음 
-- null 허용 가능한(nllable) 컬럼이나 auto increment 가 있는 컬럼은 null을 부여할 수 있다. 

INSERT INTO tbl_menu(menu_name, menu_price, category_code, orderable_status)
VALUES ('초콜릿죽', 6500, 7, 'Y') ;

-- multi insert 
INSERT INTO
	tbl_menu
VALUES
	(null, '참치맛아이스크림', 1700, 12, 'Y'),
    (null, '멸치맛아이스크림', 1500, 11, 'Y'),
    (null, '소시지맛커피', 2500, 8, 'Y');
SELECT * FROM tbl_menu;

-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문
-- 테이블의 전체 행 개수는 변화가 없다 

-- 수정 대상

SELECT 
	menu_code,
    category_code
FROM
	tbl_menu
WHERE
	menu_name = '민트초코';

UPDATE tbl_menu
SET 
	category_code = 7,
    menu_name = '민트초코'
WHERE
	menu_code = 7;
    
-- delete 
-- 테이블 행을 삭제하는 구문이다.
-- 테이블 행의 개수가 줄어든다.

-- 삭제 확인용 

SELECT * FROM tbl_menu;

DELETE FROM tbl_menu WHERE menu_name = '초콜릿죽';

-- limit 를 활용한 delete 

SELECT * FROM tbl_menu; 

DELETE FROM tbl_menu
ORDER BY menu_price
LIMIT 3;     

-- 테이블 행 전체 삭제 
DELETE FROM tbl_menu;

SELECT * FROM tbl_menu;

-- replace 
-- update : 특정 조건을 만족하는 행의 값을 update 함
-- replace : 특정 행이 이미 존재하는 경우에는 그 행을 갱신, 
-- 			 그렇지 않은 경우 새 행을 삽입.
-- 			 즉, 해당 행을 삭제하고 새로운 값을 삽입하는 것이다. 

SELECT * FROM tbl_menu;

-- INSERT 시 Primary key 또는 unique key가 충돌이 발생한다. 
-- INSERT INTO tbl_menu VALUES(1, '열무김치아메리카노', 5000, 8, 'Y');


REPLACE INTO tbl_menu VALUES(1, '열무김치아메리카노', 5000, 8, 'Y');

SELECT * FROM tbl_menu;

REPLACE tbl_menu
SET 
	menu_code = 2,
    menu_name = '우럭주스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'N';

USE menudb;