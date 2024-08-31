create database salgado_trancas;

use salgado_trancas;


CREATE TABLE IF NOT EXISTS `salgado_trancas`.`espessura_de_cabelo` (
  `id_espessura_de_cabelo` INT NOT NULL,
  `espessura` VARCHAR(255) NULL,
  PRIMARY KEY (`id_espessura_de_cabelo`));

CREATE TABLE IF NOT EXISTS `salgado_trancas`.`tipo_genero` (
  `id_genero` INT NOT NULL,
  `genero` VARCHAR(255) NULL,
  PRIMARY KEY (`id_genero`));


CREATE TABLE IF NOT EXISTS `salgado_trancas`.`usuario` (
  `id_usuario` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `dt_nascimento` DATE NULL,
  `email` VARCHAR(255) NULL,
  `senha` VARCHAR(255) NULL,
  `id_google` VARCHAR(255) NULL,
  `telefone` VARCHAR(255) NULL,
  `espessura_de_cabelo_id_espessura_de_cabelo` INT NOT NULL,
  `tipo_genero_id_genero` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_espessura_de_cabelo1_idx` (`espessura_de_cabelo_id_espessura_de_cabelo` ASC) VISIBLE,
  INDEX `fk_usuario_tipo_genero1_idx` (`tipo_genero_id_genero` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_espessura_de_cabelo1`
    FOREIGN KEY (`espessura_de_cabelo_id_espessura_de_cabelo`)
    REFERENCES `salgado_trancas`.`espessura_de_cabelo` (`id_espessura_de_cabelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tipo_genero1`
    FOREIGN KEY (`tipo_genero_id_genero`)
    REFERENCES `salgado_trancas`.`tipo_genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `salgado_trancas`.`trancista` (
  `id_trancista` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `senha` VARCHAR(255) NULL,
  `id_google` VARCHAR(255) NULL,
  PRIMARY KEY (`id_trancista`));


CREATE TABLE IF NOT EXISTS `salgado_trancas`.`status_agendamento` (
  `id_status` INT NOT NULL,
  `status` VARCHAR(255) NULL,
  PRIMARY KEY (`id_status`));

CREATE TABLE IF NOT EXISTS `salgado_trancas`.`agendamento` (
  `id_agendamento` INT NOT NULL,
  `data` DATETIME NULL,
  `tipo_tranca` VARCHAR(255) NULL,
  `valor_pago` DOUBLE NULL,
  `valor_sinal` DOUBLE NULL,
  `usuario_id_usuario` INT NOT NULL,
  `trancista_id_trancista` INT NOT NULL,
  `status_agendamento_id_status` INT NOT NULL,
  PRIMARY KEY (`id_agendamento`),
  INDEX `fk_agendamento_usuario_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_agendamento_trancista1_idx` (`trancista_id_trancista` ASC) VISIBLE,
  INDEX `fk_agendamento_status_agendamento1_idx` (`status_agendamento_id_status` ASC) VISIBLE,
  CONSTRAINT `fk_agendamento_usuario`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `salgado_trancas`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_trancista1`
    FOREIGN KEY (`trancista_id_trancista`)
    REFERENCES `salgado_trancas`.`trancista` (`id_trancista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_status_agendamento1`
    FOREIGN KEY (`status_agendamento_id_status`)
    REFERENCES `salgado_trancas`.`status_agendamento` (`id_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `salgado_trancas`.`produto` (
  `id_produto` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `quantidade` INT NULL,
  `marca` VARCHAR(255) NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`id_produto`));

CREATE TABLE IF NOT EXISTS `salgado_trancas`.`avaliacao_usario` (
  `id_avaliacao` INT NOT NULL,
  `avaliacao` VARCHAR(255) NULL,
  `nota` DOUBLE NULL,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  INDEX `fk_avaliacao_usario_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_avaliacao_usario_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `salgado_trancas`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);