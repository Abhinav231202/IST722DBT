with f_sales as (
    select * from {{ ref('fact_sales') }}
),
d_customer as (
    select * from {{ ref('dim_customer') }}
),
d_employee as (
    select * from {{ ref('dim_employee') }}
),
d_product as (
    select * from {{ ref('dim_product') }}
),
d_supplier as (
    select * from {{ ref('dim_supplier') }}
),
d_date as (
    select * from {{ ref('dim_date') }}
)
select 
    f.*,
    d_customer.companyname as customer_company,
    d_customer.contactname as customer_contact,
    d_employee.employeenamefirstlast as employee_name,
    d_product.productname,
    d_product.categoryname,
    d_supplier.companyname as supplier_company,
    d_date.date as order_date,
    d_date.year as order_year,
    d_date.month as order_month,
    d_date.monthname as order_monthname
from f_sales f
    left join d_customer on f.customerkey = d_customer.customerkey
    left join d_employee on f.employeekey = d_employee.employeekey
    left join d_product on f.productkey = d_product.productkey
    left join d_supplier on f.supplierkey = d_supplier.supplierkey
    left join d_date on f.orderdatekey = d_date.datekey