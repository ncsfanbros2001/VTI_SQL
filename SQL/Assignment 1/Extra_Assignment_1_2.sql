drop database if exists assignment1extra;
create database if not exists assignment1extra;
use assignment1extra;
--- Exercise 1
drop table if exists Trainee;
create table if not exists Trainee
(
TraineeID 			int auto_increment primary key,
Full_Name 			varchar(20),
Birth_Date 			date,
Gender 				enum('Male', 'Female', 'Unknown'),
ET_IQ 				int check (ET_IQ > -1 and ET_IQ < 21),
ET_Gmath 			int check (ET_Gmath > -1 and ET_Gmath < 21),
ET_English 			int check (ET_English > -1 and ET_English < 51),
Training_Class 		varchar(20),
Evaluation_Notes 	text
);
alter table Trainee
add VTI_Account 	varchar(20) not null unique;



--- Exercise 2
create table ExerciseTwo
(
ID				mediumint auto_increment primary key,
`Name` 			tinytext,
`Code` 			varchar(5),
ModifiedDate 	datetime
);

--- Exercise 3
create table ExerciseThree
(
ID 			mediumint auto_increment primary key,
`Name` 		tinytext,
`Code` 		varchar(5),
Gender 		bit,
IsDeletedFlag enum('0', '1')
);


