
{{ config(security_invoker='INVOKER', materialized='view') }}
SELECT
  date_format(order_date, '%Y') AS year,
  count(DISTINCT customer_id) AS total_customers,
  count(DISTINCT order_id) AS total_orders,
  sum(order_amount) AS total_revenue
FROM
  icebase.retail.orders_enriched
GROUP BY
  1
ORDER BY
  1
