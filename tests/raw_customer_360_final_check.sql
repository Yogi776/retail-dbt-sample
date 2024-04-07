select
    *
from
    icebase.retail.customer_360_final
where
    customer_id is null or
    age<0 or
    income_bracket not in ('$15k-$25k','$25k-$35k','$35k-$50k','<$15k','$150k-$200k','$200k','$100k-$150k','$50k-$75k','$75k-$100k') or
    gender not in ('MALE','FEMALE','OTHER')
