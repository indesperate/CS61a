create table pizzas as
  select "Pizzahhh" as name, 12 as open, 15 as close union
  select "La Val's"        , 11        , 22          union
  select "Sliver"          , 11        , 20          union
  select "Cheeseboard"     , 16        , 23          union
  select "Emilia's"        , 13        , 18;

create table meals as
  select "breakfast" as meal, 11 as time union
  select "lunch"            , 13         union
  select "dinner"           , 19         union
  select "snack"            , 22;


-- Pizza places that open before 1pm in alphabetical order
create table opening as
SELECT name FROM pizzas WHERE open < 13 ORDER BY name DESC;


-- Two meals at the same place
create table double as
SELECT name, meal_first.meal, meal_second.meal
      FROM pizzas, meals AS meal_first, meals AS meal_second
      WHERE pizzas.close - pizzas.open > 6 AND
      meal_first.time < meal_second.time AND
      meal_first.time <= pizzas.close AND meal_first.time >= pizzas.open AND
      meal_second.time <= pizzas.close AND meal_second.time >= pizzas.open;


