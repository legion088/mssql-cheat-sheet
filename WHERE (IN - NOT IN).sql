----Определить, какие дисциплины математического блока сдают также хорошо, как дисциплины гуманитарного блока.

SELECT DISTINCT(faculty) as [Факультет], courses as [Дисциплина] FROM faculty
JOIN department ON department.faculty_id = faculty.faculty_id
JOIN specialization ON specialization.department_id = department.department_id
JOIN groupping ON groupping.specialization_id = specialization.specialization_id
JOIN students ON students.groupping_id = groupping.groupping_id
JOIN exam ON exam.students_id = students.students_id
JOIN courses ON courses.courses_id = exam.courses_id
WHERE faculty IN('Факультет Информатики', 'Факультет Математики', 'Факультет Физики')
---Исключаем те предметы у которых отрицательные оценки из мат. блока
AND courses NOT IN(
				SELECT DISTINCT(courses) as [Дисциплина] FROM faculty
				JOIN department ON department.faculty_id = faculty.faculty_id
				JOIN specialization ON specialization.department_id = department.department_id
				JOIN groupping ON groupping.specialization_id = specialization.specialization_id
				JOIN students ON students.groupping_id = groupping.groupping_id
				JOIN exam ON exam.students_id = students.students_id
				JOIN courses ON courses.courses_id = exam.courses_id
				WHERE faculty IN('Факультет Информатики', 'Факультет Математики', 'Факультет Физики')
				AND mark <=3
)
---Отбираем предметы из гуманитарного с положительными
AND courses IN (
			SELECT DISTINCT(courses) as [Дисциплина] FROM faculty
			JOIN department ON department.faculty_id = faculty.faculty_id
			JOIN specialization ON specialization.department_id = department.department_id
			JOIN groupping ON groupping.specialization_id = specialization.specialization_id
			JOIN students ON students.groupping_id = groupping.groupping_id
			JOIN exam ON exam.students_id = students.students_id
			JOIN courses ON courses.courses_id = exam.courses_id
			WHERE faculty IN('Факультет Географии', 'Факультет Истории', 'Факультет Психологии')
			AND mark > 3
)