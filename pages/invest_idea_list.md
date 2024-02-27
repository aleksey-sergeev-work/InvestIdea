# Страница списка инвестидей

## Описание 

Страница должна: 
- отображть список [инвестидей](../domain/invest_idea.md)
- предоставлять возможность вызова окна параметров фильтрации
- фильтровать список по заданным параметрам фильтрации

## Схема работы

```plantuml
@startuml

autonumber
actor Пользователь as user
participant Front as front
participant Back as back

alt 
user -> front: Открывает окно фильтра
front --> user: Отображает окно фильтра
user -> front: Открывает страницу с параметрами фильтрации, заданными пользователем
else 
user -> front: Открывает страницу с параметрами фильтрации по умолчанию
end alt

front -> back: Запрашивает список инвестидей с заданным фильтром\n(POST /api/v1/invest_ideas)
alt Список получен успешно
    back --> front: Возвращает список инвестидей
else Ошибка при формировании списка
    back --> front: Возвращает ошибку
end alt

alt Список получен успешно
    front --> user: Отображает список инвестидей
else Ошибка при получении списка
    front --> user: Отображает ошибку
end alt


@enduml
```

## Описание интерфейса

- Страница
    - Панель управления
        - Текст текущего фильтра: текст
        - Кнопка открытия диалога фильтра: кнопка с рисунком
    - Список
        - Элемент списка
            - Наименование инвестидеии: текст

*Здесь ссылка на дизайн или скрин страницы*

## Ограничения

- доступ к странице должны иметь только пользователи с [правом просмотра инвестидей](../rights/invest_idea_view.md)