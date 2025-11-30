-- This creates a summary table
SELECT 
    COUNT(*) as total_trips,
    SUM(fare_amount) as total_revenue,
    AVG(fare_amount) as average_fare
FROM {{ ref('stg_uber_trips') }}
```

5. **Press Ctrl+S** to save

### **Step 7: Run Your Code**

1. **Click in the command line** at the bottom (where it says "dbt build --select <model_name>")
2. **Delete** whatever is there
3. **Type exactly:** `dbt run`
4. **Press Enter**

**Wait for it to finish** (you'll see green text)

### **Step 8: Check If It Worked**

If successful, you'll see:
```
Completed successfully
Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2