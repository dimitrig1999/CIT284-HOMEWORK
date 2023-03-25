DECLARE

    TYPE type_customer IS RECORD(
        fName   mm_member.first%TYPE,
        lName   mm_member.last%TYPE,
        memID   mm_member.member_id%TYPE,
        rentals NUMBER(15)
    );
    
    rec_customer type_customer;
    memberID NUMBER(2);

BEGIN

    -- ask user for member id
    memberID := '&Member_ID';
    
    --perform select statement
    SELECT  first, last, member_id, COUNT(rental_id) 
    INTO    rec_customer
    FROM    mm_member INNER JOIN mm_rental USING(member_id)
    WHERE   member_id = memberID
    GROUP BY first, last, member_id;
    
    --print out results
    DBMS_OUTPUT.PUT_LINE('ID: ' || rec_customer.memID);
    DBMS_OUTPUT.PUT_LINE('FIRST: ' || rec_customer.fName);
    DBMS_OUTPUT.PUT_LINE('LAST: ' || rec_customer.lName);
    DBMS_OUTPUT.PUT_LINE('RENTALS: ' || rec_customer.rentals);

END;