SET SERVEROUTPUT ON;

DECLARE
    v_tablename VARCHAR2(20) := '&v_tablename';
    v_query VARCHAR2(200);

BEGIN
    v_query := 'CREATE TABLE '|| v_tablename ||'(ID NUMBER NOT NULL,FIRSTNAME VARCHAR2(20),LASTNAME VARCHAR2(20),DESIGNATION VARCHAR2(20),SALARY NUMBER(8,2))';

    EXECUTE IMMEDIATE v_query;

    DBMS_OUTPUT.PUT_LINE('Table '|| v_tablename || ' Created Successfully');
END;
/