select
    *,
    case
        when (row_number() over (partition by client_id order by payment_date)) = 1 then 'Новый'
        else 'Действующий'
    end client_state
from payments
order by id;
