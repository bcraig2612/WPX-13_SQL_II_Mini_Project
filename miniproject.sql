--- STEP 1 (FOREIGN KEYS / NEW TABLE) ---
CREATE TABLE movie(
  movie_id SERIAL PRIMARY KEY,
  title TEXT ,
  media_type_id INTEGER references media_type(media_type_id)
  );


insert into movie (title, media_type_id)
values ('The Lion King', 3);

select * from movie;  

--- STEP 2 (FOREIGN KEYS / EXISTING TABLE) ---
ALTER TABLE movie ADD COLUMN genre_id INTEGER REFERENCES genre(genre_id);

SELECT * FROM movie;

--- STEP 3 (UPDATING ROWS) ---
UPDATE movie SET genre_id=22 WHERE movie_id=1;

SELECT * FROM movie;

--- STEP 4 (USING JOINS) ---
SELECT * FROM movie
JOIN media_type ON (movie.media_type_id = media_type.media_type_id);

SELECT m.movie_id, m.title, mt.name FROM movie m 
JOIN media_type mt ON (m.media_type_id = mt.media_type_id)
JOIN genre g on (m.genre_id = g.genre_id);

--- STEP 5 (USING NESTED QUERIES / SUB-SELECTS) ---
SELECT * FROM Track 
WHERE genre_id IN ( SELECT genre_id FROM genre WHERE name = 'Jazz' OR name = 'Blues' );

--- STEP 6 (SETTING VALUES TO NULL) ---
UPDATE employee SET phone = null WHERE employee_id = 1;

SELECT * FROM employee WHERE employee_id = 1;

--- STEP 7 (QUERYING A NULL VALUE) ---
SELECT * from customer WHERE Company IS null;

--- STEP 8 (GROUP BY) ---
SELECT artist.artist_id, artist.name, COUNT(*) 
FROM artist
JOIN album ON (artist.artist_id = album.artist_id) 
GROUP BY artist.artist_id ORDER BY COUNT DESC;

--- STEP 9 (DISTINCT) ---
SELECT DISTINCT country FROM customer;

--- STEP 10 (DELETE ROWS) ---
SELECT * FROM customer WHERE fax IS NULL;

/* The delete won't work since they are children using a foreign key. However, if there wasn't a foreign key, you would successfully delete all customers WHERE fax is null */
DELETE FROM customer WHERE fax IS NULL;