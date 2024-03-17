select
    id, value, client_id, client_name, payment_date, manager_name, manager_email, manager_department,
    if (state_number = 1, 'Новый', 'Действующий') as client_state
from {{ ref('part_01') }}
