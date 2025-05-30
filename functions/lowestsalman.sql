SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION GET_EMP_NAME
RETURN VARCHAR2 
IS
    v_emp_name VARCHAR2(100);
BEGIN
    SELECT first_name ||' '||last_name
    INTO v_emp_name FROM EMPLOYEES
    WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES)
    AND EMPLOYEE_ID IN(SELECT DISTINCT MANAGER_ID FROM EMPLOYEES);
    RETURN v_emp_name;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(GET_EMP_NAME());
END;
/