SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION GET_EMP_HIERARCHY(EMP_ID IN NUMBER,v_hierarchy IN OUT VARCHAR2,v_level IN OUT NUMBER) 
RETURN VARCHAR2 IS
    v_managerid NUMBER;
    v_emp_name VARCHAR(50);

    BEGIN
        SELECT MANAGER_ID,FIRST_NAME||' '||LAST_NAME INTO v_managerid,v_emp_name FROM EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;
        v_hierarchy := v_emp_name||'('||emp_id||')'||' Level : '||v_level||' '||v_hierarchy;
        v_level := v_level + 1;

        IF v_managerid IS NOT NULL THEN
            RETURN GET_EMP_HIERARCHY(v_managerid,v_hierarchy,v_level);
        ELSE
            RETURN v_hierarchy;
        END IF;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RETURN 'NO DATA FOUND';
        WHEN OTHERS THEN
            RETURN 'UNKNOWN ERROR';
    END GET_EMP_HIERARCHY;
    /

DECLARE
    v_hierarchy VARCHAR2(4000) := '';
    v_level NUMBER := 0;

BEGIN  
    v_hierarchy := GET_EMP_HIERARCHY(&EMP_ID,v_hierarchy,v_level);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE HIERARCHY : '||v_hierarchy);
END;
/
