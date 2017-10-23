CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `user_rights` tinyint(4) NOT NULL DEFAULT '1',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `ingr_amt_type` (
  `ingr_amt_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingr_amt_typ_eng` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ingr_amt_typ_esp` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `metric` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingr_amt_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `ingr_type` (
  `ingr_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingr_type_name` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ingr_type_id`),
  UNIQUE KEY `ingr_type_name_UNIQUE` (`ingr_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `ingr` (
  `ingr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingr_name` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ingr_name_esp` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingr_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ingr_id`),
  UNIQUE KEY `ingr_name_UNIQUE` (`ingr_name`),
  KEY `fk_ingr_name_esp_1_idx` (`ingr_type_id`),
  CONSTRAINT `fk_ingr_name_esp_1` FOREIGN KEY (`ingr_type_id`) REFERENCES `ingr_type` (`ingr_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `recipe_name` (
  `recipe_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `recipe_description` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `recipe_minutes` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ratings` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`recipe_name_id`),
  KEY `fk_recipe_name_1_idx` (`user_id`),
  CONSTRAINT `fk_recipe_name_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE IF NOT EXISTS `recipe_directions` (
  `recipe_directions_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_name_id` int(11) NOT NULL,
  `dir_num_eng` smallint(6) DEFAULT NULL,
  `dir_eng` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dir_num_esp` smallint(6) DEFAULT NULL,
  `dir_esp` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dir_minutes` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`recipe_directions_id`),
  KEY `fk_recipe_directions_1_idx` (`recipe_name_id`),
  CONSTRAINT `fk_recipe_directions_1` FOREIGN KEY (`recipe_name_id`) REFERENCES `recipe_name` (`recipe_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `recipe_ingr` (
  `recipe_ingr_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_name_id` int(11) DEFAULT NULL,
  `ingr_id` int(11) DEFAULT NULL,
  `ingr_amt` decimal(10,0) DEFAULT NULL,
  `ingr_amt_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`recipe_ingr_id`),
  KEY `fk_recipe_ingr_1_idx` (`recipe_name_id`),
  KEY `fk_recipe_ingr_2_idx` (`ingr_amt_type_id`),
  KEY `fk_recipe_ingr_3_idx` (`ingr_id`),
  CONSTRAINT `fk_recipe_ingr_1` FOREIGN KEY (`recipe_name_id`) REFERENCES `recipe_name` (`recipe_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_ingr_2` FOREIGN KEY (`ingr_amt_type_id`) REFERENCES `ingr_amt_type` (`ingr_amt_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_ingr_3` FOREIGN KEY (`ingr_id`) REFERENCES `ingr` (`ingr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `recipe_meal_type` (
  `recipe_name_id` int(11) NOT NULL,
  `meal_type_id` int(11) NOT NULL,
  UNIQUE KEY `recipe_meal_type_pk` (`recipe_name_id`,`meal_type_id`),
  KEY `fk_recipe_meal_type_1_idx` (`recipe_name_id`),
  KEY `fk_recipe_meal_type_2_idx` (`meal_type_id`),
  CONSTRAINT `fk_recipe_meal_type_1` FOREIGN KEY (`recipe_name_id`) REFERENCES `recipe_name` (`recipe_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_meal_type_2` FOREIGN KEY (`meal_type_id`) REFERENCES `meal_type` (`meal_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `user_favorites` (
  `recipe_name_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `index1` (`recipe_name_id`,`user_id`),
  KEY `fk_user_favorites_1_idx` (`user_id`),
  CONSTRAINT `fk_user_favorites_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_favorites_2` FOREIGN KEY (`recipe_name_id`) REFERENCES `recipe_name` (`recipe_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
