CREATE TABLE GLO_CARDS (
    ID NUMBER PRIMARY KEY NOT NULL,
    USU_IN_INCLUSAO NUMBER,
    DATA_INCLUSAO VARCHAR2(100),
    DESCRISAO VARCHAR2(100),
    ICONE VARCHAR2(100),
    DATA_EXCLUSAO DATE,
    USU_IN_EXCLUSAO VARCHAR2(100),
    EXCLUSAO VARCHAR2(100));

---
CREATE SEQUENCE GLO_CARDS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

----
CREATE OR REPLACE TRIGGER GLO_CARDS_BIR
BEFORE INSERT ON GLO_CARDS
FOR EACH ROW
BEGIN
    SELECT GLO_CARDS_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;