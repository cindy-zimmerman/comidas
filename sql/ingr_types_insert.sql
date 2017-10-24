/*
-- Query: SELECT * FROM meals.ingr_type
LIMIT 0, 1000

-- Date: 2017-10-23 12:15
*/
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (5,'Canned/Jarred');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (7,'Deli/Prepared');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (8,'Eggs and Dairy');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (2,'Meat');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (3,'Produce');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (4,'Seafood');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (1,'Spices');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (6,'Sweeteners/Baking');
INSERT INTO `ingr_type` (`ingr_type_id`,`ingr_type_name`) VALUES (9,'Vinegar and Oil');

INSERT INTO `ingr_amt_type` (`ingr_amt_type_id`,`ingr_amt_typ_eng`, `ingr_amt_typ_esp` ) VALUES (1,'tsp','cucharadita');
INSERT INTO `ingr_amt_type` (`ingr_amt_type_id`,`ingr_amt_typ_eng`, `ingr_amt_typ_esp` ) VALUES (2,'tbl','cucharada');
INSERT INTO `ingr_amt_type` (`ingr_amt_type_id`,`ingr_amt_typ_eng`, `ingr_amt_typ_esp` ) VALUES (3,'cup','vaso');
INSERT INTO `ingr_amt_type` (`ingr_amt_type_id`,`ingr_amt_typ_eng`, `ingr_amt_typ_esp` ) VALUES (4,'lb','libra');
INSERT INTO `ingr_amt_type` (`ingr_amt_type_id`,`ingr_amt_typ_eng`, `ingr_amt_typ_esp` ) VALUES (5,'kilo','kilo');


INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (1,'breakfast');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (2,'lunch');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (3,'dinner');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (4,'dessert');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (5,'snack');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (6,'kosher');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (7,'vegan');
INSERT INTO `meal_type` (`meal_type_id`,`meal_type_name`) VALUES (8,'halal');
