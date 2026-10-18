use studentmanagementdb;
create table students(
student_id int primary key auto_increment,
student_name varchar(50) not null,
student_gender enum("m","f","othr"),
student_contact varchar(10),
student_email varchar(50) unique
);
create table subjects(
subject_id int auto_increment primary key,
subject_name varchar(100) not null
);
create table marks(
marks_id int auto_increment primary key,
student_id int,
subject_id int,
marks int,
foreign key(student_id) references students(student_id),
foreign key(subject_id) references subjects(subject_id)
);
DELIMITER $$
CREATE procedure addstudent(
student_name varchar(50),
student_gender enum("m","f","othr"),
student_contact varchar(10),
student_email varchar(50)
)
begin
insert into students(student_name, student_gender, student_contact, student_email) 
values(student_name, student_gender, student_contact, student_email);
end $$
call addstudent("anushri", "f", "8767394470", "anushri@gmail.com");
call addstudent("sanika", "f", "8767394470", "sanika@gmail.com");
call addstudent("uday", "m", "9130012154", "uday@gmail.com");
call addstudent("vaishanvi", "f", "9823619905", "vaishanavi@gmail.com");
select * from students;

insert into subjects(subject_name)
values ("hindi"),("english"),("math");
select * from subjects;

insert into marks(student_id, subject_id, marks)
values(1,1,45), (1,2,70), (1,3,90);
insert into marks(student_id, subject_id, marks)
values(2,1,50), (2,2,60), (2,3,80);
insert into marks(student_id, subject_id, marks)
values(3,1,80), (3,1,90), (3,1,40);
insert into marks(student_id, subject_id, marks)
values(4,1,80), (3,2,70), (1,2,94);
select * from marks;
select m.marks_id, m.marks, s.subject_name, st.students_name from marks m
join subjects s on m.subject_id=s.subject_id 
join stuednts st on m.student_id=st.student_id
order by marks_id;
