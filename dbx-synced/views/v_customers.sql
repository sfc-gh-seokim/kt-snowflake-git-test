-- DBX 원본: iceberg_test.sales_ext.customers (Unity Catalog Iceberg)
-- 변환 대상: Snowflake View로 변환 (DBX 뷰 로직 재현)
CREATE OR ALTER VIEW ICEBERG_TEST_DB.UNITY_CATALOG.V_CUSTOMERS AS
SELECT
    customer_id,
    customer_name,
    email,
    -- DBX에서는 COALESCE(segment, 'UNKNOWN')으로 처리하던 로직
    COALESCE(segment, 'UNKNOWN') AS customer_segment,
    created_date
FROM ICEBERG_TEST_DB.UNITY_CATALOG.CUSTOMERS_FROM_DATABRICKS
WHERE customer_id IS NOT NULL;
