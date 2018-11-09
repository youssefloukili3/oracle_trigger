--------------------------------------------------------
--  Fichier créé - vendredi-novembre-09-2018   
--------------------------------------------------------
DROP TABLE "SALAFIN"."PONT" cascade constraints;
--------------------------------------------------------
--  DDL for Table PONT
--------------------------------------------------------

  CREATE TABLE "SALAFIN"."PONT" 
   (	"ID" NUMBER(*,0), 
	"salaire" NUMBER, 
	"NAME" VARCHAR2(255 BYTE), 
	"NOTE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SALAFIN.PONT
SET DEFINE OFF;
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('7','18000','khalid zeriouh','18');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('110','16000','ahlam merini','16');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('1','15000','youssef loukili','15');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('11','14000','salmi ayoub ','14');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('9','13000','kenza choukri','13');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('3','12000','Mary Smith','12');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('4','11000','Bart Simpson','11');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('5','10000','Homer Simpson','10');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('6','9000','Joe Blow','9');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('2','8000','Joseph Public','8');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('66','6000','6','6');
Insert into SALAFIN.PONT (ID,"salaire",NAME,NOTE) values ('13','0','kenza choukri','0');
--------------------------------------------------------
--  Constraints for Table PONT
--------------------------------------------------------

  ALTER TABLE "SALAFIN"."PONT" MODIFY ("ID" NOT NULL ENABLE);
