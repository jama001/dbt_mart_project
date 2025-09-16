with converted as (
select order_id,
order_item_id,
product_id,
seller_id,
shipping_limit_date,
cast(price as decimal(10,2)) as price,
cast(freight_value as decimal(10,2)) as freight_value
from {{source('raw','order_items')}}
)

select *, price + freight_value as amount
from converted