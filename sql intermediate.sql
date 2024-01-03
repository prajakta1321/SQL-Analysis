select *
from student join takes on student.ID= takes.ID;

select *
from student join takes on student.ID= takes.ID;

# to display a list of all students, displaying their ID, and name, dept name, and tot cred, along with the courses that they have taken.
select * 
from students
natural join takes;

select *
from students
natural left outer join takes;

# find all the students who have not taken a course
select ID
from students natural left outer join takes
where course_id is null;

# Display a list of all students in the Comp. Sci. department, along with the course
# sections, if any, that they have taken in Spring 2009; all course sections fromSpring
# 2009 must be displayed, even if no student from the Comp. Sci. department has
# taken the course section.”  

select *
from students 
left outer join takes on student.id = takes.id;

select id , name , dept 
from students;

# We may want to have a list of all course sections offered by the Physics
# department in the Fall 2009 semester,with the building and room number of each
# section.

select course.course_id , sec_id, buliding , room_number
from course , section
where course.course_id = section.course_id
and course.dept_name = 'Physics'
and section.semester = 'Fall'
and section.year = '2009';

# views:

# consider the clerk who needs to access all the data in the instructor relation except salary

create view faculty as
select id , name , dept_name
from instructor;

# to create a view that lists all course sections offered by the physics dept in the fall 2009 semester with the building
# and room number of each section

create view physics.fall_2009 as
select course.course_id , sec_id ,buliding , room_number
from course , section
where course.course_id = section.course_id
where course.dept_name = 'Physics'
and section.semester = 'Fall'
and section.year = '2009';

# find all the physics courses offered in the fall 2009 semesteer in the watson buliding 
select course_id
from physics_fall_2009
where building = 'Watson';

create view instructor_info as
select id , name, building
from instructor,building
where instructor.dept_name = department.dept_name;

create view history_instructors as
select * 
from instructor
where dept_name = 'History';

# consider a staff member who needs to know the   salaries of all faculties in geology dept
create view geo_instructor as
(select * 
from instructor
where dept_name = 'Geology';


select * 
from geo_instructor;
