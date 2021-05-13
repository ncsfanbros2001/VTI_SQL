
--- Question 2
select DepartmentName from department;

--- Question 3
select DepartmentID from department
where DepartmentName = 'Sale';

--- Question 4
SELECT MAX(char_length(FullName)) FROM account;

SELECT * FROM account WHERE char_length(FullName) = 19 AND DepartmentID = 3;

--- Question 5
SELECT MAX(char_length(FullName)) FROM account WHERE DepartmentID = 3;

SELECT * FROM account WHERE  DepartmentID = 3 AND char_length(FullName) = 17;

--- Question 6
select GroupName from `Group`
where CreateDate < '2019-12-20';                                     

--- Question 7
SELECT QuestionID FROM  answer GROUP BY QuestionID HAVING count(*) >= 4;

--- Question 8
select ExamID from Exam
where Duration > '1:00:00' and CreateDate < '2019-12-20';

--- Question 9
select * from `Group`
order by CreateDate desc
limit 5;

--- Question 10
select count(departmentID) from `Account`
where departmentID = 2;

--- Question 11
select Fullname from `Account`
where Fullname like 'D%' and '%o';

--- Question 12
delete from exam
where CreateDate < '2019-12-20';

--- Question 13
delete from question
where Content like 'câu hỏi%';

--- Question 14
update `Account`
set Fullname = "Nguyễn Bá Lộc", Email = "loc.nguyenba@vti.com.vn"
where id = 5;

--- Question 15
update `Account`
set id = 4
where id = 5;