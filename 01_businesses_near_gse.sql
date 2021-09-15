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

select ...


SELECT *
FROM business_licenses WHERE opa_owner not like "Trustees of"
ORDER BY the_geom <-> ST_Distance(39.95331187942166, -75.19702366652584)



