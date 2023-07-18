--Простая процедура
CREATE PROCEDURE Количество_Студентов AS
SELECT COUNT(students.students_id) as [Количество студентов]
FROM students;


--Процедура с входным параметром
CREATE PROCEDURE Количество_Студентов_Года_Рождения @birth_year as int
AS
SELECT COUNT(students_id) as [Количество студентов]
FROM students
WHERE date_of_birth between CONVERT(datetime,'01.01.'+CONVERT(varchar, @birth_year))
and CONVERT(datetime,'31.12.'+ CONVERT(varchar, @birth_year))
