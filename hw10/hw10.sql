CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE dogs.height <= sizes.max and dogs.height > min;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child_dogs.name FROM dogs AS child_dogs, parents, dogs AS parent_dogs WHERE child_dogs.name = parents.child AND parent_dogs.name = parents.parent  ORDER BY parent_dogs.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT sibling_one.name AS sibling_one_name , sibling_two.name  AS sibling_two_name
      from dogs AS sibling_one, dogs AS sibling_two, parents AS parents_one, parents AS parents_two
      WHERE sibling_one.name = parents_one.child AND sibling_two.name = parents_two.child
      AND parents_one.parent = parents_two.parent AND sibling_one.name < sibling_two.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || sibling_one_name || " plus " || sibling_two_name || " have the same size: " || dog_one.size
      FROM siblings, size_of_dogs AS dog_one, size_of_dogs AS dog_two 
      WHERE sibling_one_name == dog_one.name AND sibling_two_name == dog_two.name
      AND dog_one.size = dog_two.size;

