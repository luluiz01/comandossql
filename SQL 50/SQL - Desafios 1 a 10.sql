/* 1757. Recyclable and Low Fat Products */
SELECT product_id
FROM PRODUCTS
WHERE low_fats = 'Y' AND recycleble = 'Y'


/* 584. Find Customer Referee */
SELECT NAME
FROM CUSTOMER 
WHERE referee_id != 2 and referee_id = 'null' 

/* 595. Big Countries */

SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE POPULATION >= 25000000 OR AREA >= 3000000 

/* 1148. Article Views I*/

SELECT author_id as id
FROM views
WHERE author_id = viewer_id
GROUP BY author_id
ORDER BY author_id ASC


/* SELECT DISTINCT author_id AS id -
 DISTINCT → remove duplicados da forma mais direta possível */

 /* select Marca Produto, count(Marca_Produto) as Quantidade
from produtos
group by Marca_Produto; 

*/


/* 1683. Invalid Tweets */


SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15 -- ou LENGTH(content)



/* 1378. Replace Employee ID With The Unique Identifier*/

select EmployeeUNI.unique_id, Employees.name
from Employees
left join EmployeeUNI
on Employees.id = EmployeeUNI.id


/* 1068. Product Sales Analysis I */

SELECT Product.product_name, Sales.year, Sales.price
FROM SALES 
inner JOIN Product
ON Sales.product_id  = Product.product_id

/* 1581. Customer Who Visited but Did Not Make Any Transactions*/

