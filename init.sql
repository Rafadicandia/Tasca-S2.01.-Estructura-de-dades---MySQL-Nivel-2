-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema YouTubeLite
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema YouTubeLite
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `YouTubeLite` DEFAULT CHARACTER SET utf8 ;
USE `YouTubeLite` ;

-- -----------------------------------------------------
-- Table `YouTubeLite`.`Tagg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`Tagg` (
  `idTagg` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idTagg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`LikedContentByUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`LikedContentByUser` (
  `idLikedContentByUser` INT UNSIGNED NOT NULL,
  `Time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLikedContentByUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`DislikedContentByUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`DislikedContentByUser` (
  `idDislikedContentByUser` INT UNSIGNED NOT NULL,
  `Time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idDislikedContentByUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`Comentary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`Comentary` (
  `idComentary` INT NOT NULL AUTO_INCREMENT,
  `Text` VARCHAR(500) NOT NULL,
  `Time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LikedContentByUser_idLikedContentByUser` INT UNSIGNED NOT NULL,
  `DislikedContentByUser_idDislikedContentByUser` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idComentary`),
  INDEX `fk_Comentary_LikedContentByUser1_idx` (`LikedContentByUser_idLikedContentByUser` ASC) VISIBLE,
  INDEX `fk_Comentary_DislikedContentByUser1_idx` (`DislikedContentByUser_idDislikedContentByUser` ASC) VISIBLE,
  CONSTRAINT `fk_Comentary_LikedContentByUser1`
    FOREIGN KEY (`LikedContentByUser_idLikedContentByUser`)
    REFERENCES `YouTubeLite`.`LikedContentByUser` (`idLikedContentByUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentary_DislikedContentByUser1`
    FOREIGN KEY (`DislikedContentByUser_idDislikedContentByUser`)
    REFERENCES `YouTubeLite`.`DislikedContentByUser` (`idDislikedContentByUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`Video` (
  `idVideo` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(200) NULL,
  `Size` INT NOT NULL,
  `VideoOriginalName` VARCHAR(45) NOT NULL,
  `Duration` TIME NOT NULL,
  `Thumbnail` BLOB NULL,
  `ReproductionCount` INT NOT NULL,
  `Likes` INT NULL,
  `Dislikes` INT NULL,
  `IsPublic` BINARY(2) NULL,
  `IsHiden` BINARY(2) NULL,
  `IsPrivate` BINARY(2) NULL,
  `PublishTime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User_idUser` INT NOT NULL,
  `Tagg_idTagg` INT NOT NULL,
  `Comentary_idComentary` INT NOT NULL,
  `DislikedContentByUser_idDislikedContentByUser` INT UNSIGNED NOT NULL,
  `LikedContentByUser_idLikedContentByUser` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idVideo`),
  INDEX `fk_Video_Tagg1_idx` (`Tagg_idTagg` ASC) VISIBLE,
  INDEX `fk_Video_Comentary1_idx` (`Comentary_idComentary` ASC) VISIBLE,
  INDEX `fk_Video_DislikedContentByUser1_idx` (`DislikedContentByUser_idDislikedContentByUser` ASC) VISIBLE,
  INDEX `fk_Video_LikedContentByUser1_idx` (`LikedContentByUser_idLikedContentByUser` ASC) VISIBLE,
  CONSTRAINT `fk_Video_Tagg1`
    FOREIGN KEY (`Tagg_idTagg`)
    REFERENCES `YouTubeLite`.`Tagg` (`idTagg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Video_Comentary1`
    FOREIGN KEY (`Comentary_idComentary`)
    REFERENCES `YouTubeLite`.`Comentary` (`idComentary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Video_DislikedContentByUser1`
    FOREIGN KEY (`DislikedContentByUser_idDislikedContentByUser`)
    REFERENCES `YouTubeLite`.`DislikedContentByUser` (`idDislikedContentByUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Video_LikedContentByUser1`
    FOREIGN KEY (`LikedContentByUser_idLikedContentByUser`)
    REFERENCES `YouTubeLite`.`LikedContentByUser` (`idLikedContentByUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`PlayList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`PlayList` (
  `idPlayList` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PlayListcol` VARCHAR(45) NULL,
  `IsPublic` BINARY(2) NOT NULL,
  `Video_idVideo` INT NOT NULL,
  PRIMARY KEY (`idPlayList`),
  INDEX `fk_PlayList_Video1_idx` (`Video_idVideo` ASC) VISIBLE,
  CONSTRAINT `fk_PlayList_Video1`
    FOREIGN KEY (`Video_idVideo`)
    REFERENCES `YouTubeLite`.`Video` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`SubsribedChannels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`SubsribedChannels` (
  `idSubsribedChannels` INT NOT NULL,
  PRIMARY KEY (`idSubsribedChannels`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`Chanel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`Chanel` (
  `idChanel` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(200) NULL,
  `CreationTime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `User_idUser` INT NOT NULL,
  `Video_idVideo` INT NOT NULL,
  `SubsribedChannels_idSubsribedChannels` INT NOT NULL,
  PRIMARY KEY (`idChanel`),
  INDEX `fk_Chanel_Video1_idx` (`Video_idVideo` ASC) VISIBLE,
  INDEX `fk_Chanel_SubsribedChannels1_idx` (`SubsribedChannels_idSubsribedChannels` ASC) VISIBLE,
  CONSTRAINT `fk_Chanel_Video1`
    FOREIGN KEY (`Video_idVideo`)
    REFERENCES `YouTubeLite`.`Video` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chanel_SubsribedChannels1`
    FOREIGN KEY (`SubsribedChannels_idSubsribedChannels`)
    REFERENCES `YouTubeLite`.`SubsribedChannels` (`idSubsribedChannels`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `YouTubeLite`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `YouTubeLite`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `Pasword` VARCHAR(45) NOT NULL,
  `BirthDate` DATETIME NOT NULL,
  `Sex` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NOT NULL,
  `PostalCode` VARCHAR(45) NOT NULL,
  `PlayList_idPlayList` INT NOT NULL,
  `Video_idVideo` INT NOT NULL,
  `Chanel_idChanel` INT NOT NULL,
  `SubsribedChannels_idSubsribedChannels` INT NOT NULL,
  `DislikedContentByUser_idDislikedContentByUser` INT UNSIGNED NOT NULL,
  `LikedContentByUser_idLikedContentByUser` INT UNSIGNED NOT NULL,
  `Comentary_idComentary` INT NOT NULL,
  PRIMARY KEY (`idUser`, `PlayList_idPlayList`),
  INDEX `fk_User_PlayList1_idx` (`PlayList_idPlayList` ASC) VISIBLE,
  INDEX `fk_User_Video1_idx` (`Video_idVideo` ASC) VISIBLE,
  INDEX `fk_User_Chanel1_idx` (`Chanel_idChanel` ASC) VISIBLE,
  INDEX `fk_User_SubsribedChannels1_idx` (`SubsribedChannels_idSubsribedChannels` ASC) VISIBLE,
  INDEX `fk_User_DislikedContentByUser1_idx` (`DislikedContentByUser_idDislikedContentByUser` ASC) VISIBLE,
  INDEX `fk_User_LikedContentByUser1_idx` (`LikedContentByUser_idLikedContentByUser` ASC) VISIBLE,
  INDEX `fk_User_Comentary1_idx` (`Comentary_idComentary` ASC) VISIBLE,
  CONSTRAINT `fk_User_PlayList1`
    FOREIGN KEY (`PlayList_idPlayList`)
    REFERENCES `YouTubeLite`.`PlayList` (`idPlayList`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Video1`
    FOREIGN KEY (`Video_idVideo`)
    REFERENCES `YouTubeLite`.`Video` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Chanel1`
    FOREIGN KEY (`Chanel_idChanel`)
    REFERENCES `YouTubeLite`.`Chanel` (`idChanel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_SubsribedChannels1`
    FOREIGN KEY (`SubsribedChannels_idSubsribedChannels`)
    REFERENCES `YouTubeLite`.`SubsribedChannels` (`idSubsribedChannels`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_DislikedContentByUser1`
    FOREIGN KEY (`DislikedContentByUser_idDislikedContentByUser`)
    REFERENCES `YouTubeLite`.`DislikedContentByUser` (`idDislikedContentByUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_LikedContentByUser1`
    FOREIGN KEY (`LikedContentByUser_idLikedContentByUser`)
    REFERENCES `YouTubeLite`.`LikedContentByUser` (`idLikedContentByUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_Comentary1`
    FOREIGN KEY (`Comentary_idComentary`)
    REFERENCES `YouTubeLite`.`Comentary` (`idComentary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;