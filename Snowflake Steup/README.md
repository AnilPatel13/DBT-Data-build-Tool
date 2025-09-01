# Snowflake Setup for DBT

This directory contains the necessary SQL scripts to set up Snowflake for DBT (Data Build Tool) integration.

## Overview

The setup creates a dedicated DBT user, role, and database structure in Snowflake to enable secure and organized data transformations.

## Prerequisites

- Snowflake account with ACCOUNTADMIN privileges
- Access to Snowflake web interface or SnowSQL CLI

## Setup Components

### 1. Role Creation
- Creates `TRANSFORM` role for DBT operations
- Grants role to ACCOUNTADMIN for management

### 2. Warehouse Configuration
- Creates or uses existing `COMPUTE_WH` warehouse
- Grants operation permissions to TRANSFORM role

### 3. User Setup
- Creates `dbt` service user with:
  - Username: `dbt`
  - Password: `dbtPassword123`
  - Default warehouse: `COMPUTE_WH`
  - Default role: `TRANSFORM`
  - Default namespace: `AIRBNB.RAW`

### 4. Database Structure
- Creates `AIRBNB` database
- Creates `RAW` schema for raw data ingestion

### 5. Permissions
- Grants comprehensive permissions to TRANSFORM role:
  - Full warehouse access
  - Database and schema management
  - Table creation and manipulation
  - Future object permissions

## Installation

1. Connect to Snowflake with ACCOUNTADMIN role
2. Execute the `user creation.sql` script:
   ```sql
   -- Run the entire script in Snowflake worksheet
   ```

## Security Notes

- **Change the default password**: Update `dbtPassword123` to a secure password
- **User type**: Set as LEGACY_SERVICE for programmatic access
- **Principle of least privilege**: Permissions are scoped to the AIRBNB database

## DBT Configuration

After running the setup, configure your DBT `profiles.yml`:

```yaml
airbnb:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: [your-account]
      user: dbt
      password: dbtPassword123
      role: TRANSFORM
      database: AIRBNB
      warehouse: COMPUTE_WH
      schema: RAW
```

## Verification

Test the setup by connecting with the DBT user:
```sql
USE ROLE TRANSFORM;
USE WAREHOUSE COMPUTE_WH;
USE DATABASE AIRBNB;
USE SCHEMA RAW;
```

## Next Steps

1. Update password for production use
2. Configure DBT project
3. Set up data sources in the RAW schema
4. Begin DBT model development