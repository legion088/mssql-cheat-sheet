
---������ �������� ������� �������

CREATE FUNCTION CountStudents()
RETURNS TABLE
AS
	RETURN
	(
		SELECT COUNT(students_id) as[����������] FROM students
	);


SELECT * FROM CountStudents()
