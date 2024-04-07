{{ config(materialized='view') }}

select 
	date_format(order_date, '%Y') as year, 
  count(distinct customer_id) as total_customers,
  count(distinct order_id) as total_orders,
	sum(order_amount) as total_revenue 
from 
	icebase.retail.orders_enriched 
group by 1 
order by 1
