CREATE DATABASE ATIVIDADE2;

USE ATIVIDADE2;

CREATE TABLE FUNCIONARIO(
    IDFUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100),
    RUA VARCHAR(100)
);



CREATE TABLE DEPARTAMENTO(
    IDDEPARTAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(100)
);



-- CRIANDO O RELACIONAMENTO N X N com suas devidas chaves estrangeiras
CREATE TABLE TRABALHA(
    ID_TRABALHA INT PRIMARY KEY AUTO_INCREMENT,
    DATATRABALHO DATE,
    ID_FUNCIONARIO INT,
    ID_DEPARTAMENTO INT,    
    FOREIGN KEY (ID_FUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO),
    FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(IDDEPARTAMENTO)
);



CREATE TABLE DEPENDENTE(
    IDDEPENDENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100),
    GRAUPARENTESCO VARCHAR(20),
    IDFUNCIONARIO INT,
    FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO)
);





-- PRECISEI REMOVER UMA COLUN A E JÁ TIREI DA TABLEA TBM
--ALTER TABLE TRABALHA DROP IDFUNCIONARIO;

--Adicione um novo departamento nesta empresa chamado “Obras” e outro chamado ”Gerencia”.
INSERT INTO DEPARTAMENTO VALUES(NULL, 'OBRAS');
INSERT INTO DEPARTAMENTO VALUES(NULL, 'GERENCIA');
SELECT * FROM DEPARTAMENTO;
+----------------+-----------+
| IDDEPARTAMENTO | DESCRICAO |
+----------------+-----------+
|              1 | OBRAS     |
|              2 | GERENCIA  |
+----------------+-----------+
2 rows in set (0.00 sec)

/*2. Jacinto Machado foi contratado, por isso seus dados devem
ser cadastrados neste banco de dados.*/
INSERT INTO FUNCIONARIO VALUES(NULL, 'Jacinto Machado', 'RUA DOLORES DIAS' );

--Ele esta trabalhando neste departamento Obras, vincule-o com o mesmo.
INSERT INTO TRABALHA VALUES(NULL, NOW(), 1, 1 );


/*4. Jacinto se casou, “Gumercinda Machado” é portanto sua
nova dependente.*/

INSERT INTO DEPENDENTE VALUES(NULL, 'Gumercinda Machado', 'ESPOSA', 1 );

/*5. Nasceu o filho de Jacinto, “Machado Filho”, portanto
adicione o também como dependentede Jacinto.*/
INSERT INTO DEPENDENTE VALUES(NULL, 'Machado Filho', 'FILHO', 1)

/*6. Após alguns dias Jacinto decidiu alterar o nome de seu filho
para “Gumercinto Filho”*/

UPDATE DEPENDENTE
SET NOME = "Gumercinto Filho"
WHERE IDFUNCIONARIO = 'Machado Filho';


/*7. Jacinto	foi	Promovido	a	gerente,	portanto	agora	
trabalha	no	departamento	“Gerencia”
*/


SELECT * FROM TRABALHA;
+-------------+--------------+----------------+-----------------+
| ID_TRABALHA | DATATRABALHO | ID_FUNCIONARIO | ID_DEPARTAMENTO |
+-------------+--------------+----------------+-----------------+
|           1 | 2019-10-03   |              1 |               1 |
+-------------+--------------+----------------+-----------------+
1 row in set (0.00 sec)

UPDATE TRABALHA
SET ID_DEPARTAMENTO = 2
WHERE ID_FUNCIONARIO = 1;

SELECT * FROM TRABALHA;
+-------------+--------------+----------------+-----------------+
| ID_TRABALHA | DATATRABALHO | ID_FUNCIONARIO | ID_DEPARTAMENTO |
+-------------+--------------+----------------+-----------------+
|           1 | 2019-10-03   |              1 |               2 |
+-------------+--------------+----------------+-----------------+

/*8. Jacinto	se	divorciou,	Gumercinda não	é	mais	sua	
dependente.*/
SELECT * FROM DEPENDENTE;
+--------------+--------------------+----------------+---------------+
| IDDEPENDENTE | NOME               | GRAUPARENTESCO | IDFUNCIONARIO |
+--------------+--------------------+----------------+---------------+
|            1 | Gumercinda Machado | ESPOSA         |             1 |
|            2 | Gumercinto Filho   | FILHO          |             1 |
+--------------+--------------------+----------------+---------------+

DELETE FROM DEPENDENTE
WHERE IDDEPENDENTE = 1;
 SELECT * FROM DEPENDENTE;
+--------------+------------------+----------------+---------------+
| IDDEPENDENTE | NOME             | GRAUPARENTESCO | IDFUNCIONARIO |
+--------------+------------------+----------------+---------------+
|            2 | Gumercinto Filho | FILHO          |             1 |
+--------------+------------------+----------------+---------------+

/*9. Após	o	acontecido,	Jacinto,	muito	triste	pediu	demissão, e	devido	isso:*/

/*a) Ele	foi	desvinculado	do	departamento	onde	trabalhava;*/
SELECT * FROM DEPARTAMENTO;
SELECT * FROM TRABALHA;

DELETE FROM TRABALHA
WHERE ID_TRABALHA = 1;

SELECT * FROM TRABALHA;
Empty set (0.00 sec)
/* b) Não	há	mais	a	necessidade	de	Gumercinto ser	seu	dependente	na	empresa;*/
SELECT * FROM DEPENDENTE;

DELETE FROM DEPENDENTE
WHERE IDDEPENDENTE = 2;

SELECT * FROM DEPENDENTE;
Empty set (0.00 sec)

/*c) O	mesmo	foi	excluído	da	base	de	dados	desta	empresa.*/
 SELECT * FROM FUNCIONARIO;
+---------------+-----------------+------------------+
| IDFUNCIONARIO | NOME            | RUA              |
+---------------+-----------------+------------------+
|             1 | Jacinto Machado | RUA DOLORES DIAS |
+---------------+-----------------+------------------+
1 row in set (0.00 sec)

DELETE FROM FUNCIONARIO
WHERE IDFUNCIONARIO = 1;

mysql> SELECT * FROM FUNCIONARIO;
Empty set (0.00 sec)

/* Professor se ler esse bilhete quero que saiba que esse foi
o deve mais triste que já fiz na minha vida, chorei muito com 
essa história desse funcionário */



