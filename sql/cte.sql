-- save the result of a single query into a variable
-- and use that in the second query
WITH tmp AS (
  SELECT
    AVG(weight) AS avg_weight
  FROM
    Player
)
SELECT
  AVG(POWER(weight - tmp.avg_weight, 2)) AS var_weight
FROM
  Player,
  tmp;
