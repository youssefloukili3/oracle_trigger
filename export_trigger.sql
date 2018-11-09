--------------------------------------------------------
--  Fichier créé - vendredi-novembre-09-2018   
--------------------------------------------------------
DROP TRIGGER "SALAFIN"."STARTER";
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
