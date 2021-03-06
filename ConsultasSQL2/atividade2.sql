/*
1. Use sua criatividade para criar um DER com uma única entidade que contenha no mínimo 10 atributos.

2. Crie o banco de dados para o DER da questão 1

3. Insira pelo menos 21 entradas na tabela.

4. Remova uma entrada da tabela

5. Atualize os dados de uma tupla da tabela.

6. Crie uma consulta para o seu banco usando 2 exemplos de

1 ORDER BY
2 OPERADOR AND E OR
3 DISTINCT()
4 OPERADORES ARITIMETICOS + - * /
5 BETWEEN
6 LIKE (%_)
7 IN (..,..,..)
8 NOT IN (..,..,..)
9 COUNT()
10 SUM()
11 MAX()
12 MIN()
13 AVG()
14 GROUP BY
15 HAVING


	*/
CREATE DATABASE ATIVIDADECRIATIVIDADE;

USE ATIVIDADECRIATIVIDADE;


CREATE TABLE CELULAR(
IDCELULAR INT PRIMARY KEY AUTO_INCREMENT,
MODELO VARCHAR(50) NOT NULL,
VALOR FLOAT(10.2) NOT NULL,
FABRICANTE VARCHAR(100),
ANO INT,
DESCRICAO VARCHAR(200),
PESO FLOAT(10.2),
SISTEMAOPERACIONAL VARCHAR(30),
USB ENUM ('TIPOC','COMUM') NOT NULL,
MEMORIARAM INT NOT NULL,
ARMAZENAMENTO INT NOT NULL


);

INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'GALAXY NOTE 10', 3670.90, 'SAMSUNG', 2019, 'UM CELULAR TOP DE LINHA', 345.14, 'ANDROID', 'TIPOC', 8, 128);
INSERT INTO CELULAR VALUES(NULL, 'LG K10 2017', 650.93, 'LG', 2017, 'UM CELULAR INTERMEDIÁRIO', 200.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, '', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'LG K10 POWER', 869.00, 'LG', 2019, 'UM CELULAR INTERMEDIÁRIO', 300.12, 'ANDROID', 'COMUM', 6, 64);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'Xiaomi Redmi K20 Pro', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 265.23, 'ANDROID', 'TIPOC', 6, 128);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'LG K10 PRO', 667.92, 'LG', 2019, 'UM CELULAR INTERMEDIÁRIO', 285.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'Xiaomi Redmi K20 Pro', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'LG K11 PLUS', 529, 'LG', 2018, 'UM CELULAR BÁSICO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'LG Q6', 745, 'LG', 2019, 'UM CELULAR INTERMEDIÁRIO', 145.14, 'ANDROID', 'COMUM', 3, 32);
INSERT INTO CELULAR VALUES(NULL, 'Xiaomi MI 9', 2.270.45, 'XIAOMI', 2019, 'UM CELULAR TOP DE LINHA', 180.14, 'ANDROID', 'TIPOC', 8, 128);
INSERT INTO CELULAR VALUES(NULL, 'Xiomi Black Shark 2', 1700, 'XIAOMI', 2019, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'TIPOC', 6, 64);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'LG G7 ThinQ', 1769.45, 'LG', 2019, 'UM CELULAR TOP DE LINHA', 345.14, 'ANDROID', 'COMUM', 6, 64);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'J7 PRIME', 700, 'SAMSUNG', 2017, 'UM CELULAR INTERMEDIÁRIO', 245.14, 'ANDROID', 'COMUM', 4, 32);
INSERT INTO CELULAR VALUES(NULL, 'Xiaomi MI 9', 2.270.45, 'XIAOMI', 2019, 'UM CELULAR TOP DE LINHA', 245.14, 'ANDROID', 'TIPOC', 8, 128);






/*
1 ORDER BY
2 OPERADOR AND E OR
3 DISTINCT()
4 OPERADORES ARITIMETICOS + - * /
5 BETWEEN
6 LIKE (%_)
7 IN (..,..,..)
8 NOT IN (..,..,..)
9 COUNT()
10 SUM()
11 MAX()
12 MIN()
13 AVG()
14 GROUP BY
15 HAVING
*/

--TRAZER TODOS OS CELULAR ORDENANDO POR VALOR
SELECT * FROM CELULAR
ORDER BY VALOR;


--MOSTRAR MODELO, VALOR E A QUANTIDADE DE CADA CELULAR
SELECT MODELO, VALOR, COUNT(*) AS "QUANTIDADE DE CELULAR POR VALOR"
FROM CELULAR
GROUP BY VALOR
ORDER BY VALOR;

--TRAZER CELULARES DA LG OU SANSUMG E ORDENAR POR ANO
WHERE FABRICANTE = 'SAMSUNG'
OR 
FABRICANTE = 'LG'
ORDER BY ANO;


--MOSTRAR CELULARES DE 2017 E O LG K10 2017
SELECT * FROM CELULAR
WHERE MODELO = 'LG K10 2017'
OR ANO = 2017;

-- MOSTRAR UM CELULAR FILTRANDO POR MODELO E VALOR
SELECT * FROM CELULAR
WHERE MODELO = 'Zenfone Live'
AND VALOR = 900;

-- MOSTRE TODOS OS CELULARES EXCETO OS DA SAMSUNG
SELECT * FROM CELULAR
WHERE FABRICANTE != 'SAMSUNG';

--PROJETE O ARMAZENAMENTO DOS CELULARES
SELECT DISTINCT ARMAZENAMENTO FROM CELULAR
ORDER BY ARMAZENAMENTO;




--MEDIA DOS CELULARES DA ASUS
SELECT AVG(VALOR) AS "MÉDIA DOS CELULARES DA ASUS" FROM CELULAR
WHERE FABRICANTE = 'ASUS';

--MÉDIA DE TODOS OS CELULARES
SELECT AVG(VALOR) AS "MÉDIA DE TODOS OS CELULARES" FROM CELULAR;

SELECT SUM(VALOR) AS "SOMA DOS CELULARES COM O VALOR MENOR QUE 500" FROM CELULAR
WHERE VALOR <= 500;

SELECT SUM(VALOR) AS "SOMA DOS CELULARES DA FABRICANTE MOTOROLA" FROM CELULAR
WHERE FABRICANTE = "MOTOROLA";

SELECT MAX(VALOR) AS "CELULAR MAIS CARO DA TABELA" FROM CELULAR;

SELECT MAX(VALOR) AS "CELULAR MAIS CARO DA TABELA" FROM CELULAR
WHERE FABRICANTE = 'LG';

SELECT MIN(VALOR) AS "CELULAR MAIS BARATO DA TABELA" FROM CELULAR;

SELECT MIN(VALOR) AS "CELULAR MAIS BARATO COM O USB TIPO C" FROM CELULAR
WHERE USB = 'TIPOC' ;


--O MOTO G8 FOI VENDIDO, REMOVA-O DA TABELA
DELETE FROM CELULAR
WHERE MODELO = 'MOTO G8';

-- O GALAXY NOTE 10 ENTROU EM PROMOÇÃO, ATUALIOZE O VALOR PARA 2000
UPDATE CELULAR
SET VALOR = 2000
WHERE MODELO = 'GALAXY NOTE 10';


--- MOSTRE OS CELULARES COM O VALOR ENTRE 100 E 800 REAIS
SELECT * FROM CELULAR
WHERE VALOR BETWEEN 100 AND 800;


--- MOSTRE OS CELULARES COM O ARMAZENAMENTO ENTRE 4 E 32 
SELECT * FROM CELULAR
WHERE ARMAZENAMENTO BETWEEN 4 AND 32;

--MOSTRE TODOS OS CELULARES DE 16 E 32 GIGAS
SELECT * FROM CELULAR
WHERE ARMAZENAMENTO IN (16,32); 

--MOSTRE TODOS OS CELULARES EXCETO OS DE 16 E 32 GIGAS
SELECT * FROM CELULAR
WHERE ARMAZENAMENTO NOT IN (16,32); 

--PROJETE O NOME E O VALOR DE TODOS OS CELULARES QUE COMESSE COM ZENFONE
SELECT * FROM CELULAR
WHERE MODELO LIKE 'Zenfone%';

SELECT FABRICANTE, COUNT(*) AS "QUANTIDADE DE CELULAR DE CADA FABRICANTE" FROM CELULAR
GROUP BY FABRICANTE
ORDER BY 2;


SELECT DISTINCT MODELO, ANO FROM CELULAR;