# Таблица Invest Ideas

## Описание 

Содержит описание [инвестидей](../../domain/invest_idea.md)

## Таблица

| Наименование поля | Тип                | Обязательность | Значение по умолчанию | Описание поля                |
|-------------------|--------------------|----------------|-----------------------|------------------------------|
| id                | последовательность | да             | следующее значение    | Идентификатор инвестидеи     |
| name              | строка             | да             |                       | Наименование                 |
| description       | строка             | да             | не задано             | Описание                     |
| buy_date          | дата               | да             | сегодня               | Рекомендованная дата покупки |
| buy_rate          | денежный           | да             | 0                     | Рекомендованная цена покупки |
| sell_date         | дата               | да             | сегодня + 1 день      | Рекомендованная дата продажи |
| sell_rate         | денежный           | да             | 0                     | Рекомендованная цена продажи |
| expiration_date   | дата               | да             | сегодня               | Срок действия инвестидеи     |
| security_id       | fk(целое64)        | да             | не задано             | Ценная бумага инвестидеи     |

# Индексы

| Поля            |
|-----------------|
| buy_date        |
| sell_date       |
| expiration_date |