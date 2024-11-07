-- MySQL Script generated by MySQL Workbench
-- Thu Oct 17 15:53:00 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `Course Number` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Credits` INT NULL,
  `Syllabus` VARCHAR(45) NULL,
  `Prerequisites` VARCHAR(45) NULL,
  PRIMARY KEY (`Course Number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `Student ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `program` VARCHAR(45) NULL,
  PRIMARY KEY (`Student ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instructor` (
  `Identification Number` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Department` VARCHAR(45) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Identification Number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enrollment` (
  `Student ID` INT NOT NULL,
  `Course Number` INT NOT NULL,
  `Grade` VARCHAR(1) NULL,
  INDEX `Student ID_idx` (`Student ID` ASC) VISIBLE,
  PRIMARY KEY (`Course Number`),
  CONSTRAINT `Student ID`
    FOREIGN KEY (`Student ID`)
    REFERENCES `mydb`.`Student` (`Student ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Course Number`
    FOREIGN KEY (`Course Number`)
    REFERENCES `mydb`.`Course` (`Course Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course Offering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course Offering` (
  `Course Number` INT NOT NULL,
  `Year` DATE NOT NULL,
  `Section Number` INT NOT NULL,
  `Instructor` INT NULL,
  `Timings` VARCHAR(45) NULL,
  `Classroom` VARCHAR(45) NULL,
  INDEX `Course Number_idx` (`Course Number` ASC) VISIBLE,
  INDEX `Instructor_idx` (`Instructor` ASC) VISIBLE,
  CONSTRAINT `Course Number`
    FOREIGN KEY (`Course Number`)
    REFERENCES `mydb`.`Course` (`Course Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Instructor`
    FOREIGN KEY (`Instructor`)
    REFERENCES `mydb`.`Instructor` (`Identification Number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
