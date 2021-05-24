use assignment6extra;

--- Question 1
delimiter $$
	create trigger ModuleValidation
    before insert on projects_modules
    for each row
    begin 
		if new.projects_modules.ProjectModuleDate < project.ProjectStartDate or new.Projects_Modules.ProjectModulesCompletedOn > Projects.ProjectCompletedOn then
			signal sqlstate '10001'
            set message_text = 'Invalid Data !';
		end if;
	end$$
delimiter ;

--- Question 2
use assignment1extra;
create view ET as
select full_name, 
case 
	when ET_IQ + ET_Gmath >= 20 and ET_IQ>=8 and ET_Gmath>=8 and ET_English>=18 then 'ET'
    else 'Failed'
end as Result
from trainee;