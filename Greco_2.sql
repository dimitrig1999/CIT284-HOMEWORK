DECLARE

    TYPE       type_customer IS RECORD(
    fname      bb_shopper.FIRSTNAME%TYPE,
    lname      bb_shopper.LASTNAME%TYPE,
    member_ID  bb_shopper.IDShopper%TYPE,
    ordersPlaced NUMBER(3)
    );
    rec_customer type_customer;
    customer_id NUMBER(2);

BEGIN

    customer_id := '&customer_AYE_DEE';

    SELECT FIRSTNAME, LASTNAME, IDShopper, SUM(orderPlaced)
    INTO rec_customer
    FROM bb_shopper INNER JOIN bb_basket USING(IDShopper)
    WHERE IDShopper = customer_id
    GROUP BY FIRSTNAME, LASTNAME, IDShopper;

     DBMS_OUTPUT.PUT_LINE('FIRST ' ||  rec_customer.fname);
    DBMS_OUTPUT.PUT_LINE('LAST ' ||  rec_customer.lname);
    DBMS_OUTPUT.PUT_LINE('ID ' ||  rec_customer.member_ID);
    IF rec_customer.ordersPlaced <> 0 THEN
    DBMS_OUTPUT.PUT_LINE('ORDERS PLACED ' ||  rec_customer.ordersPlaced);
    END IF;

END;