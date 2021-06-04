CREATE TABLE `user` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(35) NOT NULL,
	`mail` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`picURL` varchar(255) NOT NULL,
	`idUserState` varchar(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `community` (
	`id` int NOT NULL,
	`maxResidents` int NOT NULL,
	`name` varchar(35) NOT NULL,
	`description` varchar(50) NOT NULL,
	`direction` varchar(50) NOT NULL,
	`idUsuarioAdministrador` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_community` (
	`id` int NOT NULL,
	`idCommunity` int NOT NULL,
	`idUser` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `invitation` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20) NOT NULL,
	`token` varchar(255) NOT NULL UNIQUE,
	`urlQR` varchar(255) NOT NULL UNIQUE,
	`idCommunity` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `comment` (
	`id` int NOT NULL AUTO_INCREMENT,
	`text` varchar(255) NOT NULL,
	`date` DATETIME NOT NULL,
	`idPost` int NOT NULL,
	`idUser` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `post` (
	`id` int NOT NULL AUTO_INCREMENT,
	`title` varchar(25) NOT NULL,
	`text` varchar(255) NOT NULL,
	`creationDate` DATETIME NOT NULL,
	`idCommunity` int NOT NULL,
	`idAuthor` int NOT NULL,
	`idVisibility` varchar(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `announcement` (
	`id` int NOT NULL,
	`colorHex` varchar(7) NOT NULL,
	`importance` tinyint NOT NULL DEFAULT '1',
	`idPost` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `visibility` (
	`id` varchar(5) NOT NULL,
	`description` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sale` (
	`id` int NOT NULL AUTO_INCREMENT,
	`price` int NOT NULL,
	`idPost` int NOT NULL,
	`idPromo` varchar(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `promo` (
	`id` varchar(5) NOT NULL,
	`description` varchar(35) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `category` (
	`id` varchar(5) NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `commonExpenses` (
	`id` int NOT NULL AUTO_INCREMENT,
	`price` int NOT NULL,
	`description` varchar(50) NOT NULL,
	`creationDate` DATE NOT NULL,
	`dueDate` DATE NOT NULL,
	`idCommunity` int NOT NULL,
	`idUser` int NOT NULL,
	`idCommonExpenseState` varchar(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `commonExpenseState` (
	`id` varchar(5) NOT NULL,
	`description` varchar(20) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `userState` (
	`id` varchar(5) NOT NULL,
	`description` varchar(35) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sale_category` (
	`id` int NOT NULL AUTO_INCREMENT,
	`idSale` int NOT NULL,
	`idCategory` varchar(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `imgSale` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`url` varchar(255) NOT NULL UNIQUE,
	`idSale` int NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `user` ADD CONSTRAINT `user_fk0` FOREIGN KEY (`idUserState`) REFERENCES `userState`(`id`);

ALTER TABLE `community` ADD CONSTRAINT `community_fk0` FOREIGN KEY (`idUsuarioAdministrador`) REFERENCES `user`(`id`);

ALTER TABLE `user_community` ADD CONSTRAINT `user_community_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id`);

ALTER TABLE `user_community` ADD CONSTRAINT `user_community_fk1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id`);

ALTER TABLE `invitation` ADD CONSTRAINT `invitation_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk0` FOREIGN KEY (`idPost`) REFERENCES `post`(`id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id`);

ALTER TABLE `post` ADD CONSTRAINT `post_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id`);

ALTER TABLE `post` ADD CONSTRAINT `post_fk1` FOREIGN KEY (`idAuthor`) REFERENCES `user`(`id`);

ALTER TABLE `post` ADD CONSTRAINT `post_fk2` FOREIGN KEY (`idVisibility`) REFERENCES `visibility`(`id`);

ALTER TABLE `announcement` ADD CONSTRAINT `announcement_fk0` FOREIGN KEY (`idPost`) REFERENCES `post`(`id`);

ALTER TABLE `sale` ADD CONSTRAINT `sale_fk0` FOREIGN KEY (`idPost`) REFERENCES `post`(`id`);

ALTER TABLE `sale` ADD CONSTRAINT `sale_fk1` FOREIGN KEY (`idPromo`) REFERENCES `promo`(`id`);

ALTER TABLE `commonExpenses` ADD CONSTRAINT `commonExpenses_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id`);

ALTER TABLE `commonExpenses` ADD CONSTRAINT `commonExpenses_fk1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id`);

ALTER TABLE `commonExpenses` ADD CONSTRAINT `commonExpenses_fk2` FOREIGN KEY (`idCommonExpenseState`) REFERENCES `commonExpenseState`(`id`);

ALTER TABLE `sale_category` ADD CONSTRAINT `sale_category_fk0` FOREIGN KEY (`idSale`) REFERENCES `sale`(`id`);

ALTER TABLE `sale_category` ADD CONSTRAINT `sale_category_fk1` FOREIGN KEY (`idCategory`) REFERENCES `category`(`id`);

ALTER TABLE `imgSale` ADD CONSTRAINT `imgSale_fk0` FOREIGN KEY (`idSale`) REFERENCES `sale`(`id`);

