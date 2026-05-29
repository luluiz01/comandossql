/* 577. Employee Bonus */

SELECT em.name, bo.bonus
FROM Employee as em
LEFT JOIN Bonus as bo
on em.empId = bo.empId  
WHERE bonus < 1000

SELECT em.name, bo.bonus
FROM Employee as em
LEFT JOIN Bonus as bo
on em.empId = bo.empId  
WHERE bo.bonus < 1000 or bo.bonus is null

WHERE COALESCE(b.bonus, 0) < 1000


/* 1280. Students and Examinations */


SELECT s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as attended_exams 
FROM Students as s

CROSS JOIN Subjects as sub
LEFT JOIN Examinations as e

ON  e.student_id = s.student_id 
AND e.subject_name = sub.subject_name 

GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name


/* 570. Managers with at Least 5 Direct Reports */

SELECT name
FROM Employee
WHERE id in (
    SELECT managerId
    FROM (
        SELECT managerId, COUNT(managerId) as n_managers
        FROM Employee e
        GROUP BY managerId
    ) t WHERE n_managers >=5
    )


/* 1934. Confirmation Rate */


SELECT s.user_id,
ROUND (
    SUM(
        CASE
        WHEN UPPER(c.action) = 'CONFIRMED'
        THEN 1 ELSE 0
    END) / COUNT(
        COALESCE(c.action, 0)
        ), 2) as confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id

/* 620. Not Boring Movies*/

SELECT * 
FROM Cinema
WHERE id % 2 != 0 and description != 'boring'
ORDER BY rating desc

/*  */

SELECT *
FROM Cinema
WHERE MOD(ID, 2) != 0 AND LOWER(description) NOT LIKE '%boring%'
ORDER BY rating DESC


/* 1251. Average Selling Price */


WITH total_vendas as (
SELECT u.product_id, SUM(u.units) as total_units
FROM UnitsSold u
GROUP BY u.product_id
),

total_produtos as (
    SELECT p.product_id, SUM(p.price * u.units) as total_vendas
    FROM Prices p
    LEFT JOIN UnitsSold u
        ON p.product_id = u.product_id
        AND u.purchase_date between p.start_date AND p.end_date
    GROUP BY p.product_id

),

SELECT tp.product_id, COALESCE(ROUND(tp.total_vendas/tv.total_units, 2), 0) as average_price
FROM total_produtos tp
LEFT JOIN total_vendas tv
ON tp.product_id = tv.product_id

/* 1075. Project Employees I
*/

SELECT p.project_id, ROUND(AVG(experience_years), 2) as average_years 
FROM Project as p
LEFT JOIN Employee as e
ON p.employee_id = e.employee_id
GROUP BY project_id 


/* 1633. Percentage of Users Attended a Contest */
SELECT r.contest_id, ROUND(COUNT(r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS porcentagem
FROM Register r
GROUP BY r.contest_id
ORDER BY porcentagem DESC, contest_id ASC



/* CASE WHEN  */
/* 1633. Percentage of Users Attended a Contest */

SELECT query_name, 
    ROUND(SUM(rating/position)/COUNT(query_name), 2) as quality,
    ROUND ((SUM(CASE
    WHEN q.rating < 3 THEN 1
    ELSE 0
END)/COUNT(query_name)) * 100, 2) as poor_query_percentage
FROM Queries q
GROUP BY query_name


/* 1193. Monthly Transactions I
Medium */

SELECT DATE_FORMAT(trans_date, "%Y-%m") as month,
country,
COUNT(amount) as trans_count,
 SUM(
    CASE 
        WHEN state = 'approved' THEN 1
        ELSE 0
    END
) as approved_count, SUM(amount) as trans_total_amount,
SUM(
    CASE 
        WHEN state = 'approved' THEN amount
        ELSE 0
    END
) as approved_total_amount


FROM Transactions
GROUP BY month, country 


/* 1211. Queries Quality and Percentage */

SELECT query_name, 
    ROUND(SUM(rating/position)/COUNT(query_name), 2) as quality,
    ROUND ((SUM(CASE
    WHEN q.rating < 3 THEN 1
    ELSE 0
END)/COUNT(query_name)) * 100, 2) as poor_query_percentage
FROM Queries q
GROUP BY query_name