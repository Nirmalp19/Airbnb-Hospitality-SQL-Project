select name from airbnb.listings;

select count(*) from airbnb.listings;

select count(listing_id) from airbnb.booking_details;

select host_id from airbnb.listings;

select distinct(host_name) from airbnb.listings;

select distinct(neighbourhood_group) from airbnb.listings;

select distinct(neighbourhood) from airbnb.listings;

select distinct(room_type) from airbnb.listings;

select * from airbnb.listings
where neighbourhood_group in ('Brooklyn','Manhattan');

select max(price) from airbnb.booking_details;

select min(price) from airbnb.booking_details;

select avg(price) from airbnb.booking_details;

select max(minimum_nights) from airbnb.booking_details;

select min(minimum_nights) from airbnb.booking_details;

select avg(availability_365) from airbnb.booking_details;

select listing_id, availability_365 from airbnb.booking_details
where availability_365 > 300 ;

select count(listing_id) from airbnb.booking_details
where price between 300 and 400;

select count(listing_id) from airbnb.booking_details
where minimum_nights < 5 ;

select count(listing_id) from airbnb.booking_details
where minimum_nights > 100;

select * from airbnb.booking_details
join airbnb.listings
on listing_id = id;

select host_name,price from airbnb.booking_details
join airbnb.listings
on listing_id = id;

select room_type,price from airbnb.booking_details
join airbnb.listings
on listing_id = id;

select neighbourhood_group,minimum_nights from airbnb.booking_details
join airbnb.listings
on listing_id = id;

select neighbourhood,availability_365 from airbnb.booking_details
join airbnb.listings
on listing_id = id;

select neighbourhood_group,sum(price) as Total_price from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by neighbourhood_group;

select neighbourhood_group,Max(minimum_nights) as Max_nights_spend from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by neighbourhood_group;

select neighbourhood,Max(reviews_per_month) as Max_reviews_per_month from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by neighbourhood;

select room_type,Max(price) as Max_price from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by room_type;

select room_type,avg(number_of_reviews) as avg_number_of_reviews from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by room_type;

select room_type,avg(price) as avg_price from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by room_type;

select room_type,avg(minimum_nights) as avg_nights_spend from airbnb.booking_details
join airbnb.listings
on listing_id = id
group by room_type;

select room_type,avg(price) as avg_price from airbnb.booking_details
join airbnb.listings
on listing_id = id 
group by room_type
having avg(price) < 100;

select neighbourhood,avg(minimum_nights) as avg_Night from airbnb.booking_details
join airbnb.listings
on listing_id = id 
group by neighbourhood
having avg(minimum_nights) > 5;

select * from airbnb.listings
where id in (select id from airbnb.booking_details
join airbnb.listings
on listing_id = id 
and price > 200);

select * from airbnb.booking_details
where listing_id in (select id from airbnb.booking_details
join airbnb.listings
on listing_id = id 
where host_id = 314941);

select id,host_id from airbnb.listings
where id = host_id;

select * from airbnb.listings
join airbnb.booking_details on id = listing_id
where name like "%Cozy%";

select neighbourhood_group, price, host_id from airbnb.listings
join airbnb.booking_details on id = listing_id
where neighbourhood_group = "Manhattan";

select id, price, host_name,neighbourhood from airbnb.listings
join airbnb.booking_details on id = listing_id
where neighbourhood in ('Upper West Side','Williamsburg') and price > 100;

select id, price, host_name,neighbourhood from airbnb.listings
join airbnb.booking_details on id = listing_id
where neighbourhood = 'Bedford-Stuyvesant' and host_name = 'Elise';

select host_name, availability_365,minimum_nights  from airbnb.listings
join airbnb.booking_details on id = listing_id
where minimum_nights > 100 and availability_365 > 100;

select id , host_name , number_of_reviews,reviews_per_month   from airbnb.listings
join airbnb.booking_details on id = listing_id
where number_of_reviews > 500 and reviews_per_month > 5;

select neighbourhood_group,sum(number_of_reviews) as total_reviwes from airbnb.listings
join airbnb.booking_details on id = listing_id
group by neighbourhood_group
order by total_reviwes desc;

select host_name,sum(price) as total_price from airbnb.listings
join airbnb.booking_details on id = listing_id
group by host_name
order by total_price ;

select host_name,sum(price) as total_price from airbnb.listings
join airbnb.booking_details on id = listing_id
group by host_name
order by total_price desc;

select host_name from airbnb.listings
join airbnb.booking_details on id = listing_id
where price = (select max(price)  from airbnb.listings
join airbnb.booking_details);

select neighbourhood_group from airbnb.listings
join airbnb.booking_details on id = listing_id and price < 100;

select room_type,max(price) as Max_price, avg(availability_365) as Avg_price  from airbnb.listings
join airbnb.booking_details on id = listing_id
group by room_type
order by Max_price;