select
    distinct on(client_id)
    client_name, payment_date, value
from payments_all_in_one
where date_trunc('month', payment_date) = '2023-01-01'
order by client_id, value desc
