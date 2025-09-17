{{
      config(
        materialized = 'table',
        )
}}

with fct_reviews as (
    select * from {{ ref('fact_reviews') }}
),

full_moon_dates as (
    select * from {{ ref('seed_full_moon_dates') }}
)

select
    fr.*,
    case
        when fm.full_moon_date is not null then 'not full moon'
        else 'full moon'
    end as is_full_moon
from fct_reviews fr
left join full_moon_dates fm
on (to_date(fr.review_date) = dateadd(day, 1, fm.full_moon_date))
