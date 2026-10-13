-- get the total revenue for this ecommerce website
select
  sum(amount)
from
  orders;

-- get the share of each purchace in total revenue
select
  orders.*,
  round(amount / sum(amount) over () * 100, 2) as share
from
  orders;

-- select the revenue for each customer
select
  customer_id,
  sum(amount)
from
  orders
group by
  customer_id;

-- select the order rows, but then also the total revenue for each customer
select
  *,
  round(
    amount / sum(amount) over (partition by customer_id) * 100,
    2
  ) as share_on_customer_total,
  sum(amount) over () as total_revenue
from
  orders;

-- cumulative total
SELECT
  orders.customer_id,
  orders.ordered_at,
  orders.amount,
  SUM(orders.amount) OVER (
    PARTITION BY orders.customer_id
    ORDER BY
      orders.ordered_at
  ) AS cumulative_amount,
  customers.first_name
FROM
  orders
  join customers on orders.customer_id = customers.id;

-- which order was made first for each customer
select
  *,
  RANK() OVER(
    partition by customer_id
    order by
      ordered_at
  )
from
  orders;
