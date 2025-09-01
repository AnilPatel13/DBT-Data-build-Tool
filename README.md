# DBT Data Build Tool - Snowflake Integration

A complete DBT project setup for Snowflake data transformations using Airbnb sample data.

## Project Structure

```
DBT-Data-build-Tool/
├── Snowflake-Steup/          # Snowflake user and role setup
├── Snowflake-Data-Import/    # Raw data import scripts
├── dbtsnowflake/            # DBT project directory
└── venv/                    # Python virtual environment
```

## Quick Start

### 1. Snowflake Setup
```bash
cd "Snowflake-Steup"
# Execute user creation.sql in Snowflake
```

### 2. Data Import
```bash
cd "Snowflake-Data-Import" 
# Upload CSV files and execute Data Import.sql
```

### 3. DBT Project
```bash
# Activate virtual environment
source venv/bin/activate

# Navigate to DBT project
cd dbtsnowflake

# Test connection
dbt debug

# Run models
dbt run
```

## Configuration

### DBT Profile
- **Account**: xcvqojm-myb04708
- **User**: dbt
- **Role**: transform
- **Database**: AIRBNB
- **Warehouse**: COMPUTE_WH
- **Schema**: DEV

### Data Sources
- **Listings**: Property information
- **Reviews**: Guest reviews with sentiment
- **Hosts**: Host profiles and superhost status

## Prerequisites

- Python virtual environment
- Snowflake account access
- DBT installed (`dbt-snowflake` adapter)

## Development

1. Create new models in `dbtsnowflake/models/`
2. Test with `dbt run`
3. Generate documentation with `dbt docs generate`
4. Serve docs with `dbt docs serve`

## Connection Verified

✅ All checks passed - ready for development!