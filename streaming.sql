-- Creation de la base de données streaming 

CREATE DATABASE streaming;

--Creation de la table user

CREATE TABLE user (
id_user INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
email_user VARCHAR(50),
password_user VARCHAR(50),
created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_date  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

--Creation de la table movie

CREATE TABLE movie(
id_movie INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
title VARCHAR(50),
duration INT,
release_year INT,
created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_date  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

--Creation de la table actor

CREATE TABLE actor(
    id_actor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name_actor VARCHAR(50) NOT NULL,
    last_name_actor VARCHAR(50) NOT NULL,
    birthdate_actor DATE,
    created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_date  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

--Creation de la table director
 
CREATE TABLE director (
	id_director INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name_director VARCHAR(50) NOT NULL,
    last_name_director VARCHAR(50) NOT NULL,
    created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_date  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)

--- Modification de la table movie : ajout de la contrainte clé étrangère
--  référencer la colonne id_director de la table director

ALTER TABLE movie ADD id_director INT NOT NULL;
ALTER TABLE movie ADD CONSTRAINT fk_id_director FOREIGN KEY (id_director) REFERENCES director(id_director);

--Creation de la table perform

CREATE TABLE perform(
	role VARCHAR(50),
    is_lead_role BIT NOT NULL,
    id_actor INT NOT NULL,
    id_movie INT NOT NULL,
    PRIMARY KEY (id_actor, id_movie),
    FOREIGN KEY (id_actor) REFERENCES actor(id_actor),
    FOREIGN KEY (id_movie ) REFERENCES movie(id_movie )
)

--Creation de la table favorite

CREATE TABLE favorite(
	id_user INT NOT NULL,
	id_movie INT NOT NULL,
    PRIMARY KEY (id_user, id_movie),
    FOREIGN KEY (id_movie) REFERENCES movie(id_movie),
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

--  ajouter ON UPDATE CURRENT_TIMESTAMP pour la table user
ALTER TABLE users
MODIFY updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

--  ajouter ON UPDATE CURRENT_TIMESTAMP pour la table movie
ALTER TABLE movie
MODIFY updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

--  ajouter ON UPDATE CURRENT_TIMESTAMP pour la table actor
ALTER TABLE actor
MODIFY updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

--  ajouter ON UPDATE CURRENT_TIMESTAMP pour la table director
ALTER TABLE director
MODIFY updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;