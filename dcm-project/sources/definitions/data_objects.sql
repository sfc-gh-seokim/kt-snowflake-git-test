--!jinja

DEFINE TABLE KT_CICD{{ env_suffix }}_DB.RAW.SAMPLE_EVENTS (
  id NUMBER AUTOINCREMENT,
  event_name VARCHAR(255) NOT NULL,
  event_timestamp TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
  payload VARIANT
);

DEFINE TABLE KT_CICD{{ env_suffix }}_DB.STAGING.EVENTS_TRANSFORMED (
  id NUMBER,
  event_name VARCHAR(255),
  event_date DATE,
  payload_parsed OBJECT
);

DEFINE VIEW KT_CICD{{ env_suffix }}_DB.ANALYTICS.V_DAILY_EVENTS AS
  SELECT
    event_date,
    event_name,
    COUNT(*) AS event_count
  FROM KT_CICD{{ env_suffix }}_DB.STAGING.EVENTS_TRANSFORMED
  GROUP BY event_date, event_name;
