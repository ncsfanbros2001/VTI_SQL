
--- Question 1
create table if not exists Department (
	Department_Number 	int auto_increment primary key,
	Department_Name 	varchar(20)
);

create table if not exists Employee_Table (
	Employee_Number 	int auto_increment primary key,
    Employee_Name 		varchar(20),
    Department_Number 	int,
    foreign key (Department_Number) references Department(Department_Number)
);

create table if not exists Employee_Skill_Table (
	Employee_Number		int,
    foreign key (Employee_Number) references Employee_Table(Employee_Number),
    Skill_Code 			varchar(15) primary key,
    Date_Registered		date
);

--- Question 2
insert into department (Department_Name)
values ('Management'), 
('Human Resources'),
('Financial'),
('Development'),
('Technical Support');

insert into Employee_Table (Employee_Name, Department_Number)
values ('James Hampson', '1'),
('Bridget Jefferbrop', '2'),
('Albin Lee', '2'),
('Gary Cash', '2'),
('Zachariah Beasley', '3'),
('Maxwell Scott', '3'),
('Amber Terrell', '4'),
('Adrianna Denzil', '4'),
('Trevor Lachlan', '4'),
('Randall Springboot', '5'),
('Adrian Campbell', '3'),
('Jason Parker', '3');

insert into Employee_Skill_Table (Employee_Number, Skill_Code, Date_Registered)
values ('1', 'Java', '2016-02-03'),
('2', 'Bootstrap', '2016-09-05'),
('3', 'C#', '2016-10-01'),
('4', 'PHP', '2016-10-03'),
('5', 'Python', '2016-12-30'),
('6', 'SQL', '2016-04-14'),
('7', 'jQuery', '2016-06-15'),
('8', 'Ruby', '2016-09-17'),
('9', 'HTML/CSS', '2016-11-05'),
('10', 'JavaScript', '2016-12-22');

--- Question 4
SELECT 
    a.Department_Number, COUNT(a.Employee_Number), b.Department_Name
FROM
    Employee_Table a
left join department b on  a.Department_Number = b.Department_Number
GROUP BY Department_Number
HAVING COUNT(Employee_Number) > 3;

--- Question 5
SELECT 
    a.Department_Number,
    a.Department_Name,
    COUNT(b.Employee_Number)
FROM
    Department a
LEFT JOIN
    Employee_Table b ON a.Department_Number = b.Department_Number
GROUP BY a.Department_Number;

--- Question 6
SELECT DISTINCT
    a.Employee_Number, b.Employee_Name, COUNT(a.Skill_Code)
FROM
    Employee_Skill_Table a
        LEFT JOIN
    Employee_Table b ON a.Employee_Number = b.Employee_Number
GROUP BY a.Employee_Number
HAVING COUNT(Skill_Code) > 0;