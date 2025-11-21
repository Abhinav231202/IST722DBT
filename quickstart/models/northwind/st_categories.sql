select
    *
from {{ source('northwind', 'categories') }}

select
    customer_id::string as customer_id,
    company_name,
    contact_name,
    city,
    country
from {{ source('northwind', 'customers') }}
