-- Exploring all the dimension in the data

-- Exploring the countries our customers come from
select distinct country from gold_dim_customers;

-- Exploring the categories, sub categories & items in our product
select count(distinct category) from gold_dim_product order by category desc; 
/* 4 different category */
select distinct category from gold_dim_product order by category desc; 

select count(distinct sub_category) from gold_dim_product order by category desc; 
/* 36 different sub-category */
select distinct sub_category from gold_dim_product order by sub_category desc; 

select count(distinct product_name) from gold_dim_product order by category desc; 
/* 295 different products */
select distinct product_name from gold_dim_product order by product_name desc; 



-- Exploring the date columns in our data
select
min(order_date) as first_order_date, 
max(order_date) as latest_order_date,
ceil(datediff(max(order_date), min(order_date))/365) as order_range_in_years
from gold_fact_sales;

Select
min(birthdate) as oldest_birthdate,
ceil(datediff(curdate(), min(birthdate))/365) as oldest_age,
max(birthdate) as youngest_birthdate,
ceil(datediff(curdate(), max(birthdate))/365) as youngest_age
from gold_dim_customers;