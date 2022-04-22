-- Membuat table teachers
CREATE TABLE teachers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
)

-- Menambah column age
ALTER TABLE teachers ADD age INT;
-- Menghapus column age
ALTER TABLE teachers DROP COLUMN age;

-- Mengganti tipe data column salary
ALTER TABLE teachers MODIFY COLUMN salary INT;

-- Mengubah nama table teachers menjadi guru
ALTER TABLE teachers RENAME TO guru;

-- Mengubah nama table guru menjadi teachers
ALTER TABLE guru RENAME TO teachers;

-- Mengisi data ke table teachers
INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
-- Melihat isi dari table teachers          
SELECT * FROM teachers;

-- Menghapus semua isi dari table teachers
TRUNCATE TABLE teachers;

-- Menghapus table teachers
DROP TABLE teachers;

-- Mengubah salah dari id=3
UPDATE teachers
SET salary=50000
WHERE id=3;

-- Melihat column first_name, last_name, dan school
SELECT first_name, last_name, school
FROM teachers;

-- Mengurutkan last_name dari huruf Z-A
SELECT *
FROM teachers
ORDER BY last_name DESC;

-- Mengurutkan last_name dari huruf Z-A dan school dari hurud A-Z
SELECT *
From teachers
ORDER BY last_name DESC, SCHOOL ASC;

-- Menghapus data dengan id=6
DELETE FROM teachers
WHERE id=6;

-- Menambah data baru
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);


-- Mencari dosen yang mengajar di Harvard University dengan gaji lebih dari 50000
SELECT *
FROM teachers
WHERE school='Harvard University' AND salary>50000;

-- Mencari dosen yang nama belakangnya abbers or smith
-- Cara pertama penggunaan OR
SELECT *
FROM teachers
WHERE last_name='abbers' OR last_name='Smith';

-- Cara 2 dengan menggunakan IN
SELECT *
FROM teachers
WHERE last_name in ('Abbers', 'Smith');

-- Melihat total gaji dari MIT
SELECT SUM(salary) as total_gaji
FROM teachers
WHERE school='MIT'


-- Melihat unique value di column school
SELECT COUNT (DISTINCT(school))
FROM teachers
