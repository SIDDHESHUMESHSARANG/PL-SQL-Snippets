SET SERVEROUTPUT ON;

DECLARE 
    customer_name VARCHAR2(20) := '&customer_name';
    tot_amount NUMBER(6) := &tot_amount;
    customer_name2 VARCHAR2(20) := '&customer_name2';
    tot_amount2 NUMBER(6) := &tot_amount2;

BEGIN
    INSERT INTO ORDERS_77(ID,CUST_NAME,ORDER_DATE,TOTAL_AMOUNT)
    VALUES(
        ORDER_SEQ.NEXTVAL,
        customer_name,
        SYSDATE,
        tot_amount
    );

    COMMIT;

    INSERT INTO ORDERS_77(ID,CUST_NAME,ORDER_DATE,TOTAL_AMOUNT)
    VALUES(
        ORDER_SEQ.NEXTVAL,
        customer_name2,
        SYSDATE,
        tot_amount2
    );

    COMMIT;


    DBMS_OUTPUT.PUT_LINE('CURRENT ORDER SEQUENCE '|| ORDER_SEQ.CURRVAL);

END;
/

    SELECT * FROM ORDERS_77;