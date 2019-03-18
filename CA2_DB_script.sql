-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema CA2_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CA2_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CA2_DB` DEFAULT CHARACTER SET latin1 ;
USE `CA2_DB` ;

-- -----------------------------------------------------
-- Table `CA2_DB`.`CITYINFO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`CITYINFO` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`CITYINFO` (
  `zip` INT(11) NOT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`zip`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`address` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `additionalinfo` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `CITYINFO_zip` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_address_CITYINFO_zip` (`CITYINFO_zip` ASC),
  CONSTRAINT `FK_address_CITYINFO_zip`
    FOREIGN KEY (`CITYINFO_zip`)
    REFERENCES `CA2_DB`.`CITYINFO` (`zip`))
ENGINE = InnoDB
AUTO_INCREMENT = 490
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`hobby`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`hobby` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`hobby` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`person` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`person` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `ADDRESS_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_person_ADDRESS_id` (`ADDRESS_id` ASC),
  CONSTRAINT `FK_person_ADDRESS_id`
    FOREIGN KEY (`ADDRESS_id`)
    REFERENCES `CA2_DB`.`address` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 369
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`person_has_hobby`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`person_has_hobby` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`person_has_hobby` (
  `hobby_id` INT(11) NOT NULL,
  `person_id` INT(11) NOT NULL,
  PRIMARY KEY (`hobby_id`, `person_id`),
  INDEX `FK_person_has_hobby_person_id` (`person_id` ASC),
  CONSTRAINT `FK_person_has_hobby_hobby_id`
    FOREIGN KEY (`hobby_id`)
    REFERENCES `CA2_DB`.`hobby` (`id`),
  CONSTRAINT `FK_person_has_hobby_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `CA2_DB`.`person` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`phone` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`phone` (
  `pnumber` INT(11) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `person_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pnumber`),
  INDEX `FK_phone_person_id` (`person_id` ASC),
  CONSTRAINT `FK_phone_person_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `CA2_DB`.`person` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
