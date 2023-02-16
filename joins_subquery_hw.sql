--Q1: List all customers who live in Texas (use
--JOINs) --Jennifer Davis Kim Cruz Richard Mccrary Bryan Hardison Ian Still
select first_name,last_name from customer inner join address on address.address_id = customer.address_id and address.district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name,payment.payment_id, payment.amount
from customer inner join payment on payment.customer_id = customer.customer_id and payment.amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries) peter menard
select first_name, last_name from customer where customer_id in (
	select customer_id from payment group by customer_id having max(amount) > 175
);

--4. List all customers that live in Nepal (use the city table)  Kevin Schuler

select country_id from country where country = 'Nepal';

select city_id from address where city_id in (
	select city_id from city having country_id = 66
);
select first_name, last_name from customer where address_id in (
	select address_id from address where city_id in (
		select city_id from address where city_id in (
			select city_id from city where country_id = 66
	)
));

--5. Which staff member had the most transactions?   Jon Stephens

select staff_id, count(payment_id) from payment group by staff_id order by count(payment_id) desc;

select first_name, last_name, staff_id from staff where staff_id = 2;

--6. How many movies of each rating are there? G-178 pg-194 r-196 nc17-209 pg13 223

select rating, count(film_id) from film group by rating order by count(film_id)desc;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select customer_id, first_name, last_name from customer where customer_id in (
	select customer_id from payment where amount > 6.99 group by customer_id having count(payment_id) = 1
);

--8.How many free rentals did our stores give away? 1452

select count(rental_id) from rental where rental_id in(select rental.rental_id from rental left join payment on payment.rental_id = rental.rental_id where payment.rental_id is null);






