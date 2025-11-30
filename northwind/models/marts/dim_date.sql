SELECT DISTINCT
    pickup_date as date,
    YEAR(pickup_date) as year,
    MONTH(pickup_date) as month,
    MONTHNAME(pickup_date) as month_name,
    DAYNAME(pickup_date) as day_name,
    CASE WHEN DAYOFWEEK(pickup_date) IN (0,6) THEN 'Weekend' ELSE 'Weekday' END as day_type
FROM {{ ref('stg_uber_trips') }}