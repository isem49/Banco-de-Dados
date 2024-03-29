use bdescola;

DELIMITER $$

CREATE PROCEDURE LISTAR_ALUNOS (IN quantidade INT)
BEGIN

	SELECT * FROM ALUNO LIMIT quantidade;
    
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE ANALISE_NOTAS(OUT NOME VARCHAR(120), OUT MAX_NOTA DOUBLE, IN IDALUNO INT)
BEGIN 

	SELECT NOME_ALUNO INTO NOME FROM ALUNO WHERE ID_ALUNO = IDALUNO;
    
    SELECT MAX(N.NOTA) INTO MAX_NOTA FROM NOTAS N WHERE N.ID_ALUNO = IDALUNO;
    
    


END$$


DELIMITER ;

SET @NOME = "";
SET @MAX_NOTA = 0;

DROP PROCEDURE ANALISE_NOTAS;

CALL LISTAR_ALUNOS(5);

CALL ANALISE_NOTAS(@NOME,@MAX_NOTA, 2);
SELECT @NOME, @MAX_NOTA;

SELECT * FROM NOTAS;