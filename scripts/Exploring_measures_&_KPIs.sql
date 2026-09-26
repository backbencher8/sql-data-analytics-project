-- Exploring all the measures in the data

-- Find the total sales
SELECT sum(sales_amount) from gold_fact_sales;

-- find how many items are sold
SELECT sum(quantity) from gold_fact_sales;

-- find average selling price
select floor(avg(sales_amount)) from gold_fact_sales;

-- find total number of orders
select count(order_number) from gold_fact_sales;
select count(distinct order_number) as unique_orders from gold_fact_sales;

-- find total number of products
select count(distinct product_key) from gold_dim_product;
select count(product_key) from gold_dim_product;

-- find total number of customers
select count(DISTINCT customer_key) as total_customers from gold_dim_customers;

-- find total customer who placed an order
select count(DISTINCT customer_key) as total_customers from gold_fact_sales;

-- Keeping all the KPIs of the business together
SELECT 'Total Sales' as Measure_Name, sum(sales_amount) as Measure_Value from gold_fact_sales
UNION ALL
SELECT 'Total Quantity' as Measure_Name, sum(quantity) as Measure_Value from gold_fact_sales
UNION ALL
SELECT 'Average Selling Price' as Measure_Name, floor(avg(sales_amount)) as Measure_Value from gold_fact_sales
UNION ALL
SELECT 'Total No. Orders' as Measure_Name, count(distinct order_number) as Measure_Value from gold_fact_sales
UNION ALL
SELECT 'Total No. Of Products' as Measure_Name, count(distinct product_key) as Measure_Value from gold_fact_sales
UNION ALL
SELECT 'Total No. Of Customers' as Measure_Name, count(DISTINCT customer_key) as Measure_Value from gold_dim_customers
UNION ALL
SELECT 'Total No. Placed Order' as Measure_Name, count(DISTINCT customer_key) as Measure_Value from gold_fact_sales;
