/*
  What are the 5 neighborhoods with the most restaurants?

  Let's assume that a business is a resaurant if it has a licensetype that
  starts with 'Food Preparing and Serving'.

  Hint: It may help to use the business_annotated_with_neighborhood query as a
  CTE.
*/

with business_annotated_with_neighborhood as (
  select
  n.name,
  count(*) as num_restaurants
  from business_licenses b
  join neighborhoods_philadelphia n
  on st_contains(n.the_geom, b.the_geom)
  Where licensetyp like 'Food Preparing and Serving%'
  Group by n.name
)

select n.*
from business_annotated_with_neighborhood b
join neighborhoods_philadelphia n
on n.name = b.name
order by num_restaurants desc
limit 5