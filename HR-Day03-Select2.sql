/*

������ ����Ͽ� �� ����
WHERE ���� ����Ͽ� ��ȯ�Ǵ� ���� �����մϴ�.

WHERE 
    ������ �����ϴ� ������ query�� �����մϴ�.
    
    ������ ���
    - ���̸�
    - �� ����
    - �� �̸�, ��� �Ǵ� �� ����Ʈ
    
*/

---WHERE �� ���

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id =90;

/*
���ڿ� �� ��¥
    ���ڿ� �� ��¥ ���� ���� ����ǥ�� �����ϴ�.
    ���� ���� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ �����մϴ�.
    �⺻ ��¥ ǥ�� ������ DD-MON-RR �Դϴ�.
*/

SELECT last_name, job_id, department _id
FROM employees;
WHERE last_name = 'Whalen'

SELECT last_name, hire_data
FROM employees;
WHERE 1=1
AND hire_data = '03/06/17'
;


/* 

�� ������
    Ư�� ǥ������ �ٸ� ���̳� ǥ���İ� ���ϴ� ���ǿ��� ����մϴ�.
    
    = ���v��
    > ���� ŭ
    >= ���� ũ�ų� ����
    < ���� ����
    <= ���� �۰ų� ����
    <> ���� ����
    BETWEEN... AND ... �� �� ����(��谪 ����)
    IN (set)           �� �� ��Ʈ �� ��ġ�ϴ� �� �˻�
    LIKE               ��ġ�ϴ� ���� ���� �˻�
    IS NULL             NULL������ ����
    */
    
    
    --- �� ������ ���
    SELECT last_name , salary
    FROM employees
    WHERE salary <= 3000;
    
    --BETWEEN �����ڸ� ����ϴ� ���� ����
       SELECT last_name , salary
    FROM employees
    WHERE salary BETWEEN 2500 AND 3500;
    
    --IN �����ڸ� ����ϴ� ��� ����
    
    SELECT employee_id, last_name, salary, manmanger_id
    FROM employees
    WHERE manger_id IN(100,101,201);
    
    
/*
LIKE �����ڸ� ����Ͽ� ���� ��ġ
LIKE  �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� ��ü ���� �˻��� �����մϴ�.
�˻� ���ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� �ֽ��ϴ�.
- % �� 0�� �̻��� ���ڸ� ��Ÿ���ϴ�.
- _ �� �� ���ڸ� ��Ÿ���ϴ�.
*/

SELECT first_name
FROM employees
WHERE first_name LIKE '%a%';

-- ��ü ���� ����

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%'

-- ESCAPE �ĺ���
SELECT employee_id , last_nam, job_id
FROM employees
WHERE job_id LIKE '%SA_%'ESCAPE '|';

/*
NULL ���� ���
IS NULL �����ڷ� null �� �׽�Ʈ �մϴ�.

*/

SELECT last_name, manger_id
FROM employees
WHERE manager_id IS NULL;

/*
�� �����ڸ� ����Ͽ� ���ǹ����� 
AND : ���� ��� ������ ��� ���� ��� TRUE ��ȯ
OR : ���� ��� ���� �� �ϳ��� ���� ��� TRUE ��ȯ
NOT : ������ ������ ��� TRUE�� ��ȯ�մϴ�.
*/

-- AND ������ ���
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > = 10000
AND job_id LIKE '%MAN%'

-- OR ������ ���

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > = 10000
AND job_id LIKE '%MAN%'

--Not ������ ���
SELECT last_name, job_id
WHERE job_id NOT IN ('IT_PROG' , 'ST_CLERK', 'SA_REP');

/*
ORDER BY ��
ORDER BY ���� ����Ͽ� �˻��� ���� �����մϴ�
-ASC : �������� �⺻ ��
- DESC : �������� �⺻ ��
*/

SELECT last_name, job_id , department_id, hire_date
FROM employees
ORDER BY hire_data;


--�������� ����
SELECT last_name, job_id , department_id, hire_date
FROM employees
ORDER BY hire_data DESC;

--�� alias�� �������� ����
SELECT employee_id , job_id , salary*12 annsal
FROM employees
ORDER BY annsal
;

--�� ���� ��ġ�� ����Ͽ� ����
SELECT employee_id , job_id , department_id, hire_data
FROM employees
ORDER BY 3;

-- ���� ���� �������� ����

SELECT employee_id , job_id , department_id, salary 
FROM employees
ORDER BY department_id, salary DESC;


