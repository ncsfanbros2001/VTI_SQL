use assignment1;

--- Question 1
delimiter $$
	create trigger OneYear
    before insert on `Group`
    for each row
    begin 
		if day(now()) - day(new.`CreateDate`)  < 365 then
			signal sqlstate '54321'
            set message_text = 'Inappropriate Data';
		end if;
	end$$
delimiter ;

insert into `Group`
values (47, 'Group7', 206, '2013-12-05');

--- Question 2
delimiter $$
	create trigger BlockAdd
    before insert on `Account`
    for each row
    begin
		if new.departmentID = 11 then 
			signal sqlstate '10000'
            set message_text = 'Cant add more account to Sales department';
		end if;
	end$$
delimiter ;

insert into `Account` (Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
values ('bishu@gmail.com', 'Bishu', 'Andrew Campbell', '11', '2', '2012/05/30');

--- Question 3
delimiter $$
	create trigger UserLimit
    before insert on groupaccount
    for each row
    begin
		if (select count(AccountID) from groupaccount group by groupid) = 5 then
			signal sqlstate '20000'
            set message_text = 'Maximum user reached';
		end if;
	end$$
delimiter ;

--- Question 4
delimiter $$
	create trigger QuestionLimit
    before insert on examquestion
    for each row
    begin
		if (select count(QuestionID) from ExamQuestion group by ExamID) = 10 then
			signal sqlstate '20001'
            set message_text = 'Maximum question reached';
		end if;
	end$$
delimiter ;

--- Question 5
delimiter $$
	create trigger BlockDelete
    before delete on `Account`
    for each row
    begin
		if old.Email = 'admin@gmail.com' then
			signal sqlstate '30000'
            set message_text = 'Cant delete this Account';
		end if;
	end$$
delimiter ;

--- Question 6
delimiter $$
	create trigger DefaultDepartment
    before insert on `Account`
    for each row
    begin
		if new.departmentID = null then
			set new.departmentID = '16';
		end if;
	end$$
delimiter ;
        
--- Question 7
delimiter $$
	create trigger CreateLimit
    before insert on Answer
    for each row
    begin 
		if (select isCorrect, count(isCorrect) from Answer group by AnswerID having isCorrect = 'True') = 2 then 
			signal sqlstate '30003'
            set message_text = 'Cant add more correct answer';
		end if;
	end$$
delimiter ;
        
--- Question 8
alter table `Account`
add Gender varchar(5);
delimiter $$
	create trigger AlterGender
    before insert on `Account`
    for each row
    begin
		if new.Gender = 'Male' then
			set new.Gender = 'M';
		end if;
        if new.Gender = 'Female' then
			set new.Gender = 'F';
		end if;
        if new.Gender = 'Unknown' then
			set new.Gender = 'U';
		end if;
	end$$
delimiter ;

--- Question 9
delimiter $$
	create trigger BlockDelete2
    before delete on Exam
    for each row
    begin
		if day(sysdate()) - day(old.CreateDate) <= 2 then
			signal sqlstate '30001'
            set message_text = 'Cant delete this Exam yet';
		end if;
	end$$
delimiter ;

--- Question 12
select *, 
case 
	when Duration < 30 then "Short time"
    when Duration between 30 and 60 then "Medium time"
    when Duration > 60 then "Long time"
end as DurationDescription
from Exam;

--- Question 13
select GroupID, count(AccountID),
case 
	when count(AccountID) < 5 then 'few'
    when count(AccountID) between 5 and 20 then 'normal'
    when count(AccountID) > 20 then 'high'
end as the_number_user_amount
from groupaccount
group by GroupID;

--- Question 14
/*delimiter $$
	create procedure UserQuantity()
		begin
			select DepartmentID, count(DepartmentID)
            from `Account`
            group by DepartmentID;
            if count(DepartmentID) = 0 then 
				set count(DepartmentID) = "Không có User";
			end if;
		end$$
delimiter ;*/
