select 
    f.saleskey,
    f.orderid,
    f.productid,
    f.unitprice,
    f.quantity,
    f.discount,
    f.extendedpriceamount,
    c.companyname as customer_company,
    e.employeenamefirstlast as employee_name,
    p.productname,
    p.categoryname,
    s.companyname as supplier_company,
    d.date as order_date,
    d.year as order_year,
    d.month as order_month
from {{ ref('fact_sales') }} f
    left join {{ ref('dim_customer') }} c on f.customerkey = c.customerkey
    left join {{ ref('dim_employee') }} e on f.employeekey = e.employeekey
    left join {{ ref('dim_product') }} p on f.productkey = p.productkey
    left join {{ ref('dim_supplier') }} s on f.supplierkey = s.supplierkey
    left join {{ ref('dim_date') }} d on f.orderdatekey = d.datekey
