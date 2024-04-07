{{ config(materialized='view') }}

{% if target.name == 'trino' %}
    {% set security_type = 'INVOKER' %}
{% else %}
    {% set security_type = 'DEFINER' %}
{% endif %}

CREATE OR REPLACE VIEW {{ ref('icebase.retail.yoy_total_revenue') }} SECURITY {{ security_type }} AS
SELECT
  date_format(order_date, '%Y') AS year,
  count(DISTINCT customer_id) AS total_customers,
  count(DISTINCT order_id) AS total_orders,
  sum(order_amount) AS total_revenue
FROM
  {{ source('icebase', 'orders_enriched') }}
GROUP BY
  1
ORDER BY
  1
