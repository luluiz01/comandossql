
/*  */

SELECT
    e.employee_id,
    e.name,
    m.reports_count,
    m.average_age
FROM
    Employees e
    JOIN (
        SELECT
            reports_to as manager_id,
            COUNT(reports_to) as reports_count,
            ROUND (AVG(age)) as average_age
        FROM Employees
        GROUP BY reports_to
        HAVING
            COUNT(reports_to) > 0
    ) m ON e.employee_id = m.manager_id
ORDER BY e.employee_id


/* 1907. Count Salary Categories */

SELECT *,  
        CASE 
            WHEN income < 20000 then 'Low Salary' 
            WHEN income >= 20000 and income < 50000 then 'Average Salary'
            ELSE 'High Salary'
        END
     as category,
    COUNT(income) as accounts_count
FROM Accounts
GROUP BY category


---

SELECT CATEGORIAS as (
    SELECT 'Low Salary' as Category
    UNION
    SELECT 'Average Salary' as Category
    UNION
    SELECT 'High Salary' as Category
),
CATEGORIAS_DE_SALARIO as (
    SELECT *,  
        CASE 
            WHEN income < 20000 then 'Low Salary' 
            WHEN income >= 20000 and income <= 50000 then 'Average Salary'
            ELSE 'High Salary'
        END salary_category
    FROM Accounts

)

SELECT sc.category, COALESCE(count(cs.salary_category), 0) as accounts_count
FROM CATEGORĮZED_SALARY cs
RIGHT JOIN SALARY CATEGORIES SC
ON cs.salary_category = sc.category
GROUP BY sc.category



/* 626. Exchange Seats */
SELECT 
    (CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
        ELSE id
    END) as id, 
    student
     
FROM Seat
ORDER BY ID


/* 1978. Employees Whose Manager Left the Company */

SELECT employee_id
FROM Employees
WHERE salary < 30000 
AND manager_id IS NOT NULL
AND manager_id not in (
    SELECT employee_id
    FROM Employees
)
ORDER BY employee_id


/* SOLUÇÂO DO GPT */

SELECT e.employee_id
FROM Employees e
WHERE e.salary < 30000
  AND e.manager_id IS NOT NULL
  AND NOT EXISTS (
      SELECT 1
      FROM Employees m
      WHERE m.employee_id = e.manager_id
)
ORDER BY e.employee_id;


/* 1341. Movie Rating */

WITH USER_MOVIES_RATING AS (
SELECT U.name, count(mr.movie_id) as 'Quantidade de avaliações'
FROM Users U
JOIN MovieRating mr
ON U.user_id = mr.user_id
GROUP BY name
ORDER BY count(mr.movie_id) DESC, U.name ASC
LIMIT 1
),
rating_fevereiro as (
    SELECT t.title, DATE_FORMAT(mr.created_at, "%d-%M-%Y") as 'data de criação',
    AVG(mr.rating) as 'nota média'
    FROM Movies as t
    JOIN MovieRating as mr
    ON t.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29' -- OU WHERE created_at LIKE '2020-02%'
    GROUP BY title
    ORDER BY AVG(mr.rating) DESC, title asc
    LIMIT 1
)
SELECT name as results
FROM USER_MOVIES_RATING
UNION ALL
SELECT title as results
FROM rating_fevereiro




/*  1321. Restaurant Growth */

WITH REFERENCE_TABLE AS (
    SELECT VISITED_ON AS VISITED_DAY,
    DATE_ADD(VISITED_ON, INTERVAL + 6 DAY) AS MINUS_SEVEN
    FROM CUSTOMER

)

SELECT VISITED_ON, (
    SELECT SUM(SC.AMOUNT)
    FROM CUSTOMER as SC
    WHERE SC.VISITED_ON
    BETWEEN RT.VISITED_DAY AND RT.MINUS_SEVEN

) as amount,
(
    SELECT ROUND(SUM(SC.AMOUNT)/7, 2)
    FROM CUSTOMER as SC
    WHERE SC.VISITED_ON
    BETWEEN RT.VISITED_DAY AND RT.MINUS_SEVEN
) as average_amount


FROM CUSTOMER as C
JOIN REFERENCE_TABLE RT
ON C.VISITED_ON = RT.MINUS_SEVEN
GROUP BY VISITED_ON
ORDER BY VISITED_ON ASC





/* 1789. Primary Department for Each Employee */

WITH DEPARTMENT_COUNT AS (
    SELECT employee_id, COUNT(distinct department_id) as DEP_COUNT
    FROM Employee
    GROUP BY employee_id
    
) 

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, DC.dep_count
FROM Employee E
JOIN DEPARTMENT_COUNT DC
ON E.EMPLOYEE_ID = DC.EMPLOYEE_ID


/* 610. Triangle Judgement */
SELECT *,
(CASE
    WHEN (x + y) > z 
    and (x + z) > y
    and (y + z) > x 
    then 'Yes'
    ELSE 'No'
END
) as triangle
FROM Triangle


/* 6180. Consecutive Numbers */

WITH IS_CONSECUTIVE AS (
    SELECT *,
        (CASE 
            WHEN (SELECT NUM FROM LOGS WHERE ID = l.ID - 1) = l.num
            AND (SELECT NUM FROM LOGS WHERE ID = l.ID - 2) = l.num
            THEN true
            ELSE false
        END) AS CONSECUTIVE_FLAG
    FROM Logs l
)

SELECT DISTINCT num as 'ConsecutiveNums'
FROM IS_CONSECUTIVE
WHERE CONSECUTIVE_FLAG IS TRUE

/* 1164. Product Price at a Given Date */


WITH FILTERED_PRODUCTS AS (
    SELECT PRODUCT_ID, NEW_PRICE, CHANGE_DATE
    FROM (SELECT PRODUCT_ID, NEW_PRICE, CHANGE_DATE, MAX(CHANGE_DATE) OVER (PARTITION BY PRODUCT_ID) AS DATA_MAXIMA
        FROM Products
        WHERE CHANGE_DATE <= '2019-08-16'
        GROUP BY PRODUCT_ID, NEW_PRICE, CHANGE_DATE) T
    WHERE CHANGE_DATE = DATA_MAXIMA
),

PRODUCT_LIST AS (
    SELECT DISTINCT PRODUCT_ID
    FROM Products
)

SELECT pl.product_id, COALESCE(fp.new_price, 10) AS PRICE
FROM PRODUCT_LIST pl
LEFT JOIN FILTERED_PRODUCTS fp
ON PL.product_id = fp.product_id





/*1204. Last Person to Fit in the Bus  */

WITH filtro AS (

    SELECT
        turn,
        person_id AS id,
        person_name AS name,
        weight,
        SUM(weight) OVER (ORDER BY turn) AS peso_somado
    FROM Queue

)

SELECT name
FROM filtro
WHERE peso_somado <= 1000
ORDER BY turn DESC
LIMIT 1


