{{ config(materialized='table') }}

with customers as (
    select
        id as customer_id,
        first_name,
        last_name
    from
        {{ ref('stg_customers') }} cus
),

orders as (
    select
        user_id as customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order
    from
        {{ ref('stg_orders') }} odr
    group by
        user_id
),

payments as (
    select
        odr.user_id as customer_id,
        sum(py.amount) as customer_lifetime_value
    from
        {{ ref('stg_orders') }} odr
        join {{ ref('stg_payments') }} py
            on odr.id = py.order_id
    group by
        odr.user_id
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    o.most_recent_order,
    o.first_order_date,
    p.customer_lifetime_value
from
    customers c
    left join orders o
        on c.customer_id = o.customer_id
    left join payments p
        on c.customer_id = p.customer_id
