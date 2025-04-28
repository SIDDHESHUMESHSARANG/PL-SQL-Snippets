SET SERVEROUTPUT ON;

DECLARE
    v_myname VARCHAR2(20) := '&v_myname';
    v_class VARCHAR2(20) := '&v_class';
    v_sem VARCHAR2(20) := '&v_sem';
    v_batch VARCHAR2(20) := '&v_batch';
    n_rollno NUMBER := &n_rollno;
    v_course VARCHAR2(20) := '&v_course';

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hi, my name is '|| v_myname || '.' || ' I am studying in Class '|| v_class || ', ' || v_sem || CHR(10) || 'My practical batch is '|| v_batch || ' and Roll No: '|| n_rollno || '.' || CHR(10) || 'This is exceuted in '|| v_course || ' practical dated on ' || SYSDATE || '.');
END;
/
