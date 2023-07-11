SELECT MIN(min_group."Количество студентов") as [Минимальное количество студентов] 
	FROM(
		SELECT COUNT(groupping.designation) as "Количество студентов"  
		FROM groupping
		JOIN students ON students.groupping_id = groupping.groupping_id
		GROUP BY groupping.designation
)as min_group