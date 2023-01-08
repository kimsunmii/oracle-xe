/*
파일명 : HR-Day09-DataDictionary.sql

데이터 딕셔너리
    오라클 데이터 딕셔너리는 데이터베이스에 대한 메타 데이터이며
    모든 객체의 이름과 속성을 포함합니다.
*/

SELECT * FROM dictionary;

/*
DBA_ : DBA 권한 QUERY 가능/ 모든항목 / DBA전용
ALL_ : 모두 QEURY 가능 / 유저의 고유 객체와 유저에게 보기 권한이 부여된 기타 객체
USER_ : 유저가 소유하는 모든항목 / 누락된 OWNER 열은 제외하고 일반적으로 ALL_ 과 같음.
*/

SELECT table_name, tablespace_name 
FROM all_tables;

SELECT *
FROM all_tables;

--스키마에 생성된 해당 테이블
SELECT table_name, tablespace_name
FROM user_tables;

-- 시퀀스 정보
SELECT sequence_name, min_value, max_value,
        increment_by
FROM all_sequences;

-- 인덱스 정보를 볼 수 있는 뷰
DESC dba_indexes;

-- 로그인 할 수 있는 유저 
SELECT username, account_status
FROM dba_users
WHERE account_status = 'OPEN'
;



/*
성능뷰(Dynamic Performance View)
    오라클 instance의 작업 및 성능에 대한 모니터링, 감사 등을 위한 뷰입니다.

v$instance
해당 인스턴스 정부 출력(sid, 인스턴스 동장 상태 등)
v$session
   연결된 세션 정보 출력
v$sysstat
  자원사원 정보 출력
v$process
   프로세스 정보 출력
v$lock
  락 요청, 응답 정보를 보여준다.
v$event_name
   대기중인 이벤트들의 정보를 보여준다.
v$open_cursor
   연결된 세션의 커서를 보여준다.
v$system_parameter
    오라클 피라미터 정보들을 보여준다. 시간 형식 버퍼풀등의 정보를 볼 수 있다.
v$parameter
    같은 오라클 피라미터 정보를 보여주지만 조금더 간소하게 보여준다.
v$option
    오라클 추가기능 및 기타 옵션과 버전을 보여준다.
*/

-- CPU 시간이 200,000 마이크로초 이상 소비되는 SQL문
SELECT sql_text, executions 
FROM v$sql
WHERE cpu_time > 20000;

-- 전날 컴퓨터에서 로그인한 현재세션은 어느것입니까?
SELECT * FROM v$session
WHERE 1=1
AND machine = 'DESKTOP-Q2FMHK6'
AND logon_time > SYSDATE - 1;

-- 현재 다른유저를 차단중인 Lock을 보유하고 있는 세션의 세션ID 무엇이며
-- Lock 상태가 얼마동안 유지되고 있습니까? (화요일)
SELECT 
    a.sid,             -- SID
    b.serial#,         -- 시리얼 
    a.ctime            -- 세션허가된 이후부터 경과시관
FROM v$lock a,
    v$session b
WHERE 1=1
AND a.sid = b.sid
AND block > 0;

desc v$session;
select * FROM v$session;
    

-- 악성 쿼리 조회
SELECT 
    a.sid,          -- SID
    a.serial#,      -- 시리얼 번호
    a.process,      -- 프로세스 정보
    a.username,     -- 유저
    a.osuser,       -- 접속자의 os 사용자 정보
    b.sql_text,     -- sql
    c.program       -- 접속 프로그램
FROM 
    v$session a,
    v$sqlarea b,
    v$process c
WHERE 1=1
    AND a.sql_hash_value = b.hash_value
    AND a.sql_address = b.address
    AND a.paddr = c.addr
    AND a.status = 'ACTIVE';
    
-- 유저 세션 KILL
ALTER SYSTEM KILL SESSION 'SID, 시리얼번호';

ALTER SYSTEM KILL SESSION '259, 60160';
