-- This query performs an INNER JOINs between the staff, rota, and shift tables  
-- to retrieve each staff member's working days, calculated total hours worked, and hourly salary

SELECT
	ro.date, 
    sh.day_of_week,
    stf.first_name, 
    stf.position, 
    sh.start_time,
    sh.end_time,
    CASE
		WHEN (sh.end_time - sh.start_time) >= 6 THEN (sh.end_time - sh.start_time - 1)
		ELSE (sh.end_time - sh.start_time)
		END AS total_hours,
    stf.salary_per_hour
From staff stf
JOIN rota ro ON stf.staff_id = ro.staff_id
JOIN shift sh ON ro.shift_id = sh.shift_id
GROUP BY ro.date, sh.day_of_week, stf.first_name, stf.position, sh.start_time, sh.end_time, stf.salary_per_hour;

