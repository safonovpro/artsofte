create view payments_all_in_one as
select p.*, md.department as manager_department from payments p
left join (
    select
    substring(email for 1) || substring(email from 3) as email,
    case
        when department is null then 'Отдел не определен'
        else department
    end as department
from manager_departments
) md on md.email = p.manager_email;
