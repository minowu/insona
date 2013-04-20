SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE  TABLE IF NOT EXISTS `insona`.`product_category` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cid` INT(10) UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT(3) UNSIGNED NOT NULL ,
  `createline` INT(10) UNSIGNED NOT NULL ,
  `updateline` INT(10) UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_driver_cid_idx` (`cid` ASC) ,
  CONSTRAINT `fk_product_driver_cid`
    FOREIGN KEY (`cid` )
    REFERENCES `insona`.`category` (`cid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE  TABLE IF NOT EXISTS `insona`.`product` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `product_driver_id` INT(10) UNSIGNED NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `content` TEXT NOT NULL ,
  `hidden` TINYINT(3) UNSIGNED NOT NULL ,
  `createline` INT(10) UNSIGNED NOT NULL ,
  `updateline` INT(10) UNSIGNED NOT NULL ,
  `coverpath` CHAR(26) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_product_view_product_driver_id_idx` (`product_driver_id` ASC) ,
  CONSTRAINT `fk_product_view_product_driver_id`
    FOREIGN KEY (`product_driver_id` )
    REFERENCES `insona`.`product_category` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

DROP TABLE IF EXISTS `insona`.`product_view` ;

DROP TABLE IF EXISTS `insona`.`product_driver` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
