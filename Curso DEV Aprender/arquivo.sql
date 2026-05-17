/* A EQUIPE DE MARKETING PRECISA DE FAZER UMA PERSQUISA SOBRE NOMES MAIS COMUNS DE SEUS CLIENTES
E PRECISA DO NOME E SOBRENOME DE TODOS OS CLIENTES QUE ESTÃO CADASTRADOS NO SISTEMA.

first name , last name */

SELECT FirstName, lastName
FROM person.Person;

/* Distinct emite apenas os dados únicos */

SELECT DISTINCT FirstName
FROM person.Person;

/* ### DESAFIO 2 ###
QUANTOS NOMES SOBRENOMES ÚNICOS TEMOS EM NOSSA TABELA PERSON.PERSON ? */
SELECT DISTINCT lastName
FROM person.Person;

/*
 <> diferente de 
 */

 SELECT *
 FROM person.person
 

 /*a equipe de produção de produtos precisa do nome de todas as peças que pesam mais que 500kg mas não
mais que 700kg para inspeção*/

SELECT name
FROM Production.Product
WHERE WEIGHT > 500 and WEIGHT <= 700

/* DESAFIO
Foi pedido pelo marketing um relação de todos os empregados(employees) que são casados
(single=solteiro, married =casado) e são asalariados(salaried) */

SELECT *
from HumanResources.employee
WHERE MaritalStatus = 'm' and SalariedFlag = 1

/*  DESAFIO 3
Um usuário chamado Peter Crabs está devendo um pagamento,
consiga o email dele para que possamos enviar uma cobrança!
( você vai ter que usar a tabela person.person e depois a tabela person.emailaddress) */


SELECT *
FROM Person.person
WHERE FirstName = 'Peter' and LastName = 'Krebs'

SELECT * 
FROM person.EmailAddress
WHERE BusinessEntityID = 26


/* DESAFIO 1
eu quero saber quantos produtos temos cadastrados em nossa tabela de produtos
(production.product) */

select count(*)
from Production.Product

/* DESAFIO 2
eu quero saber quantos tamanhos de produtos temos cadastrado em nossa tabela
(production.product) */

select count(Size)
from Production.Product

/* - - ORDER BY sintaxe

SELECT coluna1, coluna2
FROM tabela
ORDER BY coluna1 asc/desc */


/* -- DESAFIO 1-

Obter o ProductId dos 10 produtos mais caros cadastrados no sistema, listando do
mais caro para o mais barato
 */
 select top 10 ProductID
FROM Production.Product
order by ListPrice desc



SELECT TOP 4 name, productnumber
FROM production.product
ORDER BY ProductID asc



/* Between sintake */

SELECT * 
FROM Production.Product
WHERE ListPrice not between 1000 and 1500

SELECT * 
FROM HumanResources.Employee
WHERE HireDate between '2009/01/01' and '2010/01/01'
order by HireDate

/* # SQL Aula 09 IN

Nos usamos o operador IN junto com o WHERE,

para verificar se um valor correspondem com qualquer valor passado na lista de
valores. */

SELECT * 
FROM Person.Person
where BusinessEntityID in (2,7,13)


/* LIKE */

/* Vamos dizer que você quer encontrar uma pessoa no banco de dados que vc sabe que
o nome dela era ovi .... alguma coisa */

SELECT *
FROM person. Person
WHERE FirstName like '%to'

/* # SQL Aula 11 Desafio Fundamentos SQL (FUNDAMENTOS)

1- Quantos produtos temos cadastrado no sistema que custam mais que 1500 dolares? */

SELECT count(ListPrice)
FROM Production.Product
WHERE ListPrice > 1500



/* 2- Quantas pessoas temos com o sobrenome que inicia com a letra P ? */
SELECT count(LastName)
FROM Person.Person
WHERE LastName like 'P%'


/* 3- Em quantas cidades únicas estao cadastrados nossos clientes ?

> terá que usar a tabela person.address
> terá que usar count, distinct */

SELECT distinct count(City)
FROM person.Address


/* 4- Quais sao as cidades únicas que temos cadastrados em nosso sistema ? */

SELECT distinct City
FROM person.Address



/* 5- Quantos produtos vermelhos tem preco entre 500 a 1000 dolares */

SELECT count(ListPrice)
FROM Production.Product
where Color = 'RED' and
ListPrice between 500 and 1000


/* 6- Quantos produtos cadastrados tem a palavra 'road' no nome deles ? */

SELECT count(*) as "Quantidade com ROAD"
FROM Production.Product
WHERE name like '%road%'


/* # SQL AULA 13 GROUP BY + DESAFIOS (INTERMEDIÁRIO)

-O GROUP BY basicamente divide o resultado da sua pesquisa em grupos */

SELECT *
FROM Sales.SalesOrderDetail

SELECT ProductID, count(ProductID) as "Contagem"
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT Firstname, count(Firstname) as "Total de cada nome"
FROM person.person
GROUP BY Firstname

/* na tabela production.product eu quero saber a média de preço para os produtos
que sao pratas(silver) */

select avg(ListPrice) as "Média dos pratas"
FROM Production.Product
WHERE Color = 'Silver'

select color, avg(ListPrice) as "PRECO"
FROM Production.Product
WHERE color = 'Silver'
GROUP by Color

/* 1- Eu preciso saber quantas pessoas tem o mesmo MiddleName agrupadas por o
MiddleName */

select MiddleName, count(MiddleName) as "Quantidade"
from Person.Person
group by MiddleName


/* 2-Eu preciso saber em média qual é a quantidade(quantity) que cada produto é
vendido na loja.

> tabela sales.salesorderdetail
› usar group by e uma função de agregação */

SELECT ProductID, avg(OrderQty) as "Media por produto"
FROM sales.SalesOrderDetail
group by ProductID


/* 3- Eu quero saber qual foram as 10 vendas que no total tiveram os maiores valores
de venda(line total) por produto do maior valor para o menor */

SELECT top 10 ProductID, sum(LineTotal)
FROM Sales.SalesOrderDetail
group by ProductID
order by SUM(LineTotal) desc

/* Quantidade de pessoas com o mesmo sobrenome */
SELECT MiddleName, count(firstName) as "Quantidade" 
FROM Person.Person
GROUP by MiddleName

/* 2-Eu preciso saber em média qual é a quantidade(quantity) que cada produto é
vendido na loja.

> tabela sales.salesorderdetail
› usar group by e uma função de agregação */

SELECT ProductID, AVG(OrderQty) as Média
FROM sales.salesorderdetail
GROUP BY ProductID


/* 3- Eu quero saber qual foram as 10 vendas que no total tiveram os maiores valores
de venda(line total) por produto do maior valor para o menor

>tabela sales.salesorderdetail
> usar group by e uma função de agregação
> se atentar a por o que você está ordenando */

SELECT TOP 10 ProductID, SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC


/* 4-Eu preciso saber quantos produtos e qual e quantidade media de produtos temos
cadastrados nas nossas ordem de serviço (WorkOrder), agrupados por productId

> usar a tabela production.workorder
> usar group by e uma função de agregação */

SELECT *
FROM Production.WorkOrder
SELECT ProductID, COUNT(ProductID) as contagem, AVG(OrderQty) as média
FROM Production.WorkOrder 
GROUP BY ProductID


/* # SQL AULA 14 HAVING + DESAFIOS (INTERMEDIÁRIO)
O having é basicamente muito usado em junção com o group by para filtrar
resultados de um agrupamento.

De uma forma mais simples eu gosto de entender ele como basicamente um where para
dados agrupados.

SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeTabela
GROUP BY coluna1
HAVING codicao; */



/* # SQL AULA 14 HAVING + DESAFIOS (INTERMEDIÁRIO)

1. Estamos querendo identificar as provincias(stateProvinceId) com o maior numero
de cadastros no nosso sistema, então é preciso encontrar quais províncias
(stateProvinceId) estão registradas no banco de dados mais que 1000 vezes

> tabela person.address
> usar having, count, e operadores matemáticos */


SELECT StateProvinceID, count(StateProvinceID) as "Quantidade"
FROM person.address
GROUP BY StateProvinceID
HAVING count(StateProvinceID) > 1000



/* 2. Desafio
Sendo que se trata de uma mutinacional os gerentes querem saber quais produtos
(productId) não estão trazendo em média no mínimo 1 milhão em total de vendas
(lineTotal)

> tabela sales.salesorderdetail
usar having, count, e operadores matemáticos */

SELECT productID, AVG(linetotal) as "Produtos que venderem menod de 1M"
FROM sales.SalesOrderDetail
GROUP BY productID
HAVING count(linetotal) < 1000000


/* JOIN */

SELECT Person.Person.BusinessEntityID, Person.Person.FirstName, Person.Person.LastName, EmailAddress
FROM Person.Person
INNER JOIN Person.EmailAddress
ON Person.Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID

SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person as p
INNER JOIN Person.EmailAddress as pe
ON p.BusinessEntityID = pe.BusinessEntityID

SELECT top 10 *
FROM person.PhoneNumberType

SELECT top 10 *
FROM person.PersonPhone

SELECT pp.BusinessEntityId, pt.name, pt.PhoneNumberTypeId, pp.PhoneNumber
FROM person.PersonPhone PP
INNER JOIN Person.PhoneNumberType PT
ON PT.PhoneNumberTypeID = pp.PhoneNumberTypeID


SELECT pa.AddressID, pa.City, pa.StateProvinceId, ps.Name as "Estado"
FROM person.stateprovince as ps
INNER JOIN person.address as pa
ON pa.StateProvinceId = ps.StateProvinceId


/* Mostra todos os cliente que não possuem o cartão de crédito cadastrado */

SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL


/* SELF JOIN */

/*  Cliente que residem na mesma região*/

SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM CUSTOMERS as A, CUSTOMERS as B
WHERE A.Region = B.Region

/* Cliente que foram contratados no mesmo ano */

SELECT a.FirstName, a.HireDate, b.FirstName, b.HireDate
FROM Employees as a, Employees as b
Where DATEPART(YEAR, a.hiredate) = DATEPART(YEAR, b.hiredate)


/* Produtos com o mesmo Disconto */

SELECT a.ProductID, a.Discount, b.ProductID, b.Discount
FROM [Order Details] as a, [Order Details] as b
WHERE a.Discount = b.Discount

/* SQL AULA 23 SUBQUERY (SUBSELECT) (AVANÇADO)

Monte um relatório para mim de todos os produtos cadastrados que tem preço de venda acima de média */

SELECT AVG(ListPrice)
FROM Production.Product

Select *
FROM Production.Product
WHERE ListPrice > 438.66


/* SubQuery  */

Select *
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)

/* Eu quero o nome dos funcionário que tem o cargo de "Desing Engineer" */

SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN ( SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer')

/* Com INNER JOIN */
SELECT pp.FirstName, he.JobTitle
FROM Person.Person as pp
INNER JOIN HumanResources.Employee as he
ON pp.BusinessEntityID = he.BusinessEntityID
WHERE JobTitle = 'Design Engineer'


/* -DESAFIO-
-- Encontre para mim todos os endereços que estão no estado de 'Alberta', Pode trazer todas informações
-- Usar Person.Address e Person.StateProvince
I */



SELECT *
FROM Person.Address
WHERE StateProvinceID IN (SELECT StateProvinceID FROM person.StateProvince WHERE Name = 'Alberta')


/* DATEPART - https://learn.microsoft.com/pt-br/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver17 */ 

-- year, day, month, week, dayofyear
SELECT SalesOrderID, DATEPART(MONTH, OrderDate)
FROM Sales.SalesOrderHeader

/* STRING -  https://learnsql.com.br/blog/funcoes-de-cadeia-de-caracteres-sql-uma-visao-geral-completa/#concat */


SELECT REPLACE(ProductNumber, '-', '#')
FROM Production.Product



CREATE TABLE Canal(
CanalId INT PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
ContagemInscritos INT DEFAULT 0,
DataCriacao DATETIME NOT NULL
);

SELECT * FROM Canal


SELECT *
FROM person.person


UPDATE person.person
SET FirstName = 'Luiz',
LastName = 'PEREIRA'
WHERE BusinessEntityID = 3

SELECT TOP 10 *
FROM person.person

