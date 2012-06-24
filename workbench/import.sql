SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ECH_DW` ;
CREATE SCHEMA IF NOT EXISTS `ECH_DW` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `ECH_DW` ;

-- ---------------------------------------------------------------------------
-- 														REQUERIMIENTO 1
-- ---------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table `ECH_DW`.`tiposVivienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`tiposVivienda` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`tiposVivienda` (
  `idTiposVivienda` INT NOT NULL ,
  `tipo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idTiposVivienda`) ,
  UNIQUE INDEX `idTiposVivienda_UNIQUE` (`idTiposVivienda` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`nivelesConfort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`nivelesConfort` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`nivelesConfort` (
  `idNivelesConfort` INT NOT NULL ,
  `tipo` INT NULL ,
  PRIMARY KEY (`idNivelesConfort`) ,
  UNIQUE INDEX `idnivelesConfort_UNIQUE` (`idNivelesConfort` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`geografia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`geografia` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`geografia` (
  `idGeografia` INT NOT NULL ,
  `idHogar` INT NULL ,
  `idLocalidad` INT NULL,
  `idRegion` INT NULL ,
  `idCCZ` INT NULL ,
  `idBarrio` INT NULL ,
  `nombreBarrio` VARCHAR(45) NULL ,
  `idDepartamento` INT NULL ,
  `nombreDepartamento` VARCHAR(45) NULL ,
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
  `fk_tipos_vivienda`   INT NOT NULL,
  `fk_geografia`        INT NOT NULL,
  `fk_niveles_confort`  INT NOT NULL,
  `fk_tiempo`           INT NOT NULL,
  `cantHogares`         INT NULL ,
  `cantPersonas`        INT NULL ,
  `cantPersonasMayor14` INT NULL ,
  `cantPersonasMenor14` INT NULL ,
  `cantHombres`         INT NULL ,
  `cantMujeres`         INT NULL ,
  `cantOcupados`        INT NULL ,
  `cantDesocupados`     INT NULL ,
  PRIMARY KEY (`fk_niveles_confort`,`fk_tiempo`,`fk_tipos_vivienda`,`fk_geografia`) ,
    FOREIGN KEY (`fk_tipos_vivienda`)
  REFERENCES `ECH_DW`.`tiposVivienda` (`idTiposVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fk_geografia`)
  REFERENCES `ECH_DW`.`geografia` (`idGeografia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`fk_niveles_confort`)
    REFERENCES `ECH_DW`.`nivelesConfort` (`idNivelesConfort`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`fk_tiempo`)
    REFERENCES `ECH_DW`.`tiempo` (`idTiempo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ---------------------------------------------------------------------------
-- 														REQUERIMIENTO 2
-- ---------------------------------------------------------------------------

-- -----------------------------------------------------
-- Table `ECH_DW`.`ocupaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`ocupaciones` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`ocupaciones` (
  `idOcupaciones` INT NOT NULL ,
  `Ocupacion` VARCHAR(100) NULL ,
  PRIMARY KEY (`idOcupaciones`) ,
  UNIQUE INDEX `idOcupaciones_UNIQUE` (`idOcupaciones` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`edades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`edades` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`edades` (
  `idEdades` INT NOT NULL ,
  `Edad` VARCHAR(40) NULL ,
  PRIMARY KEY (`idEdades`) ,
  UNIQUE INDEX `idEdades_UNIQUE` (`idEdades` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`salud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`salud` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`salud` (
  `idSalud` INT NOT NULL ,
  `salud` VARCHAR(100) NULL ,
  PRIMARY KEY (`idSalud`) ,
  UNIQUE INDEX `idsalud_UNIQUE` (`idSalud` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`sexos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`sexos` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`sexos` (
  `idSexos` INT NOT NULL ,
  `sexo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idSexos`) ,
  UNIQUE INDEX `idsexos_UNIQUE` (`idSexos` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ECH_DW`.`educacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`educacion` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`educacion` (
  `idEducacion` INT NOT NULL ,
  `tipo` VARCHAR(100) NULL ,
  PRIMARY KEY (`idEducacion`) ,
  UNIQUE INDEX `idEducacion_UNIQUE` (`idEducacion` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`infoPersonas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`infoPersonas` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`infoPersonas` (
  `fk_sexos`           INT NOT NULL ,
  `fk_geografia`       INT NOT NULL ,
  `idPersona`          INT NOT NULL ,
  `fk_educacion_alcanzada`       INT NOT NULL ,
  `fk_educacion_finalizada`       INT NOT NULL ,
  `fk_tiempo`          INT NOT NULL ,
  `fk_edades`          INT NOT NULL ,
  `fk_salud`           INT NOT NULL ,
  `fk_ocupaciones`     INT NOT NULL ,
  `cantPersonas`       INT NULL ,
  `cantAniosAprobados` INT NULL ,
  `cantIngresos`       INT NULL ,
  INDEX `fk_sexos` (`fk_sexos` ASC) ,
  INDEX `fk_geografia` (`fk_geografia` ASC) ,
  INDEX `fk_educacion_alcanzada` (`fk_educacion_alcanzada` ASC) ,
  INDEX `fk_educacion_finalizada` (`fk_educacion_finalizada` ASC) ,
  INDEX `fk_tiempo` (`fk_tiempo` ASC) ,
  INDEX `fk_edades` (`fk_edades` ASC) ,
  INDEX `fk_salud` (`fk_salud` ASC) ,
  INDEX `fk_ocupaciones` (`fk_ocupaciones` ASC) ,
  PRIMARY KEY (`fk_sexos`,`fk_geografia`, `idPersona`, `fk_educacion_alcanzada`, `fk_educacion_finalizada`,`fk_tiempo`, `fk_edades`, `fk_salud`, `fk_ocupaciones`) ,
  CONSTRAINT `fk_sexos`
    FOREIGN KEY (`fk_sexos` )
    REFERENCES `ECH_DW`.`sexos` (`idSexos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_geografia`
    FOREIGN KEY (`fk_geografia` )
    REFERENCES `ECH_DW`.`geografia` (`idGeografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_alcanzada`
    FOREIGN KEY (`fk_educacion_alcanzada` )
    REFERENCES `ECH_DW`.`educacion` (`idEducacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion_finalizada`
    FOREIGN KEY (`fk_educacion_finalizada` )
    REFERENCES `ECH_DW`.`educacion` (`idEducacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tiempo`
    FOREIGN KEY (`fk_tiempo` )
    REFERENCES `ECH_DW`.`tiempo` (`idTiempo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_edades`
    FOREIGN KEY (`fk_edades` )
    REFERENCES `ECH_DW`.`edades` (`idEdades` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salud`
    FOREIGN KEY (`fk_salud` )
    REFERENCES `ECH_DW`.`salud` (`idSalud` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocupaciones`
    FOREIGN KEY (`fk_ocupaciones` )
    REFERENCES `ECH_DW`.`ocupaciones` (`idOcupaciones` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ---------------------------------------------------------------------------
-- 														REQUERIMIENTO 3
-- ---------------------------------------------------------------------------


-- -----------------------------------------------------
-- Table `ECH_DW`.`tics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`tics` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`tics` (
  `idTics` INT NOT NULL ,
  `celular` TINYINT(1) NULL ,
  `usoInternet` VARCHAR(100) NULL ,
  PRIMARY KEY (`idTics`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ECH_DW`.`infoTecnologias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`infoTecnologias` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`infoTecnologias` (
  `fk_sexos` INT NOT NULL ,
  `fk_edades` INT NOT NULL ,
  `fk_educacion` INT NOT NULL ,
  `fk_tiempo` INT NOT NULL ,
  `fk_geografia` INT NOT NULL ,
  `idPersona` INT NOT NULL ,
  `fk_tics` INT NOT NULL ,
  `cantPersonas` INT NULL ,
  INDEX `fk_sexos1` (`fk_sexos` ASC) ,
  INDEX `fk_edades1` (`fk_edades` ASC) ,
  INDEX `fk_educacion1` (`fk_educacion` ASC) ,
  INDEX `fk_tiempo1` (`fk_tiempo` ASC) ,
  INDEX `fk_geografia1` (`fk_geografia` ASC) ,
  INDEX `fk_tics` (`fk_tics` ASC) ,
  PRIMARY KEY (`fk_sexos`,`fk_geografia`, `idPersona`, `fk_educacion`,`fk_tiempo`, `fk_edades`, `fk_tics`) ,
  CONSTRAINT `fk_sexos1`
    FOREIGN KEY (`fk_sexos` )
    REFERENCES `ECH_DW`.`sexos` (`idSexos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_edades1`
    FOREIGN KEY (`fk_edades` )
    REFERENCES `ECH_DW`.`edades` (`idEdades` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_educacion1`
    FOREIGN KEY (`fk_educacion` )
    REFERENCES `ECH_DW`.`educacion` (`idEducacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tiempo1`
    FOREIGN KEY (`fk_tiempo` )
    REFERENCES `ECH_DW`.`tiempo` (`idTiempo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_geografia1`
    FOREIGN KEY (`fk_geografia` )
    REFERENCES `ECH_DW`.`geografia` (`idGeografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tics`
    FOREIGN KEY (`fk_tics` )
    REFERENCES `ECH_DW`.`tics` (`idTics` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
