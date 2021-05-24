use assignment1;

--- Question 1
drop procedure if exists GetEmployee;
delimiter $$
	create procedure GetEmployee (in DeptName varchar(20), out AllEmp varchar(30))
		begin
			select a.Fullname into AllEmp
            from `Account` a
            inner join Department b on a.DepartmentID = b.DepartmentID
            where DepartmentName = DeptName;
        end$$
delimiter ;

set @Employees = '';
select @Employees;
call GetEmployee ('Sales', @Employees);

--- Question 2
drop procedure if exists AccountQuantity
delimiter $$
	create procedure AccountQuantity()
		begin
			select a.GroupID, b.GroupName, count(a.AccountID)
            from GroupAccount a
            inner join `Group` b on a.GroupID = b.GroupID
            group by a.GroupID;
		end$$
delimiter ;

call AccountQuantity();

--- Question 3
drop procedure if exists QuestionQuantity;
delimiter $$
	create procedure QuestionQuantity()
		begin
			select b.*, a.CreateDate, count(a.TypeID)
            from Question a
            inner join TypeQuestion b on a.TypeID = b.TypeID
            group by b.TypeID
            having Month(a.CreateDate) = Month(curdate());
		end$$
delimiter ;

call QuestionQuantity();

--- Question 4, 5
drop procedure if exists MostQuestion;
delimiter $$
	create procedure MostQuestion()
		begin 
			select a.TypeID, b.TypeName, count(a.TypeID)
            from Question a
            inner join typequestion b on a.TypeID = b.TypeID
            group by TypeID
            having count(a.TypeID) = (select count(TypeID) from Question group by TypeID order by count(TypeID) desc limit 1);
		end$$
delimiter ;

call MostQuestion();

--- Question 6
drop procedure if exists GroupUsername;
delimiter $$
	create procedure GroupUsername(in Input varchar(30))
		begin
			select *
            from `Group`
            where GroupName = Input;
            select *
            from `Account`
            where Username = Input;
		end$$
delimiter ;

call GroupUsername('Group1');

--- Question 8
drop procedure if exists LongestContent;
delimiter $$
	create procedure LongestContent (in QuestionType enum('Essay', 'Multiple-Choice'))
		begin
			select a.TypeID, a.TypeName, b.QuestionID, b.Content, char_length(b.Content)
            from TypeQuestion a
            right join Question b on a.TypeID = b.TypeID
            group by a.TypeID
            having char_length(b.Content) = (select char_length(Content) from Question order by char_length(Content) desc limit 1)
            and a.TypeName = QuestionType;
		end$$
delimiter ;

call LongestContent('Multiple-Choice');

--- Question 9
drop procedure if exists DeleteExam;
delimiter $$
	create procedure DeleteExam (in ID int)
		begin 
			delete from Exam
            where ExamID = ID;
		end$$
delimiter ;

call DeleteExam('5');

--- Question 10
