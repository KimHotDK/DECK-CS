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
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `additionalinfo` VARCHAR(45) NULL DEFAULT NULL,
  `zip` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `zip_fk_idx` (`zip` ASC),
  CONSTRAINT `zip_fk`
    FOREIGN KEY (`zip`)
    REFERENCES `CA2_DB`.`CITYINFO` (`zip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`hobby`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`hobby` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`hobby` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
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
  `address_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `address_fkk_idx` (`address_id` ASC),
  CONSTRAINT `address_fkk`
    FOREIGN KEY (`address_id`)
    REFERENCES `CA2_DB`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`person_has_hobby`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`person_has_hobby` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`person_has_hobby` (
  `person_id` INT(11) NOT NULL,
  `hobby_id` INT(11) NOT NULL,
  PRIMARY KEY (`person_id`, `hobby_id`),
  INDEX `hobby_fk_idx` (`hobby_id` ASC),
  CONSTRAINT `hobby_fk`
    FOREIGN KEY (`hobby_id`)
    REFERENCES `CA2_DB`.`hobby` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `person_fk`
    FOREIGN KEY (`person_id`)
    REFERENCES `CA2_DB`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CA2_DB`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CA2_DB`.`phone` ;

CREATE TABLE IF NOT EXISTS `CA2_DB`.`phone` (
  `number` INT(11) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `person_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`number`),
  INDEX `person_fk_idx` (`person_id` ASC),
  INDEX `phone_fksdasd_idx` (`person_id` ASC),
  CONSTRAINT `phone_fksdasd`
    FOREIGN KEY (`person_id`)
    REFERENCES `CA2_DB`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

