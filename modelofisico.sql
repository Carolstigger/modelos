CREATE DATABASE agencia;

USE agencia;

CREATE TABLE `Cliente` (
	`IdCliente` INT(10) NOT NULL AUTO_INCREMENT,
	`Nome` varchar(40) NOT NULL,
	`Telefone` varchar(11),
	`CPF` varchar(11) UNIQUE,
	`Nascimento` INT(4),
	PRIMARY KEY (`IdCliente`)
);

CREATE TABLE `Endereco` (
	`IdEndereco` INT(10) NOT NULL AUTO_INCREMENT,
	`Rua` varchar(40) NOT NULL,
	`Numero` INT(5) NOT NULL,
	`Cidade` varchar(20) NOT NULL,
	`Bairro` varchar(20) NOT NULL,
	`CEP` varchar(10) NOT NULL,
	`IdCliente` varchar(40),
	PRIMARY KEY (`IdEndereco`)
);

CREATE TABLE `Vendedor` (
	`IdVendedor` INT(10) NOT NULL AUTO_INCREMENT,
	`CPF` varchar(11) NOT NULL UNIQUE,
	`Nome` varchar(40) NOT NULL,
	PRIMARY KEY (`IdVendedor`)
);

CREATE TABLE `Compra` (
	`IdCompra` INT(10) NOT NULL AUTO_INCREMENT,
	`Data` varchar(10) NOT NULL,
	`Valor` varchar(10) NOT NULL,
	`FormaPagamento` varchar(20) NOT NULL,
	`IdCliente` INT(10),
	`IdVendedor` INT(10),
	PRIMARY KEY (`IdCompra`)
);

CREATE TABLE `Pacote` (
	`IdPacote` INT(10) NOT NULL AUTO_INCREMENT,
	`Data` varchar(10) NOT NULL,
	`Tipo` varchar(40) NOT NULL,
	`Destino` varchar(40) NOT NULL,
	`Valor` varchar(40) NOT NULL,
	`IdCompra` INT(10),
	PRIMARY KEY (`IdPacote`)
);

ALTER TABLE `Endereco` ADD CONSTRAINT `Endereco_fk0` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Compra` ADD CONSTRAINT `Compra_fk0` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Compra` ADD CONSTRAINT `Compra_fk1` FOREIGN KEY (`IdVendedor`) REFERENCES `Vendedor`(`IdVendedor`);

ALTER TABLE `Pacote` ADD CONSTRAINT `Pacote_fk0` FOREIGN KEY (`IdCompra`) REFERENCES `Compra`(`IdCompra`);





