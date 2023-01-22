with res1 as (
select
	count(ag.student_id) as ne_sdali
from
	teachers t
join students_groups sg on
	t.teacher_id = sg.teacher_id
join students s on
	sg.group_id = s.group_id
join assignments_grades ag on
	s.student_id = ag.student_id
	and ag.grade = 0
group by sg.group_id),
res2 as (
select
	s.group_id as g_id,
	avg(ag.grade) as avg_grade
from
	teachers t
join students_groups sg on
	t.teacher_id = sg.teacher_id
join students s on
	sg.group_id = s.group_id
join assignments_grades ag on
	s.student_id = ag.student_id
group by
	sg.group_id
)
select
	*
from
	res1 join res2