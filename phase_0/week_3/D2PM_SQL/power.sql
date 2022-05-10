CREATE TABLE Cars
(
    id int,
    name VARCHAR(50) not null,
    company VARCHAR(50) not NULL,
    power int not null
);

INSERT INTO Cars
VALUES
(1, 'Corrolla', 'Toyota', 1800),
(2, 'City', 'Honda', 1500),
(3, 'C200', 'Mercedez', 2000),
(4, 'Vitz', 'Toyota', 1300),
(5, 'Baleno', 'Suzuki', 1500),
(6, 'C500', 'Mercedez', 5000),
(7, '800', 'BMW', 8000),
(8, 'Mustang', 'Ford', 5000),
(9, '208', 'Peugeot', 5400),
(10, 'Prius', 'Toyota', 3200),
(11, 'Atlas', 'Volkswagen', 5000),
(12, '110', 'Bugatti', 8000),
(13, 'Landcruiser', 'Toyota', 3000),
(14, 'Civic', 'Honda', 1800),
(15, 'Accord', 'Honda', 2000)
;

select name, company, power, 
rank() over(ORDER by power desc) as rank
FROM cars; 

select name, company, power, 
rank() over(partition by company ORDER by power desc) as rank
FROM cars; 

select name, company, power, 
dense_rank() over(ORDER by power desc) as rank
FROM cars; 

/* bisa gunain ` ` atau [] */
select name, company, power, 
rank() over(ORDER by power desc) as `rank`,
dense_rank() over(ORDER by power desc) as [dense rank],
row_number() over(ORDER by power desc) as [row rank]
from Cars;


/* untuk di sqlite ada spasi di count bisa, kalau di mariadb belum tentu bisa */
SELECT COUNT (*)
FROM cars
where power=8000;