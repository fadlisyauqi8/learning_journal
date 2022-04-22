SELECT *
FROM teachers;


SELECT * 
from teachers
where salary > 50000

SELECT count(*)
from teachers
WHERE salary > 50000

SELECT *
FROM teachers
WHERE first_name='samuel';

-- melihat nama dosen yang first_name berawalan 'sam'
SELECT *
FROM teachers
WHERE first_name LIKE 'Sam%';

-- melihat nama dosen yang first_name berakhiran 'sam'
SELECT *
FROM teachers
WHERE first_name LIKE '%sam';

-- melihat nama dosen yang first_name berakhiran 'sam'
SELECT *
FROM teachers
WHERE first_name LIKE '%sam';

-- melihat nama dosen yang first_name mengandung 'sam'
SELECT *
FROM teachers
WHERE first_name LIKE '%sam%';

-- melihat dosen yang memiliki gaji tertinggi
SELECT first_name, last_name
FROM teachers
WHERE salary=(
  SELECT max(salary)
  FROM teachers
 );
 
 -- melihat rata2 gaji dosen
 SELECT AVG(salary), FLOOR(AVG(salary)), CEIL(AVG(salary))
 FROM teachers
 WHERE school='Cambridge University';
 
 -- merlihat gaji tertinggi di setiap universitasdemo
SELECT school, MAX(salary)
FROM teachers
GROUP BY school;
 
 -- melihat dosen yang memiliki gaji tertinggi di setiap universitas
 SELECT first_name, last_name, school, salary
FROM teachers
WHERE (school, salary) IN(
  SELECT school,max(salary)
  FROM teachers
  GROUP BY school
 );
 
 -- Menggabungkan table teachers dengan table courses
 SELECT *
 from teachers
 JOIN courses ON teachers.id=teachers_id;
 
 
 -- melihat semua dosen yang mengjar calculus
 SELECT *
 FROM teachers
 JOIN courses on teachers.id=courses.teachers_id
 WHERE courses.name='Calculus';
 
 
-- Melihat matkul yg diajarkan di setiap universitas
SELECT teachers.school, COUNT(courses.id) as TOTAL_MATKUL
FROM teachers
JOIN courses on teachers.id=courses.teachers_id
GROUP BY teachers.school;

-- Melihat universitas yg memiliki matkul>5
SELECT teachers.school, COUNT(courses.id) as TOTAL_MATKUL
FROM teachers
JOIN courses on teachers.id=courses.teachers_id
GROUP BY teachers.school
HAVING TOTAL_MATKUL>5;

-- Melihat nama dosen (first_name) beserta jumlah mata kuliah yang diajarkan
SELECT teachers.first_name,, COUNT(courses.id) AS TOTAL_MATKUL
FROM teachers
JOIN courses on teachers.id=courses.teachers_id
GROUP BY teachers.first_name
ORDER BY TOTAL_MATKUL DESC, teachers.first_name ASC;