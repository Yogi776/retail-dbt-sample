{{ config(materialized='view') }}

-- Generate the SQL with SECURITY DEFINER
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

{% if target.name == 'trino' %}
    -- Manually adjust the SQL to set SECURITY INVOKER
    -- Replace SECURITY DEFINER with SECURITY INVOKER
    -- This is a workaround since dbt doesn't directly support setting security type
    {% set sql = this.sql.replace('SECURITY DEFINER', 'SECURITY INVOKER') %}
{% endif %}

{{ sql }}
