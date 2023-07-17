
---Пример создания простой функции

CREATE FUNCTION CountStudents()
RETURNS TABLE
AS
	RETURN
	(
		SELECT COUNT(students_id) as[Количество] FROM students
	);


SELECT * FROM CountStudents()
