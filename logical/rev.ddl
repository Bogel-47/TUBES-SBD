-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2021-01-09 16:03:32 ICT
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
    employee_user_id      VARCHAR2(20 BYTE) NOT NULL,
    discount_discount_id  INTEGER NOT NULL
);

ALTER TABLE editdsc ADD CONSTRAINT editdiscount_pk PRIMARY KEY ( employee_user_id,
                                                                 discount_discount_id );

CREATE TABLE editrm (
    employee_user_id  VARCHAR2(20 BYTE) NOT NULL,
    room_room_number  INTEGER NOT NULL
);

ALTER TABLE editrm ADD CONSTRAINT editroom_pk PRIMARY KEY ( employee_user_id,
                                                            room_room_number );

CREATE TABLE employee (
    first_name  INTEGER,
    last_name   VARCHAR2(20 CHAR),
    user_id     VARCHAR2(20 CHAR) NOT NULL,
    username    VARCHAR2(20 CHAR),
    pass        VARCHAR2(20 CHAR),
    isadmin     CHAR(1),
    ismanager   CHAR(1)
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( user_id );

CREATE TABLE manage (
    employee_user_id            VARCHAR2(20 BYTE) NOT NULL,
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
    employee_user_id  VARCHAR2(20 BYTE) NOT NULL,
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
    ADD CONSTRAINT managetransaction_transaction_fk FOREIGN KEY ( transaction_transaction_id )
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
    ADD CONSTRAINT transactionrecap_transaction_fk FOREIGN KEY ( transaction_transaction_id )
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
