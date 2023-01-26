show tables;
use moviedb;
select * from actors;
select * from movie_cast;
select * from movie;
-- 1 write a query to find actor who were cast in the movie "Annie Hall".return the actor first name, last name and role
-- solved using 3 join table
select act_fname,act_lname,role
  from  actors a join movie_cast m
  on a.act_id=m.act_id
  join movie ma
  on m.mov_id=ma.mov_id
  where mov_title="Annie Hall";
-- or
select mov_id from movie where mov_title="Annie Hall";
select act_id from movie_cast where mov_id=911;
select act_fname,act_lname,movie_cast.role
 from actors inner join movie_cast
 on actors.act_id=movie_cast.act_id
 where actors.act_id= 111;
 
 /*
 -- 2 write a sql query to find a director who directed the movie that casted role for "Eyes wide shut" 
      return director first name,last name and movie title
 */
 select * from director;
 select * from movie_direction;
 select * from movie;
 
 select dir_fname,dir_lname,mov_title
   from director d join movie_direction m
   on d.dir_id=m.dir_id
   join movie ma
   on m.mov_id = ma.mov_id
   where mov_title="Eyes wide Shut";

/*
-- 3 write a sql query to find who directed the movie that casted role "sean maguire" 
     return director first name,last name and movie title
*/
select * from movie_cast;
select * from movie;
select * from movie_direction;
select * from director;

select dir_fname,dir_lname,mov_title
 from movie_cast ma join movie m
 on ma.mov_id=m.mov_id
 join movie_direction md
 on m.mov_id=md.mov_id
 join director d
 on d.dir_id=md.dir_id
 where role="sean maguire";
 
/*
-- 4 write a sql query to find the actors who have not acted in the movie between 1990-2000 both included. 
   return actor fname,actor lname,movie title & release year
*/
select * from actors;
select * from movie_cast;
select * from movie;

select act_fname,act_lname,mov_title,m.mov_year as release_year
 from actors a join movie_cast ma
 on a.act_id=ma.act_id
 join movie m
 on ma.mov_id=m.mov_id
 where m.mov_year not between 1990 and 2000;
 
 /*
--  5 write a sql query to find a director with the number of genres of movies.
    group the result on director fname,last name and genre title.
	sort the result set in ascending order by director fname,last name and number of genres of movies
*/
select * from director;
select * from movie_direction;
select * from movie_genres;
select * from genres;

select dir_fname,dir_lname,gen_title,count(mg.gen_id) as number_of_genres
from director d join movie_direction md
on d.dir_id=md.dir_id
join movie_genres mg
on md.mov_id=mg.mov_id
join genres g
on mg.gen_id=g.gen_id
group by dir_fname,dir_lname,gen_title
order by dir_fname,dir_lname asc;
