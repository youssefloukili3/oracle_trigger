--------------------------------------------------------
--  Fichier créé - vendredi-novembre-09-2018   
--------------------------------------------------------
DROP TABLE "SALAFIN"."CANDIDAT";
DROP TABLE "SALAFIN"."RECRUTEUR";
DROP TABLE "SALAFIN"."PONT";
DROP TABLE "SALAFIN"."RESULTAT";
--------------------------------------------------------
--  DDL for Table CANDIDAT
--------------------------------------------------------

  CREATE TABLE "SALAFIN"."CANDIDAT" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"STATUS" VARCHAR2(255 BYTE), 
	"RECRUTEUR" NUMBER(*,0), 
	"NOTE_CANDIDAT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECRUTEUR
--------------------------------------------------------

  CREATE TABLE "SALAFIN"."RECRUTEUR" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"DEPTID" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
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
--------------------------------------------------------
--  DDL for Table RESULTAT
--------------------------------------------------------

  CREATE TABLE "SALAFIN"."RESULTAT" 
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
REM INSERTING into SALAFIN.CANDIDAT
SET DEFINE OFF;
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('1','youssef loukili','hay raha lots bennis, fes','junior','101202303','15');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('2','Joseph Public','666 Hollow Rd.','Sophomore','101202303','8');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('3','Mary Smith','1 Lake St.','Freshman','101202303','12');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('4','Bart Simpson','Fox 5 TV','Senior','101202303','11');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('5','Homer Simpson','Fox 5 TV','Senior','101202303','10');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('6','Joe Blow','6 Yard Ct.','Junior','101202303','9');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('66','6','6','6','101202303','6');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('7','khalid zeriouh','roche noir casa','junior','101202303','18');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('9','kenza choukri','tanger','senior','101202303','13');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('110','ahlam merini','agadir','agadir','101202303','16');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('11','salmi ayoub ','ain sbaa','senior','101202303','14');
Insert into SALAFIN.CANDIDAT (ID,NAME,ADDRESS,STATUS,RECRUTEUR,NOTE_CANDIDAT) values ('13','kenza choukri','agadir','agadir','101202303','0');
--------------------------------------------------------
--  DDL for Index PK_CANDIDAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALAFIN"."PK_CANDIDAT" ON "SALAFIN"."CANDIDAT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger STARTER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SALAFIN"."STARTER" 
AFTER  DELETE OR INSERT OR UPDATE OF id, ADDRESS,NAME,NOTE_CANDIDAT,RECRUTEUR,STATUS ON SALAFIN.CANDIDAT FOR EACH ROW

DECLARE
   v_count int;
   PRAGMA AUTONOMOUS_TRANSACTION;
   CURSOR cc IS SELECT * FROM salafin.resultat order by note desc;
   
BEGIN
  
     select count(*) into v_count from SALAFIN.RESULTAT;
    IF v_count=0 THEN 
      INSERT 
      INTO SALAFIN.RESULTAT(id, "salaire",NAME, note) SELECT candidat.id, candidat.NOTE_CANDIDAT*1000, candidat.name, candidat.NOTE_CANDIDAT
                                                   from SALAFIN.CANDIDAT order by NOTE_CANDIDAT desc ;
      COMMIT;                                        
    ELSE 
           --execute immediate 'TRUNCATE TABLE SALAFIN.RESULTAT';
           IF DELETING THEN
            DELETE FROM SALAFIN.RESULTAT WHERE resultat.id = :OLD.ID;
            
            execute immediate 'TRUNCATE TABLE SALAFIN.pont';
            insert into salafin.pont SELECT * FROM SALAFIN.RESULTAT ORDER BY SALAFIN.RESULTAT.NOTE DESC; 
              
            
            COMMIT;
           END IF;
           
           IF UPDATING THEN 
               UPDATE SALAFIN.RESULTAT SET
                id = :NEW.ID,
                "salaire" = :NEW.NOTE_CANDIDAT*1000,
                NAME= :NEW.NAME ,
                note=:NEW.NOTE_CANDIDAT  WHERE RESULTAT.ID = :OLD.ID  ;
                
                execute immediate 'TRUNCATE TABLE SALAFIN.pont';
                insert into salafin.pont SELECT * FROM SALAFIN.RESULTAT ORDER BY SALAFIN.RESULTAT.NOTE DESC; 
              
                
                COMMIT;
           END IF ;
 
           IF INSERTING THEN
             -- execute immediate 'TRUNCATE TABLE SALAFIN.RESULTAT';
               --             for pp in cc loop
              INSERT INTO SALAFIN.RESULTAT(id, "salaire",NAME, note) VALUES (:NEW.id, :NEW.NOTE_CANDIDAT*1000, :NEW.NAME, :NEW.NOTE_CANDIDAT) ;
            
             execute immediate 'TRUNCATE TABLE SALAFIN.pont';
             insert into salafin.pont SELECT * FROM SALAFIN.RESULTAT ORDER BY SALAFIN.RESULTAT.NOTE DESC; 
              
             COMMIT;
            --end loop;
           END IF;    
                    
    END IF;
END;
/
ALTER TRIGGER "SALAFIN"."STARTER" ENABLE;
--------------------------------------------------------
--  Constraints for Table CANDIDAT
--------------------------------------------------------

  ALTER TABLE "SALAFIN"."CANDIDAT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SALAFIN"."CANDIDAT" ADD CONSTRAINT "PK_CANDIDAT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
