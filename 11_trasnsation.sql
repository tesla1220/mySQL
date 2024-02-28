-- transaction
-- 시작, 진행, 종료 단계를 가지며 만약 중간에 오류가 발생하면 
-- rollback(시작 이전의 단계로 돌아가는 작업)을 수행하고 
-- 데이터 베이스에 제대로 반영하기 위해서는 commit 을 진행한다.

-- mySQL 기본적으로 자동 커밋 설정이 되어 있다.
-- 따라서 rollback이 안된다. 
-- rollback 을 하기 위해서는 자동 커밋 설정을 off 해줘야 한다.  

-- auto commint 활성화
SET autocommit = 1; -- true
SET autocommit = ON;

-- autocommit 비활성화
SET autocommit = 0;

-- autocommit 을 비활성화할 시 transaction 을 명시적으로 commit 해야 변경한 사항이 데이터베이스에 영구적으로 반영된다. 
-- start transaction 구문을 작성하고 
-- dml (insert, delet, update) 등 작업 수행 후 commit or rollback을 하면 된다. 

START TRANSACTION; 

SELECT * FROM tbl_menu;

INSERT INTO tbl_menu VALUES (null, '바나나해장국', 96000, 4, 'Y'); 
DELETE FROM tbl_menu;

UPDATE tbl_menu
SET
	menu_name = '수정메뉴'
WHERE 
	menu_code = 1;
    
commit;

-- commit을 취소하는 명령어는 x 

ROLLBACK;
