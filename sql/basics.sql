select
  count(*) as player_count
from
  Player
where
  height < 170;

--- other aggregate functions
select
  avg(height),
  max(weight),
  min(birthday)
from
  Player;

--- count how many matches in each country
select
  country_id,
  count(*)
from
  Match
group by
  country_id;

--- basic math
-- select all players weight in kilograms
select
  round(weight / 2.205, 0) as weight_kg
from
  Player
limit
  10;

--- aggregate and do math + rounding
SELECT
  COUNT(*),
  ROUND(MIN(weight) / 2.205, 0) AS min_weight,
  ROUND(avg(weight) / 2.205, 0) AS avg_weight,
  ROUND(MAX(weight) / 2.205, 0) AS max_weight
FROM
  Player;

-- get the BMI of each player (BMI = weight_kg / height_m^2)
select
  round(avg((weight / 2.205) / power(height / 100, 2)), 2) as avg_bmi
from
  Player;


--- count how many matches in each country with their names
select
  country_id, count(*), name
from
  Match
join
  Country
on
  Match.country_id = Country.id
group by country_id;
