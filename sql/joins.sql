-- more joins
-- join Country to the League table
select
  League.*,
  Country.id,
  coalesce(Country.name, 'Unknown')
from
  League
  left join Country on Country.id = League.country_id;


-- Full outer join
select
  *
from
  League
  full outer join Country on League.country_id = Country.id;
