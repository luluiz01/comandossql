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