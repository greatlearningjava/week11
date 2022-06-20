-- Views
CREATE VIEW SALES_PER_CITY
as
SELECT address as city, sum(amount) as total_sale
FROM CUSTOMER_DETAILS c
         inner join orders o
where c.user_name = o.user_name
group by city;

CREATE VIEW MAX_SALE_PER_MONTH
as
SELECT EXTRACT(MONTH FROM ORDER_DATE) as month,
       max(amount) as max_sale
from orders
GROUP BY month;

CREATE VIEW TOTAL_LAST_YEAR_SALES_PER_MONTH
as
SELECT EXTRACT(MONTH FROM ORDER_DATE) as month,
       sum(amount) as max_sale
from orders
WHERE EXTRACT(YEAR FROM ORDER_DATE) = YEAR(CURRENT_TIMESTAMP) - 1
GROUP BY month;

--Views
CREATE VIEW VIEW_ORDERS
as
SELECT *
FROM ORDERS;

CREATE VIEW VIEW_TODAY_ORDERS
as
SELECT *
FROM ORDERS
where trunc(ORDER_DATE) = TRUNC(SYSDATE);

CREATE VIEW VIEW_YESTERDAY_ORDERS
as
SELECT *
FROM ORDERS
where trunc(ORDER_DATE) = TRUNC(SYSDATE) - 1;