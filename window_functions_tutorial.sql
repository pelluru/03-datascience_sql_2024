--https://neon.tech/postgresql/postgresql-window-function
-- window functions tutorial

SELECT
	AVG (price)
FROM
	products;


SELECT
	group_name,
	AVG (price)
FROM
	products
INNER JOIN product_groups USING (group_id)
GROUP BY
	group_name;

SELECT
	product_name,
	price,
	group_name,
	AVG (price) OVER (
	   PARTITION BY group_name
	)
FROM
	products
	INNER JOIN
		product_groups USING (group_id);


-- PostgreSQL has a sophisticated syntax for window function call. The following illustrates the simplified version:

--window_function(arg1, arg2,..) OVER (
--   [PARTITION BY partition_expression]
--   [ORDER BY sort_expression [ASC | DESC] [NULLS {FIRST | LAST }])


SELECT
	product_name,
	group_name,
	price,
	ROW_NUMBER () OVER (
		PARTITION BY group_name
		ORDER BY
			price
	)
FROM
	products
INNER JOIN product_groups USING (group_id);


SELECT
	product_name,
	group_name,
  price,
	RANK () OVER (
		PARTITION BY group_name
		ORDER BY
			price
	)
FROM
	products
INNER JOIN product_groups USING (group_id);



SELECT
	product_name,
	group_name,
	price,
	DENSE_RANK () OVER (
		PARTITION BY group_name
		ORDER BY
			price
	)
FROM
	products
INNER JOIN product_groups USING (group_id);


SELECT
	product_name,
	group_name,
	price,
	FIRST_VALUE (price) OVER (
		PARTITION BY group_name
		ORDER BY
			price
	) AS lowest_price_per_group
FROM
	products
INNER JOIN product_groups USING (group_id);


SELECT
	product_name,
	group_name,
	price,
	LAST_VALUE (price) OVER (
		PARTITION BY group_name
		ORDER BY
			price RANGE BETWEEN UNBOUNDED PRECEDING
		AND UNBOUNDED FOLLOWING
	) AS highest_price_per_group
FROM
	products
INNER JOIN product_groups USING (group_id);



--The LAG and LEAD functions
--The LAG() function has the ability to access data from the previous row, while the LEAD() function can access data from the next row.

--Both LAG() and LEAD() functions have the same syntax as follows:

--LAG  (expression [,offset] [,default]) over_clause;
--LEAD (expression [,offset] [,default]) over_clause;
--In this syntax:

--expression – a column or expression to compute the returned value.
--offset – the number of rows preceding ( LAG)/ following ( LEAD) the current row. It defaults to 1.
--default – the default returned value if the offset goes beyond the scope of the window. The default is NULL if you skip it.
--The following statement uses the LAG() function to return the prices from the previous row and calculates the difference between the price of the current row and the previous row.



SELECT
	product_name,
	group_name,
	price,
	LAG (price, 1) OVER (
		PARTITION BY group_name
		ORDER BY
			price
	) AS prev_price,
	price - LAG (price, 1) OVER (
		PARTITION BY group_name
		ORDER BY
			price
	) AS cur_prev_diff
FROM
	products
INNER JOIN product_groups USING (group_id);



SELECT
	product_name,
	group_name,
	price,
	LEAD (price, 1) OVER (
		PARTITION BY group_name
		ORDER BY
			price
	) AS next_price,
	price - LEAD (price, 1) OVER (
		PARTITION BY group_name
		ORDER BY
			price
	) AS cur_next_diff
FROM
	products
INNER JOIN product_groups USING (group_id);






