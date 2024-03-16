with df as (
    select
        date_trunc('month', payment_date) as month,
        sum("value") as total
    from payments
    group by month
    order by month
) select
    to_char(month, 'TMMonth') || ' ' || to_char(month, 'YYYY') as period,
    total as revenue_by_month,
    sum(total) over (rows between unbounded preceding and current row)
from df;

