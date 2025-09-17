# Seeds Directory

This directory contains the Jupyter notebook for downloading and managing DBT seed data.

## Overview

The `cmd.ipynb` notebook automates the process of downloading seed data from external sources and loading it into the DBT project for use in transformations.

## Files

- `cmd.ipynb` - Jupyter notebook for seed data operations
- Full moon dates seed data (downloaded automatically)

## Workflow

```mermaid
flowchart TD
    A[Start Notebook] --> B[Download seed_full_moon_dates.csv]
    B --> C[Move to dbtsnowflake/seeds/]
    C --> D[Navigate to DBT project]
    D --> E[Run dbt seed]
    E --> F[Load data to Snowflake]
    F --> G[Run dbt models]
    G --> H[Compile & Test]
    H --> I[Check source freshness]
    
    style A fill:#e1f5fe
    style F fill:#c8e6c9
    style I fill:#fff3e0
```

## Usage

1. Open `cmd.ipynb` in Jupyter
2. Run all cells to:
   - Download seed data from S3
   - Load into DBT seeds directory
   - Execute DBT seed command
   - Run transformations

## Seed Data

- **seed_full_moon_dates.csv**: Contains full moon dates used for analyzing review patterns during lunar cycles
- Loaded into `DEV.seed_full_moon_dates` table in Snowflake
- Used by `mart_fullmoon_reviews` model for correlation analysis