/*
  What are the 5 neighborhoods with the most restaurants?

  Let's assume that a business is a resaurant if it has a licensetype that
  starts with 'Food Preparing and Serving'.

  Hint: It may help to use the business_annotated_with_neighborhood query as a
  CTE.
*/

with business_annotated_with_neighborhood as (
    select ...
)

select ...
