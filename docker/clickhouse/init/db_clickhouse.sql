create table payments_all_in_one (
     id           UInt64,
     value        Float64,
     client_id    UInt64,
     client_name  String,
     payment_date Date,
     manager_name Nullable(String),
     manager_email Nullable(String),
     manager_department Nullable(String)
)
as postgresql('psql', 'artsofte', 'payments_all_in_one', 'artsofte', 'artsofte_password');
