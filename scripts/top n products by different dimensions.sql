-- top 5 products with highest revenue
Select
p.product_name,
sum(f.sales_amount) total_revenue
from gold_fact_sales f 
left join gold_dim_product p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue desc limit 5;

-- top 5 products with highest revenue using window function
Select * 
From(
	Select
	p.product_name,
	sum(f.sales_amount) total_revenue,
	row_number() over (order by sum(f.sales_amount)DESC) as rank_products
	from gold_fact_sales f 
	left join gold_dim_product p
	on p.product_key = f.product_key
	group by p.product_name) t
where rank_products <=5;

-- top 5 products with lowest revenue
Select
p.product_name,
sum(f.sales_amount) total_revenue
from gold_fact_sales f 
left join gold_dim_product p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue limit 5;

-- top 5 product's subcategory with highest revenue
Select
p.sub_category,
sum(f.sales_amount) total_revenue
from gold_fact_sales f 
left join gold_dim_product p
on p.product_key = f.product_key
group by p.sub_category
order by total_revenue desc limit 5;

-- top 5 product's subcategory with lowest revenue
Select
p.sub_category,
sum(f.sales_amount) total_revenue
from gold_fact_sales f 
left join gold_dim_product p
on p.product_key = f.product_key
group by p.sub_category
order by total_revenue limit 5;

-- top 10 customers who have generated highest revenue
Select
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue
from gold_fact_sales f
left join gold_dim_customers c
on c.customer_key = f.customer_key
group by
c.customer_key,
c.first_name,
c.last_name
order by total_revenue desc limit 10;


-- top 3 customers with fewest orders
Select
c.customer_key,
c.first_name,
c.last_name,
count(DISTINCT order_number) as total_orders
from gold_fact_sales f
left join gold_dim_customers c
on c.customer_key = f.customer_key
group by
c.customer_key,
c.first_name,
c.last_name
order by total_orders limit 3;


