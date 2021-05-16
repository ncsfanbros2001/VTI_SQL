use assignment1extra;

--- Question 1
insert into Trainee (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes, VTI_Account)
values ('Robert Downey Jr', '1992-01-16', 'Male', '10', '14', '29', 'Class001', 'Unknown_content', 'rdj@vti.edu.vn'),
('Chris Hemsworth', '1993-03-05', 'Male', '1', '15', '44', 'Class001', 'Unknown_content', 'ch@vti.edu.vn'),
('Chris Evans', '1993-09-28', 'Male', '3', '8', '36', 'Class001', 'Unknown_content', 'ce@vti.edu.vn'),
('Scarlet Johansson', '1996-04-22', 'Female', '16', '14', '15', 'Class002', 'Unknown_content', 'sj@vti.edu.vn'),
('Jeremy Renner', '1997-06-09', 'Male', '15', '20', '19', 'Class002', 'Unknown_content', 'jr@vti.edu.vn'),
('Mark Ruffalo', '1997-08-21', 'Male', '2', '8', '35', 'Class002', 'Unknown_content', 'mr@vti.edu.vn'),
('Emily Vancamp', '1998-04-09', 'Female', '11', '19', '38', 'Class003', 'Unknown_content', 'ev@vti.edu.vn'),
('Evangeline Lilly', '1999-08-02', 'Female', '14', '0', '36', 'Class003', 'Unknown_content', 'el@vti.edu.vn'),
('Zoe Saldana', '1999-12-20', 'Female', '18', '13', '31', 'Class003', 'Unknown_content', 'zs@vti.edu.vn'),
('Tom Hiddleston', '2000-07-24', 'Male', '18', '6', '34', 'Class003', 'Unknown_content', 'th@vti.edu.vn');

--- Question 3
select max(char_length(Full_name)) from trainee;

select Full_name from trainee
where char_length(Full_name) = 17;

--- Question 4
SELECT Full_name,
CASE
    WHEN ET_IQ + ET_Gmath >= 20 and ET_IQ >= 8 and ET_Gmath >= 8 and ET_English>=18 THEN 'ET'
END AS Result
FROM Trainee
where ET_IQ + ET_Gmath >= 20 and ET_IQ >= 8 and ET_Gmath >= 8 and ET_English>=18;

--- Question 5
delete from trainee
where TraineeID = 3;

--- Question 6
update trainee
set Class = 'Class2'
where TraineeID = 5;
