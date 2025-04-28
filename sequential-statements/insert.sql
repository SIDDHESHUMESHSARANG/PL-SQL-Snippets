SET SERVEROUTPUT ON;

DECLARE
    v_tablename VARCHAR2(20) := '&v_tablename';
    v_rec_id NUMBER(5) := &v_rec_id;
    v_rec_first_name VARCHAR2(20) := '&v_rec_first_name';
    v_rec_last_name VARCHAR2(20) := '&v_rec_last_name';
    v_rec_designation VARCHAR2(50) := '&v_rec_designation';
    n_salary NUMBER(8,2) := &n_salary;
    v_insert VARCHAR2(500);

BEGIN
    v_insert := 'INSERT INTO '||v_tablename||'(ID,FIRSTNAME,LASTNAME,DESIGNATION,SALARY)
    VALUES(:1,:2,:3,:4,:5)';
    EXECUTE IMMEDIATE v_insert using v_rec_id,v_rec_first_name,v_rec_last_name,v_rec_designation,n_salary;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('1 Row Inserted!!');
END;
/


