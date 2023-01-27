/*
Furniture store sales data gotten from https://gist.github.com/pamelafox/791ce9e4eb31abce2362
Inspired by Khan Academy course on SQL > https://www.khanacademy.org/computing/computer-programming/sql/more-advanced-sql-queries/pp/project-data-dig
*/



/* === What are average, max, and min values in the data? === */

SELECT AVG(price) FROM sales;
SELECT MAX(price) FROM sales;
SELECT MIN(price) FROM sales;


/* === What about those numbers per category in the data (using HAVING)? === */

/* Finding which countries have the minimum price that paid by Visa */
SELECT country, MIN(price) AS minimum_price FROM sales GROUP BY country HAVING payment_type = "Visa";

/* Find which products have a price of 3600 or less */
SELECT product FROM sales GROUP BY product HAVING price <=3600;


/* === What ways are there to group the data values that don’t exist yet (using CASE)? === */




/* === What interesting ways are there to filter the data (using AND/OR)? === */
