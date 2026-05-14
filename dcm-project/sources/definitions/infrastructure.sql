--!jinja

DEFINE WAREHOUSE KT_CICD{{ env_suffix }}_WH
  WITH
    warehouse_size = '{{ wh_size }}'
    auto_suspend = {{ auto_suspend }}
    auto_resume = TRUE
    initially_suspended = TRUE;

DEFINE DATABASE KT_CICD{{ env_suffix }}_DB;

DEFINE SCHEMA KT_CICD{{ env_suffix }}_DB.RAW;

DEFINE SCHEMA KT_CICD{{ env_suffix }}_DB.STAGING;

DEFINE SCHEMA KT_CICD{{ env_suffix }}_DB.ANALYTICS;
