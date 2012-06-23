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
  PRIMARY KEY (`fk_sexos`,`fk_geografia`,`fk_educacion_alcanzada`, `fk_educacion_finalizada`,`fk_tiempo`, `fk_edades`, `fk_salud`, `fk_ocupaciones`) ,
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


