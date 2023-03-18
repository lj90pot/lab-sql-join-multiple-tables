/*Luis*/
use sakila;
 
## Q1
 select
	s.store_id
    , ci.city
    , co.country
 from store s
	inner join address a 
		on s.address_id=a.address_id
	inner join city ci
		on a.city_id=ci.city_id
	inner join country co
		on co.country_id=ci.country_id
 ;
 
## Q2
select
	s.store_id
    , concat('$ ',format(sum(p.amount),2)) as 'total_amount'
from store s
	left join customer cu
		on s.store_id=cu.store_id
	left join payment p 
		on p.customer_id=p.customer_id
group by s.store_id
;

## Q3
select
	c.name
    , concat(format(sum(length)/count(*),2), ' min') as 'AVG_film_length'
from film f
	left join film_category fc
		on f.film_id=fc.film_id
	inner join category c
		on c.category_id=fc.category_id
group by c.name
;

## Q4
select
	c.name
    , concat(format(sum(length)/count(*),2), ' min') as 'AVG_film_length'
from film f
	left join film_category fc
		on f.film_id=fc.film_id
	inner join category c
		on c.category_id=fc.category_id
group by c.name
order by AVG_film_length desc
;

## Q5
select
	f.title
    , count(r.rental_id) as 'num_rentals'
from film f
	left join inventory i
		on f.film_id=i.film_id
	left join rental r
		on r.inventory_id=i.inventory_id
group by f.title
order by num_rentals desc 
;

## Q6
select 
	c.name
    , sum(p.amount) as 'amount'
from payment p
	inner join rental r
		on r.rental_id=p.rental_id
	inner join inventory i 
		on i.inventory_id=r.inventory_id
	inner join film f
		on f.film_id=i.film_id
	inner join film_category fc
		on fc.film_id=f.film_id
	inner join category c
		on c.category_id=fc.category_id
group by c.name
order by amount
limit 5
;

## Q7
select
	f.title
    , i.store_id
    , i.inventory_id
    , r.rental_id
    , r.rental_date
    , r.return_date
from film f
	inner join inventory i
		on f.film_id=i.film_id
	inner join rental r 
		on r.inventory_id=i.inventory_id
where f.title='ACADEMY DINOSAUR' and 
	store_id=1
order by r.rental_date
;

##Yes there are films academy dinosaur that has return date in Store 1. There are movies available to rent. different Inventory_id