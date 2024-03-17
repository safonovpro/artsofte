select *, row_number() over (partition by client_id order by payment_date) as state_number
from payments_all_in_one
