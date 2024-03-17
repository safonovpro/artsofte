with df as (
    select
        date_trunc('month', payment_date) as month,
        sum(value) as total
    from payments_all_in_one
    group by month
    order by month
) select
    concat(dateName('month', month), ' ', toString(toYear(month))) as period,
    total as revenue_by_month,
    sum(total) over (rows between unbounded preceding and current row) as revenue_cumulative
from df;