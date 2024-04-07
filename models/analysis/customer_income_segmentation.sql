{{ config(materialized='view') }}

select 
	annual_income, 
	count(distinct customer_id) as total_customers,
	count(distinct order_id) as total_orders
from 
	icebase.retail.orders_enriched 
group by 1 
order by 1
