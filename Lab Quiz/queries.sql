select CourseName from course 
where CourseNumber  
IN  (select CourseNumber from section 
        where Year>=2001 and Year<=2004
    ); 

CREATE VIEW Student_report as 
select StudentNumber,SectionIdentifier from grade_report; 

ALTER VIEW Student_report as 
select StudentNumber,SectionIdentifier,Marks from grade_report;

create table Student_report (
    StudentNumber INT NOT NULL,
    SectionIdentifier INT NOT NULL,
    Marks INT NOT NULL
);


insert into Student_report(
    StudentNumber,
    SectionIdentifier
)
select StudentNumber,SectionIdentifier FROM grade_report;

update Student_report set marks = (mod(RAND()*100,10));
update Student_report set marks = 10*marks;

((mod(RAND()*100,10)))*10


--3
delimiter $$
create or replace trigger updation
before insert
on student_report for each row
begin
insert into student_result values(new.studentnumber,new.marks);
end
$$
delimiter ;



--4
delimiter $$
create or replace function remark(studentno int) 
returns varchar(255)
begin
declare remark_msg varchar(255);
declare major_sub varchar(255);
set major_sub = (select major from student where studentnumber = studentno) ;
if major_sub = 'CS' then
    set  remark_msg = "Computer Science Engg";
else
    set remark_msg = "Electronics Engg";
end if;
return remark_msg;
end
$$
delimiter ;