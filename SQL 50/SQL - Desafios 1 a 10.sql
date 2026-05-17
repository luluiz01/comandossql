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


/* EStudar CASE WHEN e CTE e Função agregação */
/* 1581. Customer Who Visited but Did Not Make Any Transactions*/ - MUITO DIFÌCIL


-- Write your MySQL query statement below


-- Solução 1
WITH transaction_frequency AS (
SELECT v.visit_id, v.customer_id, t.amount
FROM visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
)

SELECT customer_id, SUM(CASE WHEN amount IS NULL then 1 else 0 END) as count_no_trans
FROM transaction_frequency
GROUP BY customer_id
HAVING SUM(CASE WHEN amount IS NULL then 1 else 0 END) > 0

-- solução 2

WITH transaction_frequency AS (
SELECT v.visit_id, v.customer_id, t.amount
FROM visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
)

SELECT customer_id, count(*) as count_no_trans
FROM transaction_frequency
WHERE amount is null
GROUP BY customer_id

/* Se eu quiser contar nulos */

SELECT COUNT(*)
FROM tabela
WHERE coluna IS NULL;

/* SELF JOIN */
SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM CUSTOMERS as A, CUSTOMERS as B
WHERE A.Region = B.Region

Select a.id, b.id, a.recordDate, b.recordDate, a.temperature, a.temperature  
FROM Weather as a, Weather as b
WHERE a.recordDate = b.recordDate 


/* 197. Rising Temperature */
-- # Write your MySQL query statement below
SELECT id
FROM (
SELECT w1.id, w1.recordDate as record_date_atual,
        w1.temperature as temperatura_atual,
        w2.recordDate as record_date_ontem,
        w2.temperature as temperatura_ontem
FROM WEATHER w1
LEFT JOIN WEATHER W2
ON w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL -1 DAY)
) registros_temperatura
WHERE temperatura_atual > temperatura_ontem


/* 1661. Average Time of Process per Machine */

/* Com subquery */
with start_activities as (
    SELECT * 
    FROM Activity
    WHERE activity_type = 'start'
),
end_activities as (
    SELECT * 
    FROM Activity
    WHERE activity_type = 'end'
),
prepared_table as(
SELECT s.machine_id,
    s.process_id,
    e.timestamp as end_timestamp,
    s.timestamp as start_timestamp,
    ROUND(e.timestamp - s.timestamp, 3) as elapsed_time
FROM start_activities s
JOIN end_activities e
ON s.machine_id = e.machine_id AND s.process_id = e.process_id

)

select machine_id, ROUND(avg(elapsed_time), 3) as processing_time
FROM prepared_table
GROUP BY machine_id





/* Com SelfJoin */