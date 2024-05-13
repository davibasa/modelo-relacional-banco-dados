-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'submission'
-- 
-- ---

DROP TABLE IF EXISTS `submission`;
		
CREATE TABLE `submission` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_submissionFields` INTEGER NULL DEFAULT NULL,
  `id_forms` INTEGER NULL DEFAULT NULL,
  `dateCreated` DATETIME NULL DEFAULT NULL,
  `dateUpdated` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'submissionFields'
-- 
-- ---

DROP TABLE IF EXISTS `submissionFields`;
		
CREATE TABLE `submissionFields` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_questions` INTEGER NULL DEFAULT NULL,
  `value` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'questions'
-- 
-- ---

DROP TABLE IF EXISTS `questions`;
		
CREATE TABLE `questions` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_forms` INTEGER NULL DEFAULT NULL,
  `question` MEDIUMTEXT NULL DEFAULT NULL,
  `typeQuestion` MEDIUMTEXT NULL DEFAULT NULL,
  `isRequired` BIGINT NULL DEFAULT NULL,
  `label` VARCHAR NULL DEFAULT NULL,
  `placeholder` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'optionsQuestion'
-- 
-- ---

DROP TABLE IF EXISTS `optionsQuestion`;
		
CREATE TABLE `optionsQuestion` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_questions` INTEGER NULL DEFAULT NULL,
  `option` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'forms'
-- 
-- ---

DROP TABLE IF EXISTS `forms`;
		
CREATE TABLE `forms` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `title` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'users'
-- 
-- ---

DROP TABLE IF EXISTS `users`;
		
CREATE TABLE `users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `user` VARCHAR NULL DEFAULT NULL,
  `email` VARCHAR NULL DEFAULT NULL,
  `pskHash` VARCHAR NULL DEFAULT NULL,
  `pskSalt` VARCHAR NULL DEFAULT NULL,
  `dateCreated` DATETIME NULL DEFAULT NULL,
  `dateUpdated` DATETIME NULL DEFAULT NULL,
  `tokenCreated` DATETIME NULL DEFAULT NULL,
  `tokenExpired` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `submission` ADD FOREIGN KEY (id_submissionFields) REFERENCES `submissionFields` (`id`);
ALTER TABLE `submission` ADD FOREIGN KEY (id_forms) REFERENCES `forms` (`id`);
ALTER TABLE `submissionFields` ADD FOREIGN KEY (id_questions) REFERENCES `questions` (`id`);
ALTER TABLE `questions` ADD FOREIGN KEY (id_forms) REFERENCES `forms` (`id`);
ALTER TABLE `optionsQuestion` ADD FOREIGN KEY (id_questions) REFERENCES `questions` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `submission` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `submissionFields` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `optionsQuestion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `forms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `submission` (`id`,`id_submissionFields`,`id_forms`,`dateCreated`,`dateUpdated`) VALUES
-- ('','','','','');
-- INSERT INTO `submissionFields` (`id`,`id_questions`,`value`) VALUES
-- ('','','');
-- INSERT INTO `questions` (`id`,`id_forms`,`question`,`typeQuestion`,`isRequired`,`label`,`placeholder`) VALUES
-- ('','','','','','','');
-- INSERT INTO `optionsQuestion` (`id`,`id_questions`,`option`) VALUES
-- ('','','');
-- INSERT INTO `forms` (`id`,`title`) VALUES
-- ('','');
-- INSERT INTO `users` (`id`,`user`,`email`,`pskHash`,`pskSalt`,`dateCreated`,`dateUpdated`,`tokenCreated`,`tokenExpired`) VALUES
-- ('','','','','','','','','');
