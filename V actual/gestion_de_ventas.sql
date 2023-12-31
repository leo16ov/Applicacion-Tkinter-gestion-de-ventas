-- MySQL Script generated by MySQL Workbench
-- dom 05 nov 2023 14:02:34
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestion_de_ventas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestion_de_ventas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestion_de_ventas` ;
USE `gestion_de_ventas` ;

-- -----------------------------------------------------
-- Table `gestion_de_ventas`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_de_ventas`.`Proveedores` (
  `IdProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `apellido` VARCHAR(60) NOT NULL,
  `telefono` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`IdProveedor`),
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_de_ventas`.`Administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_de_ventas`.`Administradores` (
  `IdAdministrador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `permiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdAdministrador`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `nombre_usuario_UNIQUE` (`nombre_usuario` ASC) VISIBLE)
DEFAULT CHARACTER SET = big5;


-- -----------------------------------------------------
-- Table `gestion_de_ventas`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_de_ventas`.`Usuarios` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `nombre_usuario` VARCHAR(60) NOT NULL,
  `email` VARCHAR(80) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `nombre_usuario_UNIQUE` (`nombre_usuario` ASC) VISIBLE)
DEFAULT CHARACTER SET = big5;


-- -----------------------------------------------------
-- Table `gestion_de_ventas`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_de_ventas`.`Comentarios` (
  `IdComentario` INT NOT NULL,
  `Comentario` VARCHAR(1000) NOT NULL,
  `IdUsuario` INT NOT NULL,
  `fechaComentario` DATETIME NULL,
  PRIMARY KEY (`IdComentario`),
  INDEX `fk_Comentarios_1_idx` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_1`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `gestion_de_ventas`.`Usuarios` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_de_ventas`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_de_ventas`.`Productos` (
  `Codigo_producto` INT NOT NULL,
  `nombre` VARCHAR(80) NOT NULL,
  `precio_venta` DECIMAL(2) NOT NULL,
  `precio_proveedor` DECIMAL(2) NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  `cantidad_en_stock` INT NOT NULL,
  `IdProveedor` INT NOT NULL,
  `IdAdministrador` INT NOT NULL,
  `descripcion` VARCHAR(700) NULL,
  `IdComentario` INT NULL,
  PRIMARY KEY (`Codigo_producto`),
  INDEX `fk_Productos_1_idx` (`IdProveedor` ASC) VISIBLE,
  INDEX `fk_Productos_2_idx` (`IdAdministrador` ASC) VISIBLE,
  INDEX `fk_Productos_3_idx` (`IdComentario` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_1`
    FOREIGN KEY (`IdProveedor`)
    REFERENCES `gestion_de_ventas`.`Proveedores` (`IdProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_2`
    FOREIGN KEY (`IdAdministrador`)
    REFERENCES `gestion_de_ventas`.`Administradores` (`IdAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_3`
    FOREIGN KEY (`IdComentario`)
    REFERENCES `gestion_de_ventas`.`Comentarios` (`IdComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
