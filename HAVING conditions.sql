---Пример HAVING

---HAVING работает с bool, 
---HAVING   COUNT(groupping.designation) = (ключевое условие, определяем MIN или MAX ...)
---Отобрать что совпадает с              = (ключевое условие)

SELECT designation, COUNT(groupping.designation) as "Количество студентов" 
FROM groupping
JOIN students ON students.groupping_id = groupping.groupping_id 
GROUP BY designation
HAVING COUNT(groupping.designation) = (
	SELECT MIN(min_group."Количество студентов") 
	FROM(
		SELECT COUNT(groupping.designation) as "Количество студентов"  
		FROM groupping
		JOIN students ON students.groupping_id = groupping.groupping_id
		GROUP BY groupping.designation
	)as min_group
)