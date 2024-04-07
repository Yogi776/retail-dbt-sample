select
    *
from
    {{ ref('customer_income_segmentation')}}
where
    income_bracket is null or
    income_bracket not in ('$15k-$25k','$25k-$35k','$35k-$50k','<$15k','$150k-$200k','$200k','$100k-$150k','$50k-$75k','$75k-$100k') or
    total_customers < 0 or
    total_orders < 0
