CREATE TABLE `user` (
	`id_user` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`mail` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`picURL` varchar(255),
	PRIMARY KEY (`id_user`)
);

CREATE TABLE `community` (
	`id_community` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`direction` varchar(100) NOT NULL,
	PRIMARY KEY (`id_community`)
);

CREATE TABLE `user_community` (
	`id_user_community` int NOT NULL AUTO_INCREMENT,
	`id_community` int NOT NULL,
	`id_user` int NOT NULL,
	PRIMARY KEY (`id_user_community`)
);

CREATE TABLE `invitation` (
	`id_invitation` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`token` varchar(255) NOT NULL UNIQUE,
	`id_community` int NOT NULL,
	PRIMARY KEY (`id_invitation`)
);

CREATE TABLE `announcement` (
	`id_announcement` int NOT NULL AUTO_INCREMENT,
	`title` varchar(50) NOT NULL,
	`text` varchar(255) NOT NULL,
	`color_hex` varchar(7) NOT NULL,
	`id_community` int NOT NULL,
	PRIMARY KEY (`id_announcement`)
);

CREATE TABLE `sale` (
	`id_sale` int NOT NULL AUTO_INCREMENT,
	`title` varchar(50) NOT NULL,
	`text` varchar(255) NOT NULL,
	`price` int NOT NULL,
	`id_community` int NOT NULL,
	`id_author` int NOT NULL,
	PRIMARY KEY (`id_sale`)
);

CREATE TABLE `common_expenses` (
	`id_common_expenses` int NOT NULL AUTO_INCREMENT,
	`price` int NOT NULL,
	`description` varchar(50),
	`due_date` DATE NOT NULL,
	`id_community` int NOT NULL,
	`id_user` int NOT NULL,
	PRIMARY KEY (`id_common_expenses`)
);

CREATE TABLE `img_sale` (
	`id_img` int NOT NULL AUTO_INCREMENT,
	`url` varchar(255) NOT NULL UNIQUE,
	`id_sale` int NOT NULL,
	PRIMARY KEY (`id_img`)
);

ALTER TABLE `user_community` ADD CONSTRAINT `user_community_fk0` FOREIGN KEY (`id_community`) REFERENCES `community`(`id_community`);

ALTER TABLE `user_community` ADD CONSTRAINT `user_community_fk1` FOREIGN KEY (`id_user`) REFERENCES `user`(`id_user`);

ALTER TABLE `invitation` ADD CONSTRAINT `invitation_fk0` FOREIGN KEY (`id_community`) REFERENCES `community`(`id_community`);

ALTER TABLE `announcement` ADD CONSTRAINT `announcement_fk0` FOREIGN KEY (`id_community`) REFERENCES `community`(`id_community`);

ALTER TABLE `sale` ADD CONSTRAINT `sale_fk0` FOREIGN KEY (`id_community`) REFERENCES `community`(`id_community`);

ALTER TABLE `sale` ADD CONSTRAINT `sale_fk1` FOREIGN KEY (`id_author`) REFERENCES `user`(`id_user`);

ALTER TABLE `common_expenses` ADD CONSTRAINT `common_expenses_fk0` FOREIGN KEY (`id_community`) REFERENCES `community`(`id_community`);

ALTER TABLE `common_expenses` ADD CONSTRAINT `common_expenses_fk1` FOREIGN KEY (`id_user`) REFERENCES `user`(`id_user`);

ALTER TABLE `img_sale` ADD CONSTRAINT `img_sale_fk0` FOREIGN KEY (`id_sale`) REFERENCES `sale`(`id_sale`);

