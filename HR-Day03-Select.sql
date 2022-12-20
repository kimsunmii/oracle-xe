/*
파일명 :HR-Day03-Select.sql
SQL (Structured Query Language -구조적 질의 언어
    관계형 데이터베이스 시스템(RDBMS)에서 자료를 관리 및 처리하기 위해 설계된 언어
    SELECT 문
    데이터베이스에서 정보 검색
*/

-- 모든열 선택*
SELECT *
FROM departments;


--특정 열 선액
SELECT departmernt_id, lacation_id
FROM departmernts;

/* 산술 연산자를 사용해서 숫자 /날짜 데이터 표현식 작성

+ 더하기
- 빼기
* 곱하기
/ 나누기 
*/



-- 산술 연산자 사용
SELECT LAST_NAME, SALARY, SALARY + 300
FROM employees;


/* 
연산자 우선순위
곱하기와 나누기는 더하기 빼기보다는 먼저 수행
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*salary+100
FROM employees;

/* 
산술식의 Nullrjqt
null 값을 포함하는 산술식은 null로 계산
*/

SELECT last_name, 12*salary*comission_pct, salary, commission_pct
FROM employees;


/*
열 alias 정의
    열 머리글의 이름을 바꿉니다.
    계산에서 유용합니다.
    열 이름 바로 뒤에 나옵니다. ( 열 이름과 alias 사이에 선택 사항인 As 키워드가 올수도 있습니다.)
    공백이나 특수 문자를 포함하거나 대소문자를 구분하는 경우 큰 따음표가 필요합니다.
    
    */
    SELECT last_name As name, comission_pct comn, salary *10as 급여 10배
    FROM employees;
    
    SELECT last_name "Name", salary*qw "Annual salary"
    FROM employees;
    
    /*
    연결 연산자
        열이나 문자열을 다른 열에 연결합니다.
        두개의 세로선 (||) 으로 나타냅니다.
        결과 열로 문자 표현식을 작성합니다.
    */
    
    SELECT last_name||job AS "Employees" ,last_name, job_id 
    FROM employees;
    
    
    /*
    리터럴 문자열
    리터럴은 SELECT 문에 포함된 문자, 숫자 또는 날짜입니다. 
    날짜 및 문자 리피럴 같은 작은 따음표로 묶어야합니다.
    각 문자열은 반환되는 각 형에 한번 출력되비니다.
    */
    
    SELECT last_name || 'is a' || job_id AS "Employee Details"
    FROM employees;
    
    
    /*
    대체 인음(q) 연산자
    자신의 따음표 구분자를 지정합니다.
    구분자를 임의로 선택합니다.
    가독성 및 사용성이 증가합니다.
    
    
    */
    
    SELECT department_name || q'[Department's Manager Id : J] ' || manager_id
    AS "Department and Manager"
    FROM departments;
    
    