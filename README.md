# Тестовое Artsofte

1. В папке `sql/psql` находятся решение заданий для PostgreSQL сервера;
2. В папке `sql/clickhouse` находятся решение заданий для ClickHouse сервера, но с **оговоркой** — решения на базе ClickHouse частично опираются на сервер PostgresSQL (решил эмулировать необходимость организации решения для аналитики и не тащить все проблемы, которые были в исходных данных, т.к. они решены в пункте 1);
3. В папке `dbt_project` находятся наработки связанные с [dbt](https://www.getdbt.com/) (решения в папке ``dbt_project/models/tasks``).

## Если захочется развернуть

Не забываем создать `.env` файл:

```shell
cp .env_example .env
```

Если есть все обвязки необходимые для docker:

```shell
docker compose up -d
```

Для работы dbt-проекта разворачиваем `python` окружение:

```shell
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Не забываем создать в пользовательской папке настройки для подключения к ClickHouse `~/.dbt/profiles.yml`:

```yaml
dbt_project:
  target: dev
  outputs:
    dev:
      type: clickhouse
      schema: default
      host: localhost
      port: 8123
      user: artsofte
      password: artsofte_password
      secure: False
```

Далее надо перейти в папку `dbt_project` и уже работать с dbt:

```shell
cd dbt_project/
dbt debug
```
