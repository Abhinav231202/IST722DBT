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
    f.saleskey,
    f.orderid,
    f.productid,
    f.unitprice,
    f.quantity,
    f.discount,
    f.extendedpriceamount,
    d_customer.companyname as customer_company,
    d_employee.employeenamefirstlast as employee_name,
    d_product.productname,
    d_product.categ
    