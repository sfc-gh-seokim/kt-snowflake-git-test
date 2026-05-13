-- Snowflake 고유 분석 뷰 (DBX에 없음, SF 분석가 전용)
CREATE OR ALTER VIEW ICEBERG_TEST_DB.UNITY_CATALOG.V_CUSTOMER_ORDERS_SUMMARY AS
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS lifetime_value
FROM ICEBERG_TEST_DB.UNITY_CATALOG.CUSTOMERS_FROM_DATABRICKS c
LEFT JOIN ICEBERG_TEST_DB.UNITY_CATALOG.ORDERS_FROM_DATABRICKS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;
