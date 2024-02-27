# База данных

## Описание 

База данных содержит информацию об инвестидеях

## Диаграмма


```plantuml
@startuml

skinparam linetype ortho

entity grouth_factors 
entity invest_ideas
entity securities
' entity users

grouth_factors }|--|{ invest_ideas
securities --|{ invest_ideas

@enduml
```