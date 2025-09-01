# Snowflake Data Import

This directory contains SQL scripts to import Airbnb sample data from S3 into Snowflake raw tables.

## Overview

Imports three core datasets for Airbnb analytics:
- **Listings**: Property information and pricing
- **Reviews**: Guest reviews with sentiment analysis
- **Hosts**: Host profiles and superhost status

## Prerequisites

- Completed Snowflake setup (TRANSFORM role, AIRBNB database)
- Access to `s3://dbtlearn/` bucket (public dataset)
- COMPUTE_WH warehouse running

## Data Sources

### S3 Bucket Files
- `listings.csv` - Property listings data
- `reviews.csv` - Guest reviews data  
- `hosts.csv` - Host information data

## Table Schemas

### raw_listings
- `id` - Unique listing identifier
- `listing_url` - Property URL
- `name` - Listing title
- `room_type` - Property type
- `minimum_nights` - Minimum stay requirement
- `host_id` - Host identifier
- `price` - Nightly rate
- `created_at/updated_at` - Timestamps

### raw_reviews
- `listing_id` - Property reference
- `date` - Review date
- `reviewer_name` - Guest name
- `comments` - Review text
- `sentiment` - Sentiment analysis result

### raw_hosts
- `id` - Host identifier
- `name` - Host name
- `is_superhost` - Superhost status
- `created_at/updated_at` - Timestamps

## Installation

Execute the `Data import.sql` script in Snowflake:

```sql
-- Run the entire script to create tables and import data
```

## File Format

- **Type**: CSV
- **Header**: Skip first row
- **Quotes**: Fields optionally enclosed by double quotes
- **Source**: Public S3 bucket

## Verification

Check data import success:
```sql
SELECT COUNT(*) FROM raw_listings;
SELECT COUNT(*) FROM raw_reviews;  
SELECT COUNT(*) FROM raw_hosts;
```

## Next Steps

1. Verify data quality
2. Begin DBT model development
3. Create staging models from raw tables