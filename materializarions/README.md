# Materializations Documentation

## Overview
This folder contains documentation and notebooks for testing and demonstrating dbt materializations, including view, table, incremental, and ephemeral strategies.

---

## Materialization Strategies
<details>
<summary>View & Table Materialization</summary>

```yaml
models:
  dbtsnowflake:
    +materialized: view # default as view
    dim: # dim folder as table
      +materialized: table
```
- **View**: Lightweight, always up-to-date with source data.
- **Table**: Persistent, faster for large queries, refreshed on dbt run.
</details>

<details>
<summary>Incremental Materialization</summary>
- Allows models to process only new or changed data.
- Example test:
  ```sql
  insert into AIRBNB.RAW.RAW_REVIEWS values (3176, current_timestamp(), 'Anil', 'excellent stay!', 'positive');
  ```
- Run with:
  ```shell
  dbt run --full-refresh
  ```
</details>

<details>
<summary>Ephemeral Materialization</summary>

```yaml
models:
  dbtsnowflake:
    +materialized: view
    dim:
      +materialized: table
    raw:
      +materialized: ephemeral
```
- **Ephemeral**: Used for intermediate transformations, not persisted in the database.
</details>

---

## Example Notebook Usage
The `cmd.ipynb` notebook demonstrates how to:
- Change directories to the dbt project
- Run dbt models with different materializations
- Test incremental logic by inserting new rows
- Run full refreshes and ephemeral models

---

## Best Practices
- Use views for lightweight transformations.
- Use tables for performance and persistence.
- Use incremental for large, append-only datasets.
- Use ephemeral for intermediate steps.
- Document and test all models for reliability.
