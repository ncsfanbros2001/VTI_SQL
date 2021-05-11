use assignment1;
--- TBL 1
insert into Department (DepartmentName)
values ('Management'), 
('Human Resources'),
('Financial'),
('Development'),
('Technical Support');
--- TBL 2
insert into `Position` (PositionName)
values ('Dev'), ('Test'), ('Scrum Master'), ('PM');
--- TBL 3
insert into `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
values ('modestep@gmail.com', 'Modestep', 'Josh Friend', '11', '3', '2011/08/23'),
('midnightcvlt@gmail.com', 'MidCVLT', 'Michael White', '12', '4', '2012/05/13'),
('justinoh@gmail.com', 'JustinOH', 'Justin Oh', '15', '2', '2012/03/12'),
('stevehartz@gmail.com', 'SHartz', 'Steve Hartz', '13', '4', '2011/11/30'),
('jimyosef@gmail.com', 'JYosef', 'Jim Yosef', '14', '1', '2012/05/24');

alter table `Group`
add unique (CreatorID);

alter table `Group`
add unique (GroupName);

alter table `Group`
add unique (GroupID);
--- TBL 4
insert into `Group` 
values ('41', 'Group1', '200', '2013/08/05'),
('42', 'Group2', '201', '2013/03/24'),
('43', 'Group3', '202', '2013/02/11'),
('44','Group4', '203', '2013/10/28'),
('45', 'Group5', '204', '2013/09/03');
--- TBL 5
insert into GroupAccount
values ('43', '31', '2013/02/16'),
('45', '33', '2013/09/07'),
('41', '32', '2013/08/11'),
('44', '35', '2013/11/03'),
('42', '34', '2013/03/30');
--- TBL 6
insert into TypeQuestion (TypeName)
values ('Essay'), ('Multiple-Choice');
--- TBL 7
insert into categoryquestion (CategoryName)
values ('Java'), ('.NET'), ('SQL'), ('Python');
--- TBL 8
alter table question
add unique (CreatorID);

insert into Question (Content, CategoryID, TypeID, CreateDate, CreatorID)
values ('none', 1, 1, '2014-06-05', 211),
('none', 2, 1, '2014-12-01', 212),
('none', 4, 2, '2014-01-08', 213),
('none', 3, 1, '2014-06-17', 214),
('none', 1, 2, '2014-07-27', 215);
--- TBL 9
insert into Answer (Content, QuestionID, isCorrect)
values ('...', 8, 'True'),
('...', 6, 'True'),
('...', 9, 'False'),
('...', 10, 'True'),
('...', 7, 'False');

--- TBL 10
alter table Exam
add unique (`Code`);

alter table Exam
add unique (CreatorID);

insert into Exam (`Code`, Title, CategoryID, Duration, CreateDate, CreatorID)
values ('221', '...', '1', '01:30:00', '2015/08/23', '232'),
('222', '...', '1', '01:30:00', '2015/12/30', '231'),
('223', '...', '1', '01:30:00', '2015/02/12', '235'),
('224', '...', '1', '01:30:00', '2015/09/13', '234'),
('225', '...', '1', '01:30:00', '2015/08/01', '233');

--- TBL 11
insert into ExamQuestion
values (1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);



