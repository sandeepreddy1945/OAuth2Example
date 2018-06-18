CREATE SEQUENCE HIBERNATE_SEQUENCE START WITH 100 INCREMENT BY 1;

CREATE TABLE ADDRESS (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  HOUSE_NUMBER VARCHAR(255),
  STREET VARCHAR(255),
  ZIP_CODE VARCHAR(255),
  PRIMARY KEY (ID)
);

CREATE TABLE COMPANY (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  NAME VARCHAR(255),
  PRIMARY KEY (ID),
  UNIQUE KEY COMPANY_NAME (NAME)
);

CREATE TABLE CAR (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  REGISTRATION_NUMBER VARCHAR(255),
  COMPANY_ID BIGINT,
  PRIMARY KEY (ID)
);

ALTER TABLE CAR ADD CONSTRAINT CAR_COMPANY FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY;

CREATE TABLE DEPARTMENT (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  NAME VARCHAR(255),
  COMPANY_ID BIGINT,
  PRIMARY KEY (ID)
);

ALTER TABLE DEPARTMENT ADD CONSTRAINT DEPARTMENT_COMPANY FOREIGN KEY (COMPANY_ID) REFERENCES COMPANY;

CREATE TABLE EMPLOYEE (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  NAME VARCHAR(255),
  SURNAME VARCHAR(255),
  ADDRESS_ID BIGINT,
  DEPARTMENT_ID BIGINT,
  PRIMARY KEY (ID)
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_ADDRESS FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS;
ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_DEPARTMENT FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT;

CREATE TABLE OFFICE (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  NAME VARCHAR(255),
  ADDRESS_ID BIGINT,
  DEPARTMENT_ID BIGINT,
  PRIMARY KEY (ID)
);

ALTER TABLE OFFICE ADD CONSTRAINT OFFICE_ADDRESS FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS;

CREATE TABLE OAUTH_CLIENT_DETAILS (
  CLIENT_ID VARCHAR(255) PRIMARY KEY,
  RESOURCE_IDS VARCHAR(255),
  CLIENT_SECRET VARCHAR(255),
  SCOPE VARCHAR(255),
  AUTHORIZED_GRANT_TYPES VARCHAR(255),
  WEB_SERVER_REDIRECT_URI VARCHAR(255),
  AUTHORITIES VARCHAR(255),
  ACCESS_TOKEN_VALIDITY INTEGER,
  REFRESH_TOKEN_VALIDITY INTEGER,
  ADDITIONAL_INFORMATION VARCHAR(4096),
  AUTOAPPROVE VARCHAR(255)
);

CREATE TABLE OAUTH_CLIENT_TOKEN (
  TOKEN_ID VARCHAR(255),
  TOKEN VARBINARY,
  AUTHENTICATION_ID VARCHAR(255) PRIMARY KEY,
  USER_NAME VARCHAR(255),
  CLIENT_ID VARCHAR(255)
);

CREATE TABLE OAUTH_ACCESS_TOKEN (
  TOKEN_ID VARCHAR(255),
  TOKEN VARBINARY,
  AUTHENTICATION_ID VARCHAR(255) PRIMARY KEY,
  USER_NAME VARCHAR(255),
  CLIENT_ID VARCHAR(255),
  AUTHENTICATION VARBINARY,
  REFRESH_TOKEN VARCHAR(255)
);

CREATE TABLE OAUTH_REFRESH_TOKEN (
  TOKEN_ID VARCHAR(255),
  TOKEN VARBINARY,
  AUTHENTICATION VARBINARY
);

CREATE TABLE OAUTH_CODE (
  CODE VARCHAR(255),
  AUTHENTICATION VARBINARY
);

CREATE TABLE OAUTH_APPROVALS (
  USERID VARCHAR(255),
  CLIENTID VARCHAR(255),
  SCOPE VARCHAR(255),
  STATUS VARCHAR(10),
  EXPIRESAT TIMESTAMP,
  LASTMODIFIEDAT TIMESTAMP
);


CREATE TABLE AUTHORITY (
   ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
   NAME VARCHAR(255),
   PRIMARY KEY (ID)
);

ALTER TABLE AUTHORITY ADD CONSTRAINT AUTHORITY_NAME UNIQUE(NAME);

CREATE TABLE USER_ (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  PASSWORD VARCHAR(255),
  USER_NAME VARCHAR(255),
  ACCOUNT_EXPIRED BOOLEAN,
  ACCOUNT_LOCKED BOOLEAN,
  CREDENTIALS_EXPIRED BOOLEAN,
  ENABLED BOOLEAN,
  PRIMARY KEY (ID)
);

ALTER TABLE USER_ ADD CONSTRAINT USER_USER_NAME UNIQUE(USER_NAME);

CREATE TABLE USERS_AUTHORITIES (
   USER_ID BIGINT NOT NULL,
   AUTHORITY_ID BIGINT NOT NULL,
   PRIMARY KEY (USER_ID, AUTHORITY_ID)
);

ALTER TABLE USERS_AUTHORITIES ADD CONSTRAINT USERS_AUTHORITIES_AUTHORITY
   FOREIGN KEY (AUTHORITY_ID) REFERENCES AUTHORITY;

ALTER TABLE USERS_AUTHORITIES ADD CONSTRAINT USERS_AUTHORITIES_USER_
   FOREIGN KEY (USER_ID) REFERENCES USER_;
