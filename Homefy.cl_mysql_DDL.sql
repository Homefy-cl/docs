CREATE TABLE `Usuario` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(35) NOT NULL,
	`mail` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`idEstadoUsuario` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Comunidad` (
	`id` int NOT NULL,
	`nombre` varchar(35) NOT NULL,
	`descripcion` varchar(255) NOT NULL,
	`direccion` varchar(255) NOT NULL,
	`idUsuarioAdministrador` int NOT NULL,
	`idPlan` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Usuario_Comunidad` (
	`id` int NOT NULL,
	`idComunidad` int NOT NULL,
	`idUsuario` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Invitacion` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nombre` varchar(20) NOT NULL,
	`token` varchar(255) NOT NULL UNIQUE,
	`urlQR` varchar(255) NOT NULL UNIQUE,
	`idComunidad` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Comentario` (
	`id` int NOT NULL AUTO_INCREMENT,
	`texto` varchar(255) NOT NULL,
	`fecha` DATETIME NOT NULL,
	`idPublicacion` int NOT NULL,
	`idAutor` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Publicacion` (
	`id` int NOT NULL AUTO_INCREMENT,
	`titulo` varchar(255) NOT NULL,
	`descripcion` varchar(255) NOT NULL,
	`fechaCreacion` DATETIME NOT NULL,
	`idComunidad` int NOT NULL,
	`idAutor` int NOT NULL,
	`idVisibilidad` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Aviso` (
	`id` int NOT NULL,
	`colorHex` varchar(7) NOT NULL,
	`importancia` int(1) NOT NULL DEFAULT '1',
	`idPublicacion` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Visibilidad` (
	`id` varchar(5) NOT NULL,
	`descripcion` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Venta` (
	`id` int NOT NULL AUTO_INCREMENT,
	`precio` int NOT NULL,
	`idPublicacion` int NOT NULL,
	`idPromocion` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Promocion` (
	`id` varchar(5) NOT NULL,
	`descripcion` varchar(35) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Categoria` (
	`id` varchar(5) NOT NULL,
	`nombre` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `GastoComun` (
	`id` int NOT NULL AUTO_INCREMENT,
	`valorCobro` int NOT NULL,
	`descripcion` varchar(255) NOT NULL,
	`fechaCreacion` DATE NOT NULL,
	`fechaVencimiento` DATE NOT NULL,
	`idUsuarioAutor` int NOT NULL,
	`idUsuarioDestinatario` int NOT NULL,
	`idEstadoGastoComun` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `EstadoGastoComun` (
	`id` varchar(5) NOT NULL,
	`descripcion` varchar(20) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `EstadoUsuario` (
	`id` varchar(5) NOT NULL,
	`descripcion` varchar(35) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Venta_Categoria` (
	`id` int NOT NULL AUTO_INCREMENT,
	`idVenta` int NOT NULL,
	`idCategoria` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ImagenVenta` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`url` varchar(255) NOT NULL UNIQUE,
	`idVenta` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Usuario` ADD CONSTRAINT `Usuario_fk0` FOREIGN KEY (`idEstadoUsuario`) REFERENCES `EstadoUsuario`(`id`);

ALTER TABLE `Comunidad` ADD CONSTRAINT `Comunidad_fk0` FOREIGN KEY (`idUsuarioAdministrador`) REFERENCES `Usuario`(`id`);

ALTER TABLE `Comunidad` ADD CONSTRAINT `Comunidad_fk1` FOREIGN KEY (`idPlan`) REFERENCES `PlanComunidad`(`id`);

ALTER TABLE `Usuario_Comunidad` ADD CONSTRAINT `Usuario_Comunidad_fk0` FOREIGN KEY (`idComunidad`) REFERENCES `Comunidad`(`id`);

ALTER TABLE `Usuario_Comunidad` ADD CONSTRAINT `Usuario_Comunidad_fk1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario`(`id`);

ALTER TABLE `Invitacion` ADD CONSTRAINT `Invitacion_fk0` FOREIGN KEY (`idComunidad`) REFERENCES `Comunidad`(`id`);

ALTER TABLE `Comentario` ADD CONSTRAINT `Comentario_fk0` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion`(`id`);

ALTER TABLE `Comentario` ADD CONSTRAINT `Comentario_fk1` FOREIGN KEY (`idAutor`) REFERENCES `Usuario`(`id`);

ALTER TABLE `Publicacion` ADD CONSTRAINT `Publicacion_fk0` FOREIGN KEY (`idComunidad`) REFERENCES `Comunidad`(`id`);

ALTER TABLE `Publicacion` ADD CONSTRAINT `Publicacion_fk1` FOREIGN KEY (`idAutor`) REFERENCES `Usuario`(`id`);

ALTER TABLE `Publicacion` ADD CONSTRAINT `Publicacion_fk2` FOREIGN KEY (`idVisibilidad`) REFERENCES `Visibilidad`(`id`);

ALTER TABLE `Aviso` ADD CONSTRAINT `Aviso_fk0` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion`(`id`);

ALTER TABLE `Venta` ADD CONSTRAINT `Venta_fk0` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion`(`id`);

ALTER TABLE `Venta` ADD CONSTRAINT `Venta_fk1` FOREIGN KEY (`idPromocion`) REFERENCES `Promocion`(`id`);

ALTER TABLE `GastoComun` ADD CONSTRAINT `GastoComun_fk0` FOREIGN KEY (`idUsuarioAutor`) REFERENCES `Usuario`(`id`);

ALTER TABLE `GastoComun` ADD CONSTRAINT `GastoComun_fk1` FOREIGN KEY (`idUsuarioDestinatario`) REFERENCES `Usuario`(`id`);

ALTER TABLE `GastoComun` ADD CONSTRAINT `GastoComun_fk2` FOREIGN KEY (`idEstadoGastoComun`) REFERENCES `EstadoGastoComun`(`id`);

ALTER TABLE `Venta_Categoria` ADD CONSTRAINT `Venta_Categoria_fk0` FOREIGN KEY (`idVenta`) REFERENCES `Venta`(`id`);

ALTER TABLE `Venta_Categoria` ADD CONSTRAINT `Venta_Categoria_fk1` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria`(`id`);

ALTER TABLE `ImagenVenta` ADD CONSTRAINT `ImagenVenta_fk0` FOREIGN KEY (`idVenta`) REFERENCES `Venta`(`id`);

