SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE TODAY_IS AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('TODAY IS '||TO_CHAR(SYSDATE,'DL'));
END TODAY_IS;
/

BEGIN
    TODAY_IS();
END;
/