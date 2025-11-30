-- This file pulls data from Snowflake
SELECT 
    trip_id,
    date_key,
    fare_amount,
    trip_distance_miles,
    passenger_count
FROM {{ source('uber_snowflake', 'FACT_TRIPS') }}
LIMIT 1000