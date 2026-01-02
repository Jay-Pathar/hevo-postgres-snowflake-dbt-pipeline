select
    id,
    first_name,
    last_name
from {{ source('hevo_raw', '_POSTGRES_RAW_CUSTOMERS') }}
