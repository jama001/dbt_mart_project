select o.*, customer_city, customer_unique_id, oi.amount, p.*
from {{ ref('orders_stg')}} as o
join {{ ref('customers_stg')}} as c
on o.customer_id = c.customer_id
join {{ref('order_items_stg')}} as oi
on oi.order_id = o.order_id
join {{ref('products_stg')}} as p
on p.product_id = oi.product_id
where order_status in ('canceled','unavailable')