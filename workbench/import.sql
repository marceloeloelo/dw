SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ECH_DW` ;
CREATE SCHEMA IF NOT EXISTS `ECH_DW` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `ECH_DW` ;

-- -----------------------------------------------------
-- Table `ECH_DW`.`tiposVivienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`tiposVivienda` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`tiposVivienda` (
  `idTiposVivienda` INT NOT NULL ,
  `tipo` INT NULL ,
  PRIMARY KEY (`idTiposVivienda`) ,
  UNIQUE INDEX `idTiposVivienda_UNIQUE` (`idTiposVivienda` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`nivelesConfort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`nivelesConfort` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`nivelesConfort` (
  `idnivelConfort` INT NOT NULL ,
  `tipo` INT NULL ,
  PRIMARY KEY (`idnivelConfort`) ,
  UNIQUE INDEX `idnivelesConfort_UNIQUE` (`idnivelConfort` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`geografia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`geografia` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`geografia` (
  `idGeografia` INT NOT NULL ,
  `departamento` VARCHAR(45) NULL ,
  `localidad` VARCHAR(45) NULL ,
  `region` VARCHAR(45) NULL ,
  `ccz` VARCHAR(45) NULL ,
  `barrio` VARCHAR(45) NULL ,
  PRIMARY KEY (`idGeografia`) ,
  UNIQUE INDEX `idGeografia_UNIQUE` (`idGeografia` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`tiempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`tiempo` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`tiempo` (
  `idTiempo` INT NOT NULL ,
  `anio` INT NULL ,
  `trimestre` INT NULL ,
  `mes` INT NULL ,
  PRIMARY KEY (`idTiempo`) ,
  UNIQUE INDEX `idTiempo_UNIQUE` (`idTiempo` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`infoHogares`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`infoHogares` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`infoHogares` (
  `idInfoHogar` INT NOT NULL ,
  `fk_tiposVivienda`  INT NOT NULL,
  `fk_geografia`  INT NOT NULL,
  `fk_nivel_confort`  INT NOT NULL,
  `fk_tiempo`  INT NOT NULL,
  `cantHogares` INT NULL ,
  `cantPersonas` INT NULL ,
  `cantPersonasMayor14` INT NULL ,
  `cantPersonasMenor14` INT NULL ,
  `cantHombres` INT NULL ,
  `cantMujeres` INT NULL ,
  `cantOcupados` INT NULL ,
  `cantDesocupados` INT NULL ,
  PRIMARY KEY (`idInfoHogar`) ,
  UNIQUE INDEX `idInfoHogares_UNIQUE` (`idInfoHogar` ASC) ,
    FOREIGN KEY (`fk_tiposVivienda`)
  REFERENCES `ECH_DW`.`tiposVivienda` (`idTiposVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fk_geografia`)
  REFERENCES `ECH_DW`.`geografia` (`idGeografia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`fk_nivel_confort`)
    REFERENCES `ECH_DW`.`nivelesConfort` (`idNivelConfort`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`fk_tiempo`)
    REFERENCES `ECH_DW`.`tiempo` (`idTiempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
