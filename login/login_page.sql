
------------------------------------------------------
--Function para tela de login, salva o codigo do usuario na variavel global - COD_USUARIO

CREATE OR REPLACE FUNCTION AUTENTICA_USUARIO_FUNC (P_USERNAME IN VARCHAR2, P_PASSWORD IN VARCHAR2)
RETURN BOOLEAN
AS
    v_user_id GLO_USUARIO.USU_IN_CODIGO%TYPE;
BEGIN
    -- Autentica o usuário e obtém o ID do usuário
    SELECT A.USU_IN_CODIGO 
    INTO v_user_id
    FROM GLO_USUARIO A
    WHERE UPPER(A.USU_ST_LOGIN) = UPPER(P_USERNAME)
    AND A.USU_ST_SENHA = P_PASSWORD
    AND A.USU_STATUS = 'Ativo';
    
    -- Armazena o ID do usuário na variável APP_USER
     APEX_UTIL.SET_SESSION_STATE('COD_USUARIO', v_user_id);

    RETURN TRUE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;

-------------------------------------
--Conceder cota na table space para usuario

ALTER USER NOME_DO_USUÁRIO QUOTA 100M ON USERS;