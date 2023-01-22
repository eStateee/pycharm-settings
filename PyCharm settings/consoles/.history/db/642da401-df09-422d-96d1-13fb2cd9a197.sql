select full_name from teachers where teacher_id =
(select teacher_id  from assignments where assisgnment_id =
(select ass_id from
(SELECT ass_id
  FROM (select assisgnment_id as ass_id, avg(grade) as avg_g from assignments_grades
  group by assisgnment_id))));
;-- -. . -..- - / . -. - .-. -.--
select full_name from teachers where teacher_id =
(select teacher_id  from assignments where assisgnment_id =
(select ass_id from
(SELECT ass_id, min(avg_g) as avg
  FROM (select assisgnment_id as ass_id, avg(grade) as avg_g from assignments_grades
  group by assisgnment_id))));
;-- -. . -..- - / . -. - .-. -.--
select full_name from teachers where teacher_id =
(select teacher_id  from assignments where assisgnment_id =
(SELECT ass_id
  FROM (select assisgnment_id as ass_id, avg(grade) as avg_g from assignments_grades
  group by assisgnment_id
  order by avg_g limit 1)));
;-- -. . -..- - / . -. - .-. -.--
SELECT full_name
  FROM teachers
 WHERE teacher_id = (
                        SELECT teacher_id
                          FROM assignments
                         WHERE assisgnment_id = (
                                                    SELECT ass_id
                                                      FROM (
                                                               SELECT assisgnment_id AS ass_id,
                                                                      avg(grade) AS avg_g
                                                                 FROM assignments_grades
                                                                GROUP BY assisgnment_id
                                                                ORDER BY avg_g
                                                                LIMIT 1
                                                           )
                                                )
                    );
;-- -. . -..- - / . -. - .-. -.--
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
group by
	sg.group_id),
with res2 as (
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
	res1;
;-- -. . -..- - / . -. - .-. -.--
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
group by
	sg.group_id)
with res1 as (
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
);
;-- -. . -..- - / . -. - .-. -.--
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
	res1 join res2;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS authors (
id integer PRIMARY KEY,
name text NOT NULL,
surname text NOT NULL
);