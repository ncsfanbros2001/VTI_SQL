
--- Question 1
select a.Fullname, a.departmentid, b.departmentname
from `Account` a
left join Department b on a.DepartmentID = b.DepartmentID;
select * from department;

--- Question 2
select * from `Account` where CreateDate > 2010-12-20;

--- Question 3
select a.Fullname, b.PositionName
from `Account` a
left join `Position` b on a.PositionID = b.PositionID
where b.PositionName = 'Dev';

--- Question 4
select a.DepartmentName, count(b.departmentID)
from Department a
right join `Account` b on a.DepartmentID = b.DepartmentID
group by a.DepartmentName
having count(b.departmentID) > 3;

--- Question 5
SELECT 
 a.ExamID,
 a.QuestionID,
 b.Content,
 count(*) AS total
FROM 
 examquestion a
 INNER JOIN question b ON a.QuestionID = b.QuestionID
GROUP BY 
 a.QuestionID
HAVING 
 count(*) = (SELECT count(*) FROM examquestion GROUP BY QuestionID ORDER BY count(*) DESC limit 1);
 
--- Question 6
select a.CategoryName, count(b.QuestionID)
from CategoryQuestion a
left join Question b on a.CategoryID = b.CategoryID
group by a.CategoryName;

--- Question 7
select QuestionID, count(QuestionID) from ExamQuestion group by QuestionID;

--- Question 8
SELECT 
 a.QuestionID,
 a.Content,
 count(b.AnswerID) AS total_answer
FROM 
 question a
 LEFT JOIN answer b ON a.QuestionID = b.QuestionID
GROUP BY 
 a.QuestionID
HAVING 
 total_answer = (SELECT count(AnswerID) FROM answer GROUP BY QuestionID ORDER BY count(AnswerID) DESC limit 1);

--- Question 9
select GroupID, count(AccountID)
from GroupAccount
group by GroupID;

--- Question 10
select a.PositionID, a.PositionName, count(b.PositionID) as Quantity
from `Position` a
left join `Account` b on a.PositionID = b.PositionID
group by a.PositionID
having Quantity = (SELECT count(PositionID) FROM account GROUP BY PositionID ORDER BY count(PositionID) ASC limit 1);

--- Question 11
SELECT
 b.DepartmentName,
 c.PositionName,
 count(*) AS total
FROM
 account a 
 LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
 LEFT JOIN position c ON a.PositionID = c.PositionID
GROUP BY
 b.DepartmentName, c.PositionName
ORDER BY
 b.DepartmentName, c.PositionName;

--- Question 12
select a.*, b.TypeName, c.Content, c.isCorrect as Answer
from Question a
left join TypeQuestion b on a.TypeID = b.TypeID
left join Answer c on a.QuestionID = c.QuestionID
group by a.QuestionID;

--- Question 13
select a.*, count(b.TypeID)
from TypeQuestion a
right join Question b on a.TypeID = b.TypeID
group by a.TypeID;

--- Question 14 & 15
select a.GroupID, a.GroupName, count(b.AccountID)
from `Group` a
left join GroupAccount b on a.GroupID = b.GroupID
group by a.GroupID
having count(b.AccountID) = 0;

--- Question 16
select a.QuestionID, a.Content, count(b.AnswerID)
from Question a
left join Answer b on a.QuestionID = b.QuestionID
group by a.QuestionID
having count(b.AnswerID) = 0;

--- Question 17
select b.*
from groupaccount a
left join `account` b on a.AccountID = b.AccountID
where a.groupID = 41
union
select b.*
from groupaccount a
left join `account` b on a.AccountID = b.AccountID
where a.groupID = 42;

--- Question 18
select a.GroupID, count(AccountID)
from groupaccount a
group by a.GroupID
having count(AccountID) > 5
union
select a.GroupID, count(AccountID)
from groupaccount a
group by a.GroupID
having count(AccountID) < 7;