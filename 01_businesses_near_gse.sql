/*
  What are the 5 closest business to the Graduate School of Education building
  (3700 Walnut St) that aren't owned by the Trustees of UPenn? Try using
  https://geojson.io/ to get the coordinates of GSE.

  Hint: There are two ways to get the distance from one geometry to another in
  PostgresSQL:
  1. ST_Distance (https://postgis.net/docs/ST_Distance.html)
  2. The distance operator (https://postgis.net/docs/geometry_distance_knn.html)

  The latter should be used if getting distances for ORDER BY.
*/

select *
from phl_business_licenses
where not (legalname like '%UNIV%' and legalname like '%TRUS%')
order by the_geom <-> st_setsrid(st_makepoint(-75.1972559094429, 39.95324269431504), 4326)
limit 5
