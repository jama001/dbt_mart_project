with date_conversion as (
select 
product_id,
product_category_name,
cast(order_purchase_timestamp as date) as order_date,
amount,
cancelled_amount
from {{ ref('all_orders_int')}}
)


select 
order_date,
product_id,
product_category_name,
sum(amount) as amount,
sum(cancelled_amount) as cancelled_amount,
COUNT(CASE WHEN cancelled_amount = 0 THEN product_id END) AS sales_count,
COUNT(CASE WHEN cancelled_amount > 0 THEN product_id END) AS cancelled_count
from date_conversion
group by product_id, product_category_name, order_date