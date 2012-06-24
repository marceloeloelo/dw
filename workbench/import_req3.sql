DROP TABLE IF EXISTS `ECH_DW`.`infoTecnologias` ;

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
  INDEX `fk_infoTecnologias_Sexos` (`fk_sexos` ASC) ,
  INDEX `fk_infoTecnologias_edades1` (`fk_edades` ASC) ,
  INDEX `fk_infoTecnologias_educacion1` (`fk_educacion` ASC) ,
  INDEX `fk_infoTecnologias_tiempo1` (`fk_tiempo` ASC) ,
  INDEX `fk_infoTecnologias_geografia1` (`fk_geografia` ASC) ,
  INDEX `fk_infoTecnologias_tics1` (`fk_tics` ASC) ,
PRIMARY KEY (`fk_sexos`,`fk_geografia`, `idPersona`, `fk_educacion`,`fk_tiempo`, `fk_edades`, `fk_tics`) ,
  CONSTRAINT `fk_infoTecnologias_Sexos`
    FOREIGN KEY (`fk_sexos` )
    REFERENCES `ECH_DW`.`Sexos` (`idSexos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infoTecnologias_edades1`
    FOREIGN KEY (`fk_edades` )
    REFERENCES `ECH_DW`.`edades` (`idEdades` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infoTecnologias_educacion1`
    FOREIGN KEY (`fk_educacion` )
    REFERENCES `ECH_DW`.`educacion` (`idEducacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infoTecnologias_tiempo1`
    FOREIGN KEY (`fk_tiempo` )
    REFERENCES `ECH_DW`.`tiempo` (`idTiempo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infoTecnologias_geografia1`
    FOREIGN KEY (`fk_geografia` )
    REFERENCES `ECH_DW`.`geografia` (`idGeografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infoTecnologias_tics1`
    FOREIGN KEY (`fk_tics` )
    REFERENCES `ECH_DW`.`tics` (`idTics` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

