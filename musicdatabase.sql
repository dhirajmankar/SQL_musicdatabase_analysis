select * from album;

select * from employee
order by levels desc limit 1;
--Q2
select count(billing_country)as total,billing_country from invoice
group by billing_country
order by total DESC;

SELECT * from invoice order by total desc limit 3;

--Q3
select billing_city,sum(total) as tot from invoice
GROUP by billing_city 
order by tot 
DESC limit 1;


select customer_id, max(total) from invoice group by customer_id;

--==========================================================
-- Medium hard
select *  from track;
select * from  artist;

--Q1

select distinct cu.email, cu.first_name, cu.last_name, genre.name from customer cu
JOIN invoice on cu.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN genre on track.genre_id = genre.genre_id
where genre.name ='Rock' 
order BY cu.email;


--Q2

select artist.artist_id,artist.name,count(track.track_id) as num from artist
JOIN album on artist.artist_id = album.artist_id
JOIN track on track.album_id = album.album_id
JOIN genre on track.genre_id = genre.genre_id
where genre.name = 'Rock' 
group by artist.artist_id 
order by num desc limit 10;


--Q3

select * from track;

select name ,milliseconds from track where milliseconds > (select avg(milliseconds) from track) order by milliseconds desc;







