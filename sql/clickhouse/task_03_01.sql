select
    id, value, client_id, client_name, payment_date, manager_name, manager_email, manager_department,
    if (state_number = 1, 'Новый', 'Действующий') as client_state
from (
    select *, row_number() over (partition by client_id order by payment_date) as state_number
    from payments_all_in_one
);