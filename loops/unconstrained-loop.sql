SET SERVEROUTPUT ON;

-- Q1
DECLARE
    v_tablename VARCHAR2(20) := '&v_tablename';
    n_id NUMBER(5) := &n_id;
    v_id NUMBER(5);
    v_first_name VARCHAR2(20);
    v_last_name VARCHAR2(20);
    v_designation VARCHAR2(50);
    v_sql VARCHAR2(500);

BEGIN
    LOOP
        v_sql := 'SELECT ID,FIRSTNAME,LASTNAME,DESIGNATION FROM '||v_tablename||' WHERE ID = :1';
        EXECUTE IMMEDIATE v_sql INTO v_id,v_first_name,v_last_name,v_designation USING n_id;

        DBMS_OUTPUT.PUT_LINE(v_id ||' : '||v_first_name||' '||v_last_name|| ' - ' ||v_designation);
        EXIT;
    END LOOP;
END;
/


-- Q2
DECLARE
    v_tablename VARCHAR2(20) := '&v_tablename';
    v_first_name VARCHAR2(20);
    n_sal NUMBER;
    n_counter NUMBER(5) := 1001;
    v_query VARCHAR2(500);

BEGIN   
    LOOP
        v_query := 'SELECT FIRSTNAME,SALARY FROM '||v_tablename||' WHERE SALARY = :1';
        EXECUTE IMMEDIATE v_query INTO v_first_name,n_sal USING n_counter;

        DBMS_OUTPUT.PUT_LINE('LECTURER NAME : '||v_first_name||' '||'Salary : '||n_sal);
        n_counter := n_counter + 1;
        EXIT WHEN n_counter = 1001;
    END LOOP;
END;
/

            

