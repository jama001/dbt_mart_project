with customer_amounts as(
select 
customer_unique_id, 
sum(amount) as amount
from {{ ref('accepted_order_items_customers_int')}}
group by customer_unique_id
)

select top (10) percent
 customer_unique_id,
 amount
from customer_amounts
order by amount desc