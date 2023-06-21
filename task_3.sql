-- 1 Вывести сколько фильмов сняла одна любая кинокомпания с одним и тем же режиссером
SELECT COUNT(*)
FROM movies
WHERE companies_id = (SELECT id FROM companies WHERE company = 'Disney')
AND producers_id = (SELECT id FROM producers WHERE producer = 'Стивен Спилберг')
;

-- 2 Вывести сколько всего фильмов было снято одной любой кинокомпанией
select count(*)
from movies
join companies on movies.companies_id = companies.id
where companies.company = 'Sony Pictures'
;

-- 3 Вывести количество снятых фильмов любой кинокомпанией за последние 10 лет
select count(*)
from movies
join companies on companies.id = movies.companies_id
where year >= year(curdate()) - 10
;

-- 4 Вывести жанры фильмов в которых снимал один любой режиссер в течении всей своей карьеры
select count(*) as genres, genres.genre
from movies
join producers on producers.id = movies.producers_id
join genres on genres.id = movies.genres_id
where producers.producer = 'Стивен Спилберг'
group by genres.genre 
;

-- 5 Вывести все фильмы, снятые самой большой кинокомпанией (по сумме бюджетов фильмов)
SELECT movies.title, companies.company
FROM movies 
JOIN companies ON movies.companies_id = companies.id
WHERE companies.id = (SELECT companies_id FROM movies GROUP BY companies_id ORDER BY SUM(budget) DESC LIMIT 1);

-- 6 Вывести 5 самых дорогих фильмов
select movies.title, movies.budget
from movies
order by movies.budget desc
limit 5
;