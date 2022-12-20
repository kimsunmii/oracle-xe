/*
���ϸ� :HR-Day03-Select.sql
SQL (Structured Query Language -������ ���� ���
    ������ �����ͺ��̽� �ý���(RDBMS)���� �ڷḦ ���� �� ó���ϱ� ���� ����� ���
    SELECT ��
    �����ͺ��̽����� ���� �˻�
*/

-- ��翭 ����*
SELECT *
FROM departments;


--Ư�� �� ����
SELECT departmernt_id, lacation_id
FROM departmernts;

/* ��� �����ڸ� ����ؼ� ���� /��¥ ������ ǥ���� �ۼ�

+ ���ϱ�
- ����
* ���ϱ�
/ ������ 
*/



-- ��� ������ ���
SELECT LAST_NAME, SALARY, SALARY + 300
FROM employees;


/* 
������ �켱����
���ϱ�� ������� ���ϱ� ���⺸�ٴ� ���� ����
*/

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*salary+100
FROM employees;

/* 
������� Nullrjqt
null ���� �����ϴ� ������� null�� ���
*/

SELECT last_name, 12*salary*comission_pct, salary, commission_pct
FROM employees;


/*
�� alias ����
    �� �Ӹ����� �̸��� �ٲߴϴ�.
    ��꿡�� �����մϴ�.
    �� �̸� �ٷ� �ڿ� ���ɴϴ�. ( �� �̸��� alias ���̿� ���� ������ As Ű���尡 �ü��� �ֽ��ϴ�.)
    �����̳� Ư�� ���ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� ū ����ǥ�� �ʿ��մϴ�.
    
    */
    SELECT last_name As name, comission_pct comn, salary *10as �޿� 10��
    FROM employees;
    
    SELECT last_name "Name", salary*qw "Annual salary"
    FROM employees;
    
    /*
    ���� ������
        ���̳� ���ڿ��� �ٸ� ���� �����մϴ�.
        �ΰ��� ���μ� (||) ���� ��Ÿ���ϴ�.
        ��� ���� ���� ǥ������ �ۼ��մϴ�.
    */
    
    SELECT last_name||job AS "Employees" ,last_name, job_id 
    FROM employees;
    
    
    /*
    ���ͷ� ���ڿ�
    ���ͷ��� SELECT ���� ���Ե� ����, ���� �Ǵ� ��¥�Դϴ�. 
    ��¥ �� ���� ���Ƿ� ���� ���� ����ǥ�� ������մϴ�.
    �� ���ڿ��� ��ȯ�Ǵ� �� ���� �ѹ� ��µǺ�ϴ�.
    */
    
    SELECT last_name || 'is a' || job_id AS "Employee Details"
    FROM employees;
    
    
    /*
    ��ü ����(q) ������
    �ڽ��� ����ǥ �����ڸ� �����մϴ�.
    �����ڸ� ���Ƿ� �����մϴ�.
    ������ �� ��뼺�� �����մϴ�.
    
    
    */
    
    SELECT department_name || q'[Department's Manager Id : J] ' || manager_id
    AS "Department and Manager"
    FROM departments;
    
    