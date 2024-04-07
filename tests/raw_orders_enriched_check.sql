select
    *
from
    icebase.retail.orders_enriched
where
    customer_id is null or
    order_id is null or
    order_amount<0 or
    order_amount is null
