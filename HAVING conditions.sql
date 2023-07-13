---Найти группу с минимальным количеством студентов

---HAVING работает с bool значениями (True, False) 
---HAVING COUNT(groupping.designation) = (основное условие, MIN, MAX...)
---Количество студентов (например 3)   = (основное условие)

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
