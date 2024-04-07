{{ config(materialized='view') }}

select 
    brand_name,
    count(distinct customer_id) as total_customers,
    count(distinct order_id) as total_orders, 
    sum(order_amount) as total_revenue 
from 
    icebase.retail.orders_enriched 
where 
    brand_name is not null 
group by 1 
order by 3 desc
