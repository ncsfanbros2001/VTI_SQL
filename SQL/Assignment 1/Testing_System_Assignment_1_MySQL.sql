create database if not exists Assignment1;

--- TBL 1
create table if not exists Department
(
DepartmentID int auto_increment primary key,
DepartmentName varchar(20)
); 
--- TBL 2
create table if not exists `Position`
(
PositionID int auto_increment primary key,
PositionName enum('Dev', 'Test', 'Scrum Master', 'PM')
);
--- TBL 3
create table if not exists `Account`
(
AccountID int auto_increment primary key,
Email varchar(30),
Username varchar(20),
Fullname varchar(20),
DepartmentID int,
PositionID int,
foreign key (DepartmentID) references Department(DepartmentID),
foreign key (PositionID) references `Position`(PositionID),
CreateDate date
);
--- TBL 4
create table if not exists `Group`
(
GroupID int primary key,
GroupName varchar(20),
CreatorID int,
CreateDate date
);
--- TBL 5
create table if not exists GroupAccount
(
GroupID int,
AccountID int,
Foreign key (GroupID) references `Group`(GroupID),
Foreign key (AccountID) references Account(AccountID),
JoinDate date
);
--- TBL 6
create table if not exists TypeQuestion
(
TypeID int auto_increment primary key,
TypeName enum('Essay', 'Multiple-Choice')
);
--- TBL 7
create table if not exists CategoryQuestion
(
CategoryID int auto_increment primary key,
CategoryName varchar(20)
);
--- TBL 8
create table if not exists Question
(
QuestionID int auto_increment primary key,
Content varchar(50),
CategoryID int,
TypeID int,
Foreign key (CategoryID) references CategoryQuestion(CategoryID),
Foreign key (TypeID) references TypeQuestion(TypeID),
CreateDate date,
CreatorID int
);
--- TBL 9
create table if not exists Answer
(
AnswerId int auto_increment primary key,
Content varchar(50),
QuestionID int,
isCorrect enum('True', 'False')
);
--- TBL 10
create table if not exists Exam
(
ExamID int auto_increment primary key,
`Code` int,
Title varchar(30),
CategoryID int,
Foreign key (CategoryID) references CategoryQuestion(CategoryID),
Duration time,
CreateDate date,
CreatorID int
);
--- TBL 11
create table if not exists ExamQuestion
(
ExamID int,
QuestionID int,
Foreign key (ExamID) references Exam(ExamID),
Foreign key (QuestionID) references Question(QuestionID)
);