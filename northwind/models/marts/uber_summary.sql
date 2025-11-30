-- This creates a summary table
SELECT
    COUNT(*) as total_trips,
    SUM(fare_amount) as total_revenue,
    AVG(fare_amount) as average_fare
FROM {{ ref('stg_uber_trips') }}