select customer_unique_id, 
count(distinct order_id) as order_count,
sum(amount) as amount,
datediff(DAY,min(order_purchase_timestamp),getdate()) as days_as_customers,
datediff(DAY,max(order_purchase_timestamp),getdate()) as days_since_last_purchase
from {{ ref('accepted_order_items_customers_int')}}
group by customer_unique_id