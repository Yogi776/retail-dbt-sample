select
    *
from
    {{ ref('customer_age_segmentation')}}
where
    age_bracket is null or
    age_bracket not in ('Young Adults','Adults','Senior Citizens') or
    total_customers < 0 or
    total_orders < 0
