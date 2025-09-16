with date_conversion as (
select 
cast(order_purchase_timestamp as date) as order_date,
order_id,
amount,
cancelled_amount
from {{ ref('all_orders_int')}}
)

select order_date,
sum(amount) as amount,
sum(cancelled_amount) as cancelled_amount,
COUNT(DISTINCT CASE WHEN cancelled_amount = 0 THEN order_id END) AS accepted_orders_count,
COUNT(DISTINCT CASE WHEN cancelled_amount > 0 THEN order_id END) AS cancelled_orders_count
FROM date_conversion
GROUP BY order_date