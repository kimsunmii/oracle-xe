/*
파일명 : HR-Day07-PL.sql

PL/SQL(Procedural Language extension to SQL)
    SQL을 확장한 절차적 언어입니다.
    여러 SQL을 하나의 블록(Block)으로 구성하여 SQL을 제어할 수 있습니다.
*/

/*
익명프로시저 - DB에 저장되지 않습니다.
[기본구조]
    DECLARE -- 변수정의
    BEGIN -- 처리 로직 시작
    EXCEPTION -- 예외 처리
    END -- 처리 로직 종료
*/

-- 실행 결과를 출력하도록 설정
SET SERVEROUTPUT ON

-- 스크립트 경과 시간을 출력하도록 설정
SET TIMING ON

DECLARE -- 변수를 정의 한는 영역
    V_STRD_DT VARCHAR2(8);
    V_STRD_DEPTNO NUMBER;
    
    V_DEPTNO NUMBER;
    V_DNAME VARCHAR2(50);
    V_LOC VARCHAR2(50);
    
    V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN  -- 작업 영역
    -- 기준일자 -> 내장함수 사용.
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    
    -- 조회 부서번호 변수 설정
    V_STRD_DEPTNO := 10;
    BEGIN
        -- 조회
        SELECT T1.department_id
            , T1.department_name
            , T1.location_id
        INTO V_DEPTNO
            ,V_DNAME
            ,V_LOC
        FROM departments T1
        WHERE T1.department_id = V_STRD_DEPTNO;
    END;
    
    --조회 결과 변수 설정 RESULT > DEPTNO=10, DNAME=Administration, LOC=1700
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    
    -- 조회 결과 출력 -> DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );

-- 예외처리
EXCEPTION
    WHEN OTHERS THEN
       V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
       DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );

END; -- 작업종료
/


/*
프로시저
[기본구조]
CREATE OR REPLACE PROCEDURE 프로시져 이름 (파라미터1, 파라미터2...);
    IS [As]
    선언부
    BEGIN
    [실행부 - PL/SQL BLOCK]
    
    [EXCEPTION]
    
    [EXCEPTION 처리]
    END;
*/
--프로시저 :이름, 매개변수, 변환값(x)
CREATE OR REPLACE PROCEDURE print_hello_proc --매개변수가 없으면() 생략
IS
msg VARCHAR2(20) := 'hello world'; --변수 초기값 선언
BEGIN --문장의 시작
    DBMS OUTPUT.PUT_LINE(msg);
    END ; --문장의 끝
    -- 프로시저 종료
    EXEC print_hello_proc;
    
    --IN 매개변수
    CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER) IS
        BEGIN
        UPDATE emp SET salary = salary*1.1
        WHERE employee_id = eno;
        COMMIT;
        END;
        
    --3100
    --3400
    SELECT*FROM emp2
    WHERE employee_id = 115;
    
    EXEC update_emp2_salary_proc(115);
    
    --out 매개변수
CREATE OR REPLACE PROCEDURE find_emp2_proc(v eno IN NUMBER,
    v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER
    IS
    BEGIN
        SELECT first_name, last_name, salary
        INTO v_fname, v_lname, v_sal
        FROM emp2 WHERE employee_id = v_eno;
    END;
    
    VARIABLE v_fname NVARCHAR2(25);
    VARIABLE v_lname NVARCHAR2(25);
    VARIABLE v_sal NUMBER(8,2);
    
    EXECUTE find_emp2_proc(115, :v_fname, :v_lname, :v_sal);
    PRINT v_fname;
    