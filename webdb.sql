--테이블 작성
CREATE TABLE guestbook(
    no NUMBER(5),
    name VARCHAR2(80),
    password VARCHAR2(20),
    content VARCHAR2(2000),
    reg_date date,
    PRIMARY KEY(no)
);
--시퀀스 작성
CREATE SEQUENCE seq_guest_id
INCREMENT BY 1 
START WITH 1 ;

--시퀀스 삭제
DROP SEQUENCE seq_guest_id;
--테이블 삭제
DELETE FROM guestbook;

--SELECT
SELECT
    *
FROM guestbook;
--삭제
DELETE FROM guestbook WHERE no = 1;

--생성
INSERT INTO guestbook VALUES (seq_guest_id.nextval,'성동일','1234','안녕하세요 성동일 입니다.',SYSDATE);

--리스트 만들기
SELECT  no,
        name,
        reg_date,
        content
FROM guestbook;












































