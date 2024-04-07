{{ config(materialized='view') }}
SELECT 
  state, 
  count(distinct customer_id) as total_customers,
  count(distinct order_id) as total_orders, 
  sum(order_amount) as total_revenue
FROM 
  icebase.retail.orders_enriched 
WHERE 
  brand_name IS NOT NULL 
GROUP BY 1 
ORDER BY 4 DESC;
