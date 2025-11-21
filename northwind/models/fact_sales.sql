with stg_order_details as (
    select * from {{ source('northwind','Order_Details')}}
),
stg_orders as (
    select * from {{ source('northwind','Orders')}}
),
stg_products as (
    select * from {{ source('northwind','Products')}}
)
select 
    {{ dbt_utils.generate_surrogate_key(['od.orderid', 'od.productid']) }} as saleskey,
    od.orderid,
    od.productid,
    {{ dbt_utils.generate_surrogate_key(['od.productid']) }} as productkey,
    {{ dbt_utils.generate_surrogate_key(['o.customerid']) }} as customerkey,
    {{ dbt_utils.generate_surrogate_key(['o.employeeid']) }} as employeekey,
    {{ dbt_utils.generate_surrogate_key(['p.supplierid']) }} as supplierkey,
    replace(to_date(o.orderdate)::varchar,'-','')::int as orderdatekey,
    od.unitprice,
    od.quantity,
    od.discount,
    od.unitprice * od.quantity * (1 - od.discount) as extendedpriceamount,
    p.unitsinstock,
    p.unitsonorder,
    p.reorderlevel
from stg_order_details od
    join stg_orders o on od.orderid = o.orderid
    join stg_products p on od.productid = p.productid