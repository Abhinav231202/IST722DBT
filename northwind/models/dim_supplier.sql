with stg_suppliers as (
    select * from {{ source('northwind','Suppliers')}}
)
select 
    {{ dbt_utils.generate_surrogate_key(['supplierid']) }} as supplierkey,
    stg_suppliers.*
from stg_suppliers