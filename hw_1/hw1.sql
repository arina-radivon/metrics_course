-- ALTER TABLE hw1_orders ALTER COLUMN order_date type date using order_date::date


select
	extract(year from order_date) as year,
	count(extract(year from order_date)) as sum_orders	
from hw1_orders
group by 1


with ct1 as (
select
	id,
	extract(year from order_date) as year,
	ship_mode,
	customer_id,
	sales
from hw1_orders
)
,
ct2 as (
select distinct customer_id
from ct1
where year between '2014' and '2016'
)
select count(customer_id)
from ct1
where year = '2017' and 
	  customer_id  not in (select customer_id from ct2) and
--	  ship_mode = 'First'
--	  ship_mode = 'Second'
--	  ship_mode = 'Standard'
	  ship_mode = 'Same Day'

	  
select distinct hc.city 
from hw1_orders ho 
left join hw1_customers hc on ho.customer_id = hc.id 
where ho.ship_mode = 'Same Day'


select distinct segment
from hw1_customers hc 


with ct1 as (
select
	ho.id,
	extract(year from ho.order_date) as year,
	ho.ship_mode,
	ho.customer_id,
	hc.segment
from hw1_orders ho
left join hw1_customers hc on ho.customer_id = hc.id 
)
,
ct2 as (
select distinct customer_id
from ct1
where year = '2014'
)
select count(customer_id)
from ct1
where year = '2015' and 
	  customer_id in (select customer_id from ct2) and
	  segment = 'Consumer'
--	  segment = 'Corporate'
--	  segment = 'Home Office'


