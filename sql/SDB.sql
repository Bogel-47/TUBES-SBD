-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2021-01-09 21:14:19 ICT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE booking (
    booking_id        INTEGER NOT NULL,
    in_guest          DATE,
    out_guest         DATE,
    status            VARCHAR2(20 CHAR),
    numofkids         INTEGER,
    numofadults       INTEGER,
    numofbabies       INTEGER,
    booked_date       DATE,
    customer_cust_id  INTEGER NOT NULL,
    trans_trans_id    INTEGER NOT NULL
);

CREATE UNIQUE INDEX booking__idx ON
    booking (
        trans_trans_id
    ASC );

ALTER TABLE booking ADD CONSTRAINT booking_pk PRIMARY KEY ( booking_id );

CREATE TABLE customer (
    cust_id         INTEGER NOT NULL,
    first_name      VARCHAR2(20 CHAR),
    last_name       VARCHAR2(20 CHAR),
    cust_phone      INTEGER,
    dateofbirth     DATE,
    address         VARCHAR2(50 CHAR),
    cust_email      VARCHAR2(50 CHAR),
    sex             VARCHAR2(10 CHAR),
    cust_education  VARCHAR2(50 CHAR)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_id );

CREATE TABLE discount (
    discount_id         INTEGER NOT NULL,
    type                VARCHAR2(30 CHAR),
    percentage          NUMBER(5, 2),
    booking_booking_id  INTEGER
);

ALTER TABLE discount ADD CONSTRAINT discount_pk PRIMARY KEY ( discount_id );

CREATE TABLE editdsc (
    employee_user_id      INTEGER NOT NULL,
    discount_discount_id  INTEGER NOT NULL
);

ALTER TABLE editdsc ADD CONSTRAINT editdiscount_pk PRIMARY KEY ( employee_user_id,
                                                                 discount_discount_id );

CREATE TABLE editrm (
    employee_user_id  INTEGER NOT NULL,
    room_room_number  INTEGER NOT NULL
);

ALTER TABLE editrm ADD CONSTRAINT editroom_pk PRIMARY KEY ( employee_user_id,
                                                            room_room_number );

CREATE TABLE employee (
    first_name  VARCHAR2(20 CHAR),
    last_name   VARCHAR2(20 CHAR),
    user_id     INTEGER NOT NULL,
    username    VARCHAR2(20 CHAR),
    pass        VARCHAR2(20 CHAR),
    isadmin     CHAR(1),
    ismanager   CHAR(1)
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( user_id );

CREATE TABLE manage (
    employee_user_id            INTEGER NOT NULL,
    transaction_transaction_id  INTEGER NOT NULL
);

ALTER TABLE manage ADD CONSTRAINT managetransaction_pk PRIMARY KEY ( employee_user_id,
                                                                     transaction_transaction_id );

CREATE TABLE recapas (
    transaction_transaction_id  INTEGER NOT NULL,
    report_report_id            INTEGER NOT NULL
);

ALTER TABLE recapas ADD CONSTRAINT transactionrecap_pk PRIMARY KEY ( transaction_transaction_id,
                                                                     report_report_id );

CREATE TABLE report (
    report_id     INTEGER NOT NULL,
    transactions  INTEGER,
    month         INTEGER,
    year          INTEGER,
    income        NUMBER,
    trfailed      INTEGER,
    trsuccess     INTEGER
);

ALTER TABLE report ADD CONSTRAINT report_pk PRIMARY KEY ( report_id );

CREATE TABLE room (
    room_id             INTEGER NOT NULL,
    type                VARCHAR2(20 CHAR),
    status              CHAR(1),
    price               INTEGER,
    description         VARCHAR2(200 CHAR),
    booking_booking_id  INTEGER
);

CREATE UNIQUE INDEX room__idx ON
    room (
        room_id
    ASC,
        booking_booking_id
    ASC );

ALTER TABLE room ADD CONSTRAINT room_pk PRIMARY KEY ( room_id );

CREATE TABLE see (
    employee_user_id  INTEGER NOT NULL,
    report_report_id  INTEGER NOT NULL
);

ALTER TABLE see ADD CONSTRAINT seereport_pk PRIMARY KEY ( employee_user_id,
                                                          report_report_id );

CREATE TABLE trans (
    trans_id            INTEGER NOT NULL,
    total               NUMBER,
    status              VARCHAR2(10 CHAR),
    msgsent             VARCHAR2(100 CHAR),
    deadline            DATE,
    booking_booking_id  INTEGER NOT NULL,
    msgreceived         VARCHAR2(100 CHAR)
);

CREATE UNIQUE INDEX trans__idx ON
    trans (
        booking_booking_id
    ASC );

ALTER TABLE trans ADD CONSTRAINT trans_pk PRIMARY KEY ( trans_id );

ALTER TABLE booking
    ADD CONSTRAINT booking_customer_fk FOREIGN KEY ( customer_cust_id )
        REFERENCES customer ( cust_id );
        
ALTER TABLE booking
ADD room_id INTEGER;

ALTER TABLE booking
    ADD CONSTRAINT booking_trans_fk FOREIGN KEY ( trans_trans_id )
        REFERENCES trans ( trans_id );

ALTER TABLE discount
    ADD CONSTRAINT discount_booking_fk FOREIGN KEY ( booking_booking_id )
        REFERENCES booking ( booking_id );

ALTER TABLE editdsc
    ADD CONSTRAINT editdiscount_discount_fk FOREIGN KEY ( discount_discount_id )
        REFERENCES discount ( discount_id );

ALTER TABLE editdsc
    ADD CONSTRAINT editdiscount_employee_fk FOREIGN KEY ( employee_user_id )
        REFERENCES employee ( user_id );

ALTER TABLE editrm
    ADD CONSTRAINT editroom_employee_fk FOREIGN KEY ( employee_user_id )
        REFERENCES employee ( user_id );

ALTER TABLE editrm
    ADD CONSTRAINT editroom_room_fk FOREIGN KEY ( room_room_number )
        REFERENCES room ( room_id );

ALTER TABLE manage
    ADD CONSTRAINT managetransaction_employee_fk FOREIGN KEY ( employee_user_id )
        REFERENCES employee ( user_id );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE manage
    ADD CONSTRAINT manage_transaction_fk FOREIGN KEY ( transaction_transaction_id )
        REFERENCES trans ( trans_id );

ALTER TABLE room
    ADD CONSTRAINT room_booking_fk FOREIGN KEY ( booking_booking_id )
        REFERENCES booking ( booking_id );

ALTER TABLE see
    ADD CONSTRAINT seereport_employee_fk FOREIGN KEY ( employee_user_id )
        REFERENCES employee ( user_id );

ALTER TABLE see
    ADD CONSTRAINT seereport_report_fk FOREIGN KEY ( report_report_id )
        REFERENCES report ( report_id );

ALTER TABLE trans
    ADD CONSTRAINT trans_booking_fk FOREIGN KEY ( booking_booking_id )
        REFERENCES booking ( booking_id );

ALTER TABLE recapas
    ADD CONSTRAINT transactionrecap_report_fk FOREIGN KEY ( report_report_id )
        REFERENCES report ( report_id );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE recapas
    ADD CONSTRAINT recap_transaction_fk FOREIGN KEY ( transaction_transaction_id )
        REFERENCES trans ( trans_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             3
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0



CREATE OR REPLACE PROCEDURE check_in(
    in_room_id NUMBER 
)
IS
  r_room ROOM%ROWTYPE;
BEGIN
  SELECT *
  INTO r_room
  FROM ROOM
  WHERE room_id = in_room_id;
  
  UPDATE ROOM
  SET STATUS = '0'
  WHERE room_id = in_room_id;
END;

CREATE OR REPLACE PROCEDURE check_out(
    in_room_id NUMBER 
)
IS
  r_room ROOM%ROWTYPE;
BEGIN
  SELECT *
  INTO r_room
  FROM ROOM
  WHERE room_id = in_room_id;
  
  UPDATE ROOM
  SET STATUS = '1'
  WHERE room_id = in_room_id;
END;

CREATE OR REPLACE PACKAGE in_out AS
PROCEDURE CHECK_IN(in_room_id NUMBER);
PROCEDURE CHECK_OUT(in_room_id NUMBER);
END in_out;

CREATE OR REPLACE PACKAGE BODY in_out AS 
PROCEDURE check_in(
    in_room_id NUMBER 
)
IS
  r_room ROOM%ROWTYPE;
BEGIN
  SELECT *
  INTO r_room
  FROM ROOM
  WHERE room_id = in_room_id;
  
  UPDATE ROOM
  SET STATUS = '0'
  WHERE room_id = in_room_id;
END;

PROCEDURE check_out(
    in_room_id NUMBER 
)
IS
  r_room ROOM%ROWTYPE;
BEGIN
  SELECT *
  INTO r_room
  FROM ROOM
  WHERE room_id = in_room_id;
  
  UPDATE ROOM
  SET STATUS = '1'
  WHERE room_id = in_room_id;
END;

END in_out;

INSERT INTO ROOM (ROOM_NO, TYPE, STATUS, PRICE)
VALUES 


CREATE OR REPLACE Function Available
   RETURN integer
   IS
   count_STATUS    NUMBER;
   BEGIN
   SELECT COUNT(room_id) INTO count_STATUS FROM ROOM WHERE STATUS = 1;
   RETURN count_STATUS;
END;

INSERT INTO customer (cust_id,first_name,last_name,dateOfBirth,address, cust_phone,cust_email,sex,cust_education)
VALUES (01,'Udin','Saipudin','6/may/2020','jl.asepsutariat',08123456789,'udinsaipudin@gmail','M','Work');

CREATE OR REPLACE Function jumlah (TYPE VARCHAR)
    RETURN INTEGER
    IS
    masuk DATE;
    keluar DATE;
    harga INT;
    JUMLAH INT;
    hari INT;
BEGIN
    SELECT COUNT (in_guest) into masuk from booking;
    SELECT COUNT (out_guest) into keluar from booking;
    hari =: keluar-masuk;
    SELECT COUNT(PRICE) INTO harga FROM room WHERE TYPE = TYPE;
    JUMLAH := harga*hari; --MENGHITUNG HARGA
    RETURN JUMLAH;
END;
  
INSERT INTO booking (booking_id,in_guest,out_guest,status,numofkids,numofadults,numofbabies,booked_date,customer_cust_id,room_Id,trans_trans_id)
VALUES (01,'6/march/2020','9/march/2020','pending',1,2,0,'5/march/2020',01,01,01);

INSERT INTO customer (cust_id,first_name,last_name,dateOfBirth,address, cust_phone,cust_email,sex,cust_education)
VALUES (01,'Udin','Saipudin','6/may/2020','jl.asepsutariat',08123456789,'udinsaipudin@gmail','M','Work');

INSERT INTO trans 
(trans_id,total,status,msgsent,deadline,booking_booking_id,msgreceived)
VALUES (01,900000,'success','sudah membayar','9/march/2020','01','sudah membayar');

INSERT INTO discount (discount_id,type,percentage,booking_booking_id,booking_id)
VALUES (01,'family',20,01,01);  

INSERT INTO booking (booking_id,in_guest,out_guest,status,numofkids,numofadults,numofbabies,booked_date)
VALUES (01,6/3/2020,9/3/2020,'pending',1,2,0,5/3/2020);
INSERT INTO booking (booking_id,in_guest,out_guest,status,numofkids,numofadults,numofbabies,booked_date,customer_cust_id,room_room_number,trans_trans_id)
VALUES (01,'6/3/2020','9/3/2020','pending',1,2,0,'5/3/2020',01,01,01);

INSERT INTO booking (booking_id,in_guest,out_guest,status,numofkids,numofadults,numofbabies,booked_date,customer_cust_id,ROOM_ID)
VALUES (02,'6/march/2020','9/march/2020','pending',1,2,0,'5/march/2020',01,01);

select OUT_GUEST - IN_GUEST as hari
from booking;

CREATE OR REPLACE PROCEDURE BOOKING_ROOM (booking_id INT,in_guest DATE,out_guest DATE,numofkids INT,numofadults INT,numofbabies INT,customer_cust_id INT,ROOM INT)
IS
new_room_type VARCHAR (30);
hari INT;
harga INT;
JUMLAH INT;
BEGIN

INSERT INTO BOOKING (booking_id,in_guest,out_guest,numofkids,numofadults,numofbabies,customer_cust_id,ROOM_ID) VALUES (booking_id,in_guest,out_guest,numofkids,numofadults,numofbabies,customer_cust_id,ROOM);
  
UPDATE ROOM
SET STATUS = '0'
WHERE ROOM_ID = room;

SELECT TYPE INTO new_room_type FROM ROOM WHERE ROOM_ID = room;
HARI := OUT_GUEST - IN_GUEST ;
SELECT PRICE INTO harga FROM ROOM WHERE ROOM_ID = room;
JUMLAH := harga*hari; --MENGHITUNG HARGA

INSERT INTO TRANS (TRANS_ID, TOTAL, STATUS, BOOKING_BOOKING_ID) VALUES (BOOKING_ID, JUMLAH, new_room_type, BOOKING_ID);
END;

CREATE OR REPLACE PROCEDURE check_out(
    in_room_id NUMBER 
)
IS
  r_room ROOM%ROWTYPE;
BEGIN
  SELECT *
  INTO r_room
  FROM ROOM
  WHERE room_id = in_room_id;
  
  UPDATE ROOM
  SET STATUS = '1'
  WHERE room_id = in_room_id;
END;

CREATE TRIGGER update_available_room 
AFTER INSERT ON BOOKING
FOR EACH ROW
DECLARE
  new_room_id INTEGER;
BEGIN 
  SELECT room_id INTO new_room_id
  FROM Booking
  WHERE room_id = :new.room_id;

  UPDATE ROOM
  SET STATUS = '0'
  WHERE ROOM_ID = new_room_id;
END;

ALTER TABLE BOOKING DROP COLUMN TRANS_TRANS_ID;

insert into ROOM (ROOM_ID, TYPE, STATUS, PRICE, DESCRIPTION)
Values (02, 'king' , '1', 1000000 , 'cocok untuk keluarga dengan 2 anak');

select * from booking;
select * from ROOM;
select * from trans;
DELETE FROM TRANS WHERE TRANS_ID = 3;
DELETE FROM BOOKING WHERE BOOKING_ID = 1;

BEGIN
   CHECK_OUT (2); 
END;

BEGIN
  BOOKING_ROOM (02,'6/03/2020','9/03/2020',1,2,0,01,02);
END;

BEGIN
    PENGHASILAN (04,2020);
END;

CREATE OR REPLACE PROCEDURE PENGHASILAN(
    BULAN NUMBER, TAHUN NUMBER)
IS
TOTAL_NEW INT;
BEGIN
  SELECT SUM(TOTAL)
  INTO TOTAL_NEW
  FROM TRANS;
  
  INSERT INTO REPORT (REPORT_ID,MONTH,YEAR,INCOME) VALUES (SEQ_ID.nextval, BULAN, TAHUN, TOTAL_NEW);
END;

SELECT * FROM REPORT;


DELETE FROM REPORT WHERE REPORT_ID = 2;

SELECT
    SUM( TOTAL )
FROM
    TRANS;
    

CREATE OR REPLACE PROCEDURE SIGN_UP_COSTUMER(FIRST_NAME VARCHAR, LAST_NAME VARCHAR, CUST_PHONE INT, DATEOFBIRTH DATE, ADDRESS VARCHAR, CUST_EMAIL VARCHAR,SEX VARCHAR, CUST_EDUCATION VARCHAR)
IS
BEGIN
  INSERT INTO CUSTOMER (CUST_ID, FIRST_NAME, LAST_NAME, CUST_PHONE, DATEOFBIRTH, ADDRESS, CUST_EMAIL,SEX,CUST_EDUCATION) VALUES (SEQ_ID_CUSOTMER.nextval, FIRST_NAME, LAST_NAME, CUST_PHONE, DATEOFBIRTH, ADDRESS, CUST_EMAIL,SEX,CUST_EDUCATION);
END;

CREATE OR REPLACE PROCEDURE SIGN_UP_EMPLOYEE(FIRST_NAME VARCHAR, LAST_NAME VARCHAR,USERNAME VARCHAR, PASS VARCHAR, ISADMIN VARCHAR, ISMANAGER VARCHAR)
IS
BEGIN
  INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME,USER_ID,USERNAME, PASS, ISADMIN, ISMANAGER) VALUES (FIRST_NAME, LAST_NAME,SEQ_ID_EMPLOYEE.nextval,USERNAME, PASS,ISADMIN,ISMANAGER);
END;

CREATE OR REPLACE PACKAGE SIGN_UP AS
PROCEDURE SIGN_UP_EMPLOYEE(FIRST_NAME VARCHAR, LAST_NAME VARCHAR,USERNAME VARCHAR, PASS VARCHAR, ISADMIN VARCHAR, ISMANAGER VARCHAR);
PROCEDURE SIGN_UP_COSTUMER(FIRST_NAME VARCHAR, LAST_NAME VARCHAR, CUST_PHONE INT, DATEOFBIRTH DATE, ADDRESS VARCHAR, CUST_EMAIL VARCHAR,SEX VARCHAR, CUST_EDUCATION VARCHAR);
END SIGN_UP;

CREATE OR REPLACE PACKAGE BODY SIGN_UP AS 
PROCEDURE SIGN_UP_EMPLOYEE(FIRST_NAME VARCHAR, LAST_NAME VARCHAR,USERNAME VARCHAR, PASS VARCHAR, ISADMIN VARCHAR, ISMANAGER VARCHAR)
IS
BEGIN
  INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME,USER_ID,USERNAME, PASS, ISADMIN, ISMANAGER) VALUES (FIRST_NAME, LAST_NAME,SEQ_ID_EMPLOYEE.nextval,USERNAME, PASS,ISADMIN,ISMANAGER);
END;
PROCEDURE SIGN_UP_COSTUMER(FIRST_NAME VARCHAR, LAST_NAME VARCHAR, CUST_PHONE INT, DATEOFBIRTH DATE, ADDRESS VARCHAR, CUST_EMAIL VARCHAR,SEX VARCHAR, CUST_EDUCATION VARCHAR)
IS
BEGIN
  INSERT INTO CUSTOMER (CUST_ID, FIRST_NAME, LAST_NAME, CUST_PHONE, DATEOFBIRTH, ADDRESS, CUST_EMAIL,SEX,CUST_EDUCATION) VALUES (SEQ_ID_CUSOTMER.nextval, FIRST_NAME, LAST_NAME, CUST_PHONE, DATEOFBIRTH, ADDRESS, CUST_EMAIL,SEX,CUST_EDUCATION);
END;
END SIGN_UP;

CREATE or REPLACE VIEW PEMESANAN_ROOM AS
    SELECT booking.booking_id, booking.in_guest,booking.out_guest,booking.booked_date,customer.cust_id,customer.first_name,customer.cust_phone
FROM booking
INNER JOIN customer
ON booking.booking_id = customer.cust_id
where booking.booking_id = customer.cust_id;

CREATE SEQUENCE SEQ_ID
    MINVALUE 1
    MAXVALUE 99999999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE SEQ_ID_CUSOTMER
    MINVALUE 1
    MAXVALUE 99999999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE SEQUENCE SEQ_ID_EMPLOYEE
    MINVALUE 1
    MAXVALUE 99999999999
    START WITH 1
    INCREMENT BY 1
    NOCACHE;


select * from BOOKING

DELETE FROM CUSTOMER WHERE CUST_ID = 4;

BEGIN
 SIGN_UP_COSTUMER ('Hargi', 'Muttaqin', 08960359011, '19/11/2000', 'RT04/17' , 'hargi@gmail.coM' ,'Male','University');
 end;
 
 select * from CUSTOMER where first_name = 'Hargi'