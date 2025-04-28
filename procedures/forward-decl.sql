SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE GET_EMP(
    first_name OUT VARCHAR2,
    last_name OUT VARCHAR2,
    department_name OUT VARCHAR2,
    job_title OUT VARCHAR2,
    p_job_title IN VARCHAR2
) AS 
BEGIN
    SELECT e.first_name,e.last_name,d.department_name,j.job_title
    INTO first_name,last_name,department_name,job_title 
    from employees e 
    JOIN DEPARTMENTS d 
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID 
    join jobs j 
    on e.job_id = j.job_id 
    WHERE j.job_title = p_job_title;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
        RETURN;
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('AN ERROR OCCUREED '|| SQLERRM);
END GET_EMP;
/

DECLARE
    v_firstname employees.first_name%type;
    v_lastname employees.last_name%type;
    v_dept_name departments.department_name%type;
    v_job_title job.job_title%type;
    v_inp_job_title VARCHAR2(40) := '&v_inp_job_title';



BEGIN
    GET_EMP(
        v_firstname,
        v_lastname,
        v_dept_name,
        v_job_title, 
        v_inp_job_title
    );

    IF v_firstname IS NOT NULL THEN   
        DBMS_OUTPUT.PUT_LINE('HEY, MY NAME IS '|| v_firstname || ', IM WORKING AS '|| v_job_title || ' IN THE '|| v_dept_name || ' DEPARTMENT.');
    END IF;
END;
/