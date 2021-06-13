CREATE TABLE `user` (
	`id_user` int NOT NULL AUTO_INCREMENT,
	`name` varchar(35) NOT NULL,
	`mail` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`picURL` varchar(255) NOT NULL,
	`idUserState` int NOT NULL,
	PRIMARY KEY (`id_user`)
);

CREATE TABLE `community` (
	`id_community` int NOT NULL AUTO_INCREMENT,
	`maxResidents` int NOT NULL,
	`name` varchar(35) NOT NULL,
	`description` varchar(50) NOT NULL,
	`direction` varchar(50) NOT NULL,
	`idUsuarioAdministrador` int NOT NULL,
	PRIMARY KEY (`id_community`)
);

CREATE TABLE `user_community` (
	`id_user_community` int NOT NULL AUTO_INCREMENT,
	`idCommunity` int NOT NULL,
	`idUser` int NOT NULL,
	PRIMARY KEY (`id_user_community`)
);

CREATE TABLE `invitation` (
	`id_invitation` int NOT NULL AUTO_INCREMENT,
	`name` varchar(20) NOT NULL,
	`token` varchar(255) NOT NULL UNIQUE,
	`urlQR` varchar(255) NOT NULL UNIQUE,
	`idCommunity` int NOT NULL,
	PRIMARY KEY (`id_invitation`)
);

CREATE TABLE `comment` (
	`id_comment` int NOT NULL AUTO_INCREMENT,
	`text` varchar(255) NOT NULL,
	`date` DATETIME NOT NULL,
	`idPost` int NOT NULL,
	`idUser` int NOT NULL,
	PRIMARY KEY (`id_comment`)
);

CREATE TABLE `post` (
	`id_post` int NOT NULL AUTO_INCREMENT,
	`title` varchar(25) NOT NULL,
	`text` varchar(255) NOT NULL,
	`creationDate` DATETIME NOT NULL,
	`idCommunity` int NOT NULL,
	`idAuthor` int NOT NULL,
	`idVisibility` int NOT NULL,
	PRIMARY KEY (`id_post`)
);

CREATE TABLE `announcement` (
	`id_announcement` int NOT NULL AUTO_INCREMENT,
	`colorHex` varchar(7) NOT NULL,
	`importance` tinyint NOT NULL DEFAULT '1',
	`idPost` int NOT NULL,
	PRIMARY KEY (`id_announcement`)
);

CREATE TABLE `visibility` (
	`id_visibility` int NOT NULL AUTO_INCREMENT,
	`code` varchar(5) NOT NULL UNIQUE,
	`description` varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY (`id_visibility`)
);

CREATE TABLE `sale` (
	`id_sale` int NOT NULL AUTO_INCREMENT,
	`price` int NOT NULL,
	`id_post` int NOT NULL,
	`id_promo` int NOT NULL,
	PRIMARY KEY (`id_sale`)
);

CREATE TABLE `promo` (
	`id_Promo` int NOT NULL AUTO_INCREMENT,
	`code` varchar(5) NOT NULL UNIQUE,
	`description` varchar(20) NOT NULL,
	PRIMARY KEY (`id_Promo`)
);

CREATE TABLE `category` (
	`id_category` int NOT NULL AUTO_INCREMENT,
	`code` varchar(5) NOT NULL UNIQUE,
	`name` varchar(10) NOT NULL,
	PRIMARY KEY (`id_category`)
);

CREATE TABLE `commonExpenses` (
	`id_common_expenses` int NOT NULL AUTO_INCREMENT,
	`price` int NOT NULL,
	`description` varchar(50) NOT NULL,
	`creationDate` DATE NOT NULL,
	`dueDate` DATE NOT NULL,
	`idCommunity` int NOT NULL,
	`idUser` int NOT NULL,
	`idCommonExpenseState` int NOT NULL,
	PRIMARY KEY (`id_common_expenses`)
);

CREATE TABLE `commonExpenseState` (
	`id_common_expense_state` int NOT NULL AUTO_INCREMENT,
	`code` varchar(5) NOT NULL UNIQUE,
	`description` varchar(20) NOT NULL,
	PRIMARY KEY (`id_common_expense_state`)
);

CREATE TABLE `userState` (
	`id_user_state` int NOT NULL AUTO_INCREMENT,
	`code` varchar(5) NOT NULL UNIQUE,
	`description` varchar(20) NOT NULL,
	PRIMARY KEY (`id_user_state`)
);

CREATE TABLE `sale_category` (
	`id_sale_category` int NOT NULL AUTO_INCREMENT,
	`id_sale` int NOT NULL,
	`id_category` int NOT NULL,
	PRIMARY KEY (`id_sale_category`)
);

CREATE TABLE `imgSale` (
	`id_img` int NOT NULL AUTO_INCREMENT,
	`url` varchar(255) NOT NULL UNIQUE,
	`idSale` int NOT NULL,
	PRIMARY KEY (`id_img`)
);

ALTER TABLE `user` ADD CONSTRAINT `user_fk0` FOREIGN KEY (`idUserState`) REFERENCES `userState`(`id_user_state`);

ALTER TABLE `community` ADD CONSTRAINT `community_fk0` FOREIGN KEY (`idUsuarioAdministrador`) REFERENCES `user`(`id_user`);

ALTER TABLE `user_community` ADD CONSTRAINT `user_community_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id_community`);

ALTER TABLE `user_community` ADD CONSTRAINT `user_community_fk1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id_user`);

ALTER TABLE `invitation` ADD CONSTRAINT `invitation_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id_community`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk0` FOREIGN KEY (`idPost`) REFERENCES `post`(`id_post`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id_user`);

ALTER TABLE `post` ADD CONSTRAINT `post_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id_community`);

ALTER TABLE `post` ADD CONSTRAINT `post_fk1` FOREIGN KEY (`idAuthor`) REFERENCES `user`(`id_user`);

ALTER TABLE `post` ADD CONSTRAINT `post_fk2` FOREIGN KEY (`idVisibility`) REFERENCES `visibility`(`id_visibility`);

ALTER TABLE `announcement` ADD CONSTRAINT `announcement_fk0` FOREIGN KEY (`idPost`) REFERENCES `post`(`id_post`);

ALTER TABLE `sale` ADD CONSTRAINT `sale_fk0` FOREIGN KEY (`id_post`) REFERENCES `post`(`id_post`);

ALTER TABLE `sale` ADD CONSTRAINT `sale_fk1` FOREIGN KEY (`id_promo`) REFERENCES `promo`(`id_Promo`);

ALTER TABLE `commonExpenses` ADD CONSTRAINT `commonExpenses_fk0` FOREIGN KEY (`idCommunity`) REFERENCES `community`(`id_community`);

ALTER TABLE `commonExpenses` ADD CONSTRAINT `commonExpenses_fk1` FOREIGN KEY (`idUser`) REFERENCES `user`(`id_user`);

ALTER TABLE `commonExpenses` ADD CONSTRAINT `commonExpenses_fk2` FOREIGN KEY (`idCommonExpenseState`) REFERENCES `commonExpenseState`(`id_common_expense_state`);

ALTER TABLE `sale_category` ADD CONSTRAINT `sale_category_fk0` FOREIGN KEY (`id_sale`) REFERENCES `sale`(`id_sale`);

ALTER TABLE `sale_category` ADD CONSTRAINT `sale_category_fk1` FOREIGN KEY (`id_category`) REFERENCES `category`(`id_category`);

ALTER TABLE `imgSale` ADD CONSTRAINT `imgSale_fk0` FOREIGN KEY (`idSale`) REFERENCES `sale`(`id_sale`);

