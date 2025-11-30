-- This file pulls data from Snowflake
SELECT 
    trip_id,
    pickup_datetime,
    pickup_date,
    pickup_hour,
    day_name,
    day_type,
    pickup_longitude,
    pickup_latitude,
    dropoff_longitude,
    dropoff_latitude,
    trip_distance_miles,
    passenger_count,
    fare_amount,
    payment_type
FROM {{ source('uber_snowflake', 'RAW_UBER_TRIPS') }}