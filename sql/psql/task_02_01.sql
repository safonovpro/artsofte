with md as (
    select
        substring(email for 1) || substring(email from 3) as email,
        case
            when department is null then 'Отдел не определен'
            else department
        end as department
    from manager_departments
)
select md.department, sum(p.value) as total from payments p
left join md on md.email = p.manager_email
group by md.department
order by total desc;
