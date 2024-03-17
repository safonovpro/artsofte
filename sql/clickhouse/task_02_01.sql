select manager_department, sum(p.value) as total from payments_all_in_one p
group by manager_department
order by total desc;
