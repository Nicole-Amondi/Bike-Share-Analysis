with cte as (
select * from bike_share_yr0 
union all
select * from bike_share_yr1) 

select 
a.dteday,
a.season,
a.yr,
a.weekday,
a.hr,
a.rider_type,
a.riders,
b.price,
b."COGS",
a.riders * b.price as revenue,
a.riders * b.price - a.riders * b."COGS" as profit
from cte a
left join cost_table b
on a.yr = b.yr;