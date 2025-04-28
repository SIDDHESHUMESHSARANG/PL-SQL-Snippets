SET SERVEROUTPUT ON;

DECLARE
    v_tablename VARCHAR2(20) := '&v_tablename';
    v_query VARCHAR2(50);
    n_count NUMBER;

BEGIN
    v_query := 'SELECT COUNT(*) FROM '||v_tablename;
    EXECUTE IMMEDIATE v_query INTO n_count;
    EXECUTE IMMEDIATE v_query;
    DBMS_OUTPUT.PUT_LINE('Total rows in the '|| v_tablename ||' are: '||n_count);
END;
/