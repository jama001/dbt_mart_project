with top_10_pct as (
    select sum(amount) as top_10_pct_amount
    from {{ ref('top_10%_customers_int')}}
    ),
sum_all as (
    select sum(amount) as all_amount,
    SUM(CASE WHEN {{ year_filter('order_purchase_timestamp', 0) }} THEN amount END) AS last_yr_amount
    from {{ ref('accepted_order_items_customers_int')}}
    )

select top_10_pct_amount*100/all_amount as top_10_pct_revenue,
last_yr_amount AS last_yr_sales
from top_10_pct as t
join sum_all as a
on 1 = 1