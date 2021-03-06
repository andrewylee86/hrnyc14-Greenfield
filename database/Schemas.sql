DROP DATABASE IF EXISTS Devterest;
CREATE DATABASE Devterest;

USE Devterest;

DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS UsersLinks;
DROP TABLE IF EXISTS LinksTags;

CREATE TABLE links (
	id_links int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	kind VARCHAR(50) NOT NULL,
	votes int(20) DEFAULT 0,
	shares int(20) DEFAULT 1,
	addedAt DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE users (
	id_users int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(30) NOT NULL,
	email VARCHAR(75),
	addedAt DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE tags (
	id_tags int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tagName VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE UsersLinks (
	id_ul int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	links_id INT(10),
	users_id INT(10),
	FOREIGN KEY(links_id) REFERENCES links(id_links) ON DELETE CASCADE,
	FOREIGN KEY(users_id) REFERENCES users(id_users) ON DELETE CASCADE
);

CREATE TABLE LinksTags (
	id_lt int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	links_id INT(10),
	tags_id INT(10),
	FOREIGN KEY(links_id) REFERENCES links(id_links) ON DELETE CASCADE,
	FOREIGN KEY(tags_id) REFERENCES tags(id_tags) ON DELETE CASCADE
);



INSERT INTO users (username, email) VALUES ('mrMustachos', "billdomanick@gmail.com");
INSERT INTO users (username, email) VALUES ('pedrobarquinha', "barquinha.pedro@gmail.com");



