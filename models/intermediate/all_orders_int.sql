select o.*,
customer_city,
customer_unique_id,
p.*,
case 
    when order_status not in ('canceled','unavailable') then oi.amount
    else 0
end as amount,
case 
    when order_status in ('canceled','unavailable') then oi.amount
    else 0
end as cancelled_amount
from {{ ref('orders_stg')}} as o
join {{ ref('customers_stg')}} as c
on o.customer_id = c.customer_id
join {{ref('order_items_stg')}} as oi
on oi.order_id = o.order_id
join {{ref('products_stg')}} as p
on p.product_id = oi.product_id