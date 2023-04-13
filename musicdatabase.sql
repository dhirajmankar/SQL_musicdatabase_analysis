select * from album;
   -- Question set 1 : Easy
--Q1  Who is the senior most employee based on job title?

select * from employee
order by levels desc limit 1;
--Q2 Which countries have the most Invoices?

select count(billing_country)as total,billing_country from invoice
group by billing_country
order by total DESC;

--Q3  What are top 3 values of total invoice?

SELECT * from invoice order by total desc limit 3;


--Q4 .
/*Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. Write a query that returns one city that 
has the highest sum of invoice totals. Return both the city name & sum of all invoice 
totals */

select billing_city,sum(total) as tot from invoice
GROUP by billing_city 
order by tot 
DESC limit 1;

--Q5 
/*  Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money*/

select customer_id, max(total) from invoice group by customer_id;

--==========================================================
            -- Question set 2 : Medium
select *  from track;
select * from  artist;

--Q1 
/* Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A */

select distinct cu.email, cu.first_name, cu.last_name, genre.name from customer cu
JOIN invoice on cu.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN genre on track.genre_id = genre.genre_id
where genre.name ='Rock' 
order BY cu.email; -- execution time 130 ms

-- here we have lots of joins that might slow down our query
-- alternate approach

select DISTINCT cu.email , cu.first_name ,cu .last_name  FROM customer cu
JOIN invoice ON cu.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
where track_id IN (
	select track_id from track
	JOIN genre ON track.genre_id = genre.genre_id	
	WHERE genre."name" LIKE 'Rock')
order by cu.email DESC; -- execution time 83 ms

--Q2
/*  Let's invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands */

select artist.artist_id,artist.name,count(track.track_id) as num from artist
JOIN album on artist.artist_id = album.artist_id
JOIN track on track.album_id = album.album_id
JOIN genre on track.genre_id = genre.genre_id
where genre.name = 'Rock' 
group by artist.artist_id 
order by num desc limit 10;


--Q3
/*  Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first  */
select * from track;

select name ,milliseconds from track where milliseconds > (select avg(milliseconds) from track) order by milliseconds desc;







