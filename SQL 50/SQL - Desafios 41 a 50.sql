/* 602. Friend Requests II: Who Has the Most Friends */


WITH accepter as (

    SELECT accepter_id as id, COUNT(accepter_id) as accepters
    FROM RequestAccepted
    GROUP BY accepter_id
),

requester as (
    SELECT requester_id, COUNT(requester_id) as requesters
    FROM RequestAccepted
    GROUP BY requester_id
)


SELECT ID, SUM(COUNT_TOTAL) as num
FROM ( 
    SELECT ID, accepters as COUNT_TOTAL FROM accepter
    UNION ALL
    SELECT ID, requesters as COUNT_TOTAL FROM requesters

) t







SELECT requester_id as id, COUNT(requester_id) as num
FROM RequestAccepted
GROUP BY requester_id

UNION ALL

SELECT accepter_id as id, COUNT(accepter_id) as num
FROM RequestAccepted
GROUP BY accepter_id



/*  */

/* 585. Investments in 2016 */ -- WINDOW FUNCITION

WITH COUNT_RULES AS (
    SELECT *,
    COUNT(TIV_2015) OVER (PARTITION BY TIV_2015) AS COUNT_TIVS,
    COUNT(1) OVER (PARTITION BY LAT, LON) AS COUNT_LOCATION
    FROM INSURANCE

)

SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016
FROM COUNT_RULES
WHERE COUNT_TIVS > 1 AND COUNT_LOCATION = 1


/* 185. Department Top Three Salaries */

 WITH CATEGORIZED_SALARY AS (
    SELECT *,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY SALARY DESC) AS SALARY_RANK
    FROM Employee
 )
SELECT d.name as Department, cs.name as Employee, salary
FROM CATEGORIZED_SALARY CS
JOIN Department d
ON cs.departmentId = d.id
WHERE SALARY_RANK <= 3


/* 1667. Fix Names in a Table */

SELECT user_id, 
    CONCAT(UCASE(SUBSTRING(name, 1, 1)),
    LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id

/* 1527. Patients With a Condition */

SELECT *
FROM Patients
WHERE conditions LIKE '%DIAB1%'
OR conditions LIKE '% DIAB1%'


/* 196. Delete Duplicate Emails  */


DELETE FROM
    PERSON
WHERE ID IN (
    SELECT ID
    FROM (
        SELECT ID,
            ROW_NUMBER() OVER ( PARTITION BY EMAIL ORDER BY ID ASC ) AS MENOR_ID
        FROM Person
    ) T
     WHERE MENOR_ID != 1
)


/* 176. Second Highest Salary */

SELECT max(salary) as SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
)


/*  1484. Group Sold Products By The Date*/


SELECT sell_date, COUNT( distinct product) as num_sold,
GROUP_CONCAT(DISTINCT product order by product asc) as products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date asc


/* 1327. List the Products Ordered in a Period */

SELECT p.product_name, SUM(o.unit) as unit
FROM Products as p
INNER JOIN Orders as o
ON p.product_id = o.product_id
WHERE order_date LIKE '2020-02%'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100


/* 1517. Find Users With Valid E-Mails */

SELECT *
FROM Users
WHERE LOWER(mail) REGEXP "[a-z][\\w\\d\\_\\.\\-][*@leetcode\\.com$]"