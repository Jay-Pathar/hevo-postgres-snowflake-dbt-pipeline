select
    id,
    order_id,
    payment_method,
    amount
from {{ source('hevo_raw', '_POSTGRES_RAW_PAYMENTS') }}
