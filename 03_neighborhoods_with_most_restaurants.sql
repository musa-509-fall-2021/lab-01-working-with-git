/*
  What are the 5 neighborhoods with the most restaurants?

  Let's assume that a business is a resaurant if it has a licensetype that
  starts with 'Food Preparing and Serving'.

  Hint: It may help to use the business_annotated_with_neighborhood query as a
  CTE.
*/

with business_annotated_with_neighborhood as (
  SELECT nbh.name neighborhood_name, bns.*
  FROM business_licenses bns
  INNER JOIN neighborhoods_philadelphia nbh 
  ON ST_Contains(nbh.the_geom, bns.the_geom)
)

select neighborhood_name, count(*)
from business_annotated_with_neighborhood
where licensetyp = 'Food Preparing and Serving'
group by 1 order by 2 desc
