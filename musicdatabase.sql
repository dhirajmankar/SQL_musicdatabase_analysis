select * from album;

select * from employee
order by levels desc limit 1;

select count(billing_country)as total,billing_country from invoice
group by billing_country
order by total DESC;

SELECT * from invoice order by total desc limit 3;

select billing_city,sum(total) as tot from invoice
GROUP by billing_city 
order by tot 
DESC limit 1;


select customer_id, max(total) from invoice group by customer_id;
