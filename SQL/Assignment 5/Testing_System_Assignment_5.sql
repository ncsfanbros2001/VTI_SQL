use assignment1;

--- Question 1
create view SalesEmployees as
select b.DepartmentName, a.AccountID, a.Username, a.Fullname, a.Email, a.PositionID, a.CreateDate
from `Account` a
left join Department b on a.DepartmentID = b.DepartmentID
where b.DepartmentName = 'Sales';

select * from SalesEmployees;

--- Question 2
create view MostGroup as
select b.*, count(a.GroupID)
from GroupAccount a
left join `Account` b on a.AccountID = b.AccountID
group by b.AccountID
having count(GroupID) = (select count(GroupID) from GroupAccount group by AccountID order by count(GroupID) desc limit 1);

select * from MostGroup;

--- Question 3
create view TooLong as
select QuestionID, Content, char_length(Content)
from Question
where char_length(Content) > 300;

select * from TooLong;

--- Question 4
create view MostEmployee as
select a.*, count(b.DepartmentID)
from Department a
left join `Account` b on a.DepartmentID = b.DepartmentID
group by a.DepartmentID
having count(b.DepartmentID) = (select count(DepartmentID) from `Account` group by DepartmentID order by count(DepartmentID) desc limit 1);

--- Question 5
create view MadeByNguyen as
select *
from Question
where CreatorID like '%Nguyễn' or 'Nguyễn%';


