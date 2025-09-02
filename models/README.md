# Models Documentation

## Overview
This folder contains dbt models for transforming raw Airbnb data into source, dimension, fact, and merge tables. Models are written in SQL and organized by their purpose in the data pipeline.

---

## Data Lineage & Flow
```mermaid
graph TD
    A[row_hosts] -->|host_id| D[Source Hosts]
    B[row_listings] -->|listing_id, host_id| E[Source Listings]
    C[row_reviews] -->|listing_id| F[Source Reviews]
    X[full_moon_dates] --> G[Full Moon Table]
    D --> H[Dim Hosts]
    E --> I[Dim Listings]
    F --> J[Fact Reviews]
    G --> J
    H --> K[Merge Tables]
    I --> K
    J --> K
    K --> L[Executive Dashboard]
```

---

## Folder Structure
- `example/` contains sample models and schema files.
- Each model transforms raw data into a specific layer (source, dimension, fact, merge).

---

## Expandable Model Documentation
<details>
<summary>my_first_dbt_model.sql</summary>
Transforms raw listings data into a cleaned source or dimension table. See SQL logic in `example/my_first_dbt_model.sql`.
</details>

<details>
<summary>my_second_dbt_model.sql</summary>
Aggregates or further transforms listings data for analytics. See SQL logic in `example/my_second_dbt_model.sql`.
</details>

<details>
<summary>schema.yml</summary>
Defines tests and documentation for models. See `example/schema.yml` for details.
</details>

---

## Best Practices
- Organize models by layer (raw, source, dimension, fact, merge).
- Document and test all models for reliability.
- Use dbt materializations (view, table, incremental, ephemeral) as appropriate.
