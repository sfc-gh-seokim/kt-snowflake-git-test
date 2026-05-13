# KT Snowflake Git Integration Test

Snowflake Git Integration 실증 테스트용 리포지토리.

## 구조

- `dbx-synced/` - DBX 뷰/로직을 Snowflake SQL로 변환한 객체
- `sf-native/` - Snowflake 고유 객체 (분석 뷰, 프로시져, Task)

## 사용법

Snowflake에서:
```sql
ALTER GIT REPOSITORY ... FETCH;
EXECUTE IMMEDIATE FROM @repo/branches/main/dbx-synced/views/v_customers.sql;
```
