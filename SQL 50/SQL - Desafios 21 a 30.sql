/* 1174. Immediate Food Delivery II*/
with FIRST_DATE as (
    SELECT
        *,
        MIN(ORDER_DATE) OVER (PARTITION BY CUSTOMER_ID) as PRIMEIRO_PEDIDO
    FROM
        Delivery
),
FIRST_DELIVERY_TYPE as (
    SELECT
        *,
        (
            CASE
                WHEN primeiro_pedido = order_date
                and primeiro_pedido = customer_pref_delivery_date THEN 'immediate'
                WHEN primeiro_pedido = order_date
                AND primeiro_pedido != customer_pref_delivery_date THEN 'scheduled'
                ELSE Null
            END
        ) as FIRST_DELIVERY_TYPE
    FROM
        FIRST_DATE
)
SELECT
    ROUND(
        SUM(
            CASE
                WHEN FIRST_DELIVERY_TYPE = 'immediate' THEN 1
                ELSE 0
            END
        ) / SUM(
            CASE
                WHEN FIRST_DELIVERY_TYPE IS NOT NULL THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) as immediate_percentage
FROM
    FIRST_DELIVERY_TYPE



/*550. Game Play Analysis IV
Mediu*/

SELECT ROUND(COUNT(a2.player_id) / (SELECT COUNT(Distinct player_id) FROM Activity), 2)

FROM Activity a2
JOIN (
    SELECT player_id, MIN(EVENT_DATE) as primeiro_login
    FROM Activity
    GROUP BY player_id
    ) al
ON a2.event_date = DATE_ADD(al.primeiro_login, INTERVAL 1 DAY)
AND a2.player_id = al.player_id



/* 2356. Number of Unique Subjects Taught by Each Teacher
Easy */

SELECT teacher_id , count(distinct subject_id) as cnt 
FROM Teacher
GROUP BY 1


/* 1141. User Activity for the Past 30 Days I
Easy */

SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM Activity
Where activity_date between DATE_ADD('2019-07-27', INTERVAL -29 day) and '2019-07-27'
GROUP BY activity_date


/* 1070. Product Sales Analysis III */

SELECT product_id,
       first_year,
       quantity,
       price
FROM (
    SELECT product_id,
           s.year AS ano,
           MIN(s.year) OVER (PARTITION BY product_id) AS first_year,
           quantity,
           price
    FROM Sales s
) t
WHERE ano = first_year


/* 596. Classes With at Least 5 Students */
 
SELECT class
FROM Courses
GROUP BY class 
HAVING count(class) > 5

/* 1729. Find Followers Count */

SELECT user_id, count(distinct follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id asc


/* 619. Biggest Single Number */
SELECT MAX(num) as num
FROM MyNumbers
WHERE
    num in (SELECT num
            FROM MyNumbers
            GROUP BY num
            HAVING count(num) < 2
             )


/* 1045. Customers Who Bought All Products */


    SELECT c.customer_id
    FROM Customer as c
    GROUP BY c.customer_id
    HAVING COUNT( distinct c.product_key) = (
        SELECT COUNT(*)
        FROM Product
)

