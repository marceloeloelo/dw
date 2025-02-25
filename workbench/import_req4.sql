DROP TABLE IF EXISTS `ECH_DW`.`infoIngresoRacial` ;

-- -----------------------------------------------------
-- Table `ECH_DW`.`ascendenciaRacial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`ascendenciaRacial` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`ascendenciaRacial` (
  `idAscendenciaRacial` INT NOT NULL ,
  `raza` VARCHAR(100) NULL ,
  PRIMARY KEY (`idAscendenciaRacial`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ECH_DW`.`ingresos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`ingresos` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`ingresos` (
  `idIngresos` INT NOT NULL ,
  `rango` VARCHAR(100) NULL ,
  PRIMARY KEY (`idIngresos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ECH_DW`.`infoIngresoRacial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ECH_DW`.`infoIngresoRacial` ;

CREATE  TABLE IF NOT EXISTS `ECH_DW`.`infoIngresoRacial` (
  `fk_tiempo` INT NOT NULL ,
  `fk_geografia` INT NOT NULL ,
  `idPersona` INT NOT NULL ,
  `fk_ingresos` INT NOT NULL ,
  `fk_ocupaciones` INT NOT NULL ,
  `fk_ascendencia_racial` INT NOT NULL ,
  `cantPersonas` INT NULL ,
  INDEX `fk_tiempo2` (`fk_tiempo` ASC) ,
  INDEX `fk_geografia2` (`fk_geografia` ASC) ,
  INDEX `fk_ingresos2` (`fk_ingresos` ASC) ,
  INDEX `fk_ocupaciones2` (`fk_ocupaciones` ASC) ,
  INDEX `fk_ascendencia_racial2` (`fk_ascendencia_racial` ASC) ,
  PRIMARY KEY (`fk_tiempo`, `fk_geografia`, `idPersona`, `fk_ingresos`, `fk_ocupaciones`, `fk_ascendencia_racial`) ,
  CONSTRAINT `fk_tiempo2`
    FOREIGN KEY (`fk_tiempo` )
    REFERENCES `ECH_DW`.`tiempo` (`idTiempo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_geografia2`
    FOREIGN KEY (`fk_geografia` )
    REFERENCES `ECH_DW`.`geografia` (`idGeografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingresos2`
    FOREIGN KEY (`fk_geografia` )
    REFERENCES `ECH_DW`.`geografia` (`idGeografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ocupaciones2`
    FOREIGN KEY (`fk_geografia` )
    REFERENCES `ECH_DW`.`geografia` (`idGeografia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ascendencia_racial2`
    FOREIGN KEY (`fk_ascendencia_racial` )
    REFERENCES `ECH_DW`.`ascendenciaRacial` (`idAscendenciaRacial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

