.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING count(*) == 1;


CREATE TABLE matchmaker AS
  SELECT student_one.pet, student_one.song, student_one.color, student_two.color
        FROM students AS student_one, students AS student_two
        WHERE student_one.pet = student_two.pet AND student_one.song = student_two.song AND 
        student_one.time < student_two.time;


CREATE TABLE sevens AS
  SELECT stu.seven FROM students AS stu, numbers AS num
        WHERE stu.time = num.time AND stu.number = 7 AND num.'7' = 'True';


CREATE TABLE avg_difference AS
  SELECT round(avg(abs(number - smallest))) FROM students;

