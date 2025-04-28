SET SERVEROUTPUT ON;

DECLARE
    v_tablename VARCHAR2(20);
    total_rows NUMBER;

BEGIN
    SELECT COUNT(*) 
    INTO total_rows
    FROM &v_tablename;

    IF SQL%FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('THIS TABLE CONTAINS '||total_rows||' NUMBER OF RECORDS.'); 
    ELSE 
        DBMS_OUTPUT.PUT_LINE('NO RECORD FOUND.');
    END IF;
END;
/