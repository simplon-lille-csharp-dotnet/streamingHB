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
    id_movie INT NOT NULL
    );
    
ALTER TABLE perform
ADD PRIMARY KEY (id_actor, id_movie),
    
ALTER TABLE perform 
ADD CONSTRAINT fk_perform_actor
FOREIGN KEY (id_actor) REFERENCES actor (id_actor)
ON DELETE CASCADE; 

ALTER TABLE perform 
ADD CONSTRAINT fk_perform_movie
FOREIGN KEY (id_movie) REFERENCES movie (id_movie)
ON DELETE CASCADE;

ALTER TABLE perform 
ADD CONSTRAINT fk_perform_actor
FOREIGN KEY (id_actor) REFERENCES actor (id_actor);

ALTER TABLE perform
ADD COLUMN created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE perform
ADD COLUMN updated_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
--Creation de la table favorite

CREATE TABLE favorite(
	id_user INT NOT NULL,
	id_movie INT NOT NULL,
    created_date timestamp default LOCALTIMESTAMP,
    updated_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(id_user, id_movie),
	FOREIGN KEY(id_user) REFERENCES users(id_user) ON DELETE CASCADE,
	FOREIGN KEY(id_movie) REFERENCES movie(id_movie) ON DELETE CASCADE
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

-- Ajout de données initiales dans la table 'users'

INSERT INTO users (email_user, password_user) VALUES ("hafewa.bargaoui@gmail.com", "123456789");
INSERT INTO users (email_user, password_user) VALUES ("marwa.aloui@gmail.com", "azerty");
INSERT INTO users (email_user, password_user) VALUES ("evans.baker@hotmail.fr", "123852");
INSERT INTO users (email_user, password_user) VALUES ("usman.white@yahoo.fr", "ytreeza");

-- Ajout de données initiales dans la table 'director'

INSERT INTO director (first_name_director, last_name_director) VALUES ("James", "Cameron");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Alfred", "Hitchcock");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Jack", "Clayton");
INSERT INTO director (first_name_director, last_name_director) VALUES ("David", "Lean");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Michael", "Cimino");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Milos", "Forman");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Ridley", "Scott");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Stanley", "Kubrick");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Bryan", "Singer");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Roman", "Polanski");
INSERT INTO director (first_name_director, last_name_director) VALUES ("Christopher", "Nolan");

-- Ajout de données initiales dans la table 'movie'

INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Titanic",230 , 1997,1);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Vertigo", 128,1958,9);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("The Innocents",100 ,1961,8);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Lawrence of Arabia",216 ,1962,9);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("The Deer Hunter",183,1978,10);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Amadeus",160 ,1984,2);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Blade Runner",117,1982,2);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Eyes Wide Shut",159,1999,3);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("The Usual Suspects",106,2004,4);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Chinatown",117,2013,5);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Boogie Nights",159,2022,6);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Annie Hall",106,1943,1);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Princess Mononoke",130,2023,10);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("The Shawshank Redemption",155,1989,7);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("American Beauty",174,2021,11);
INSERT INTO movie(title, duration, release_year, id_director) VALUES ("Good Will Hunting ",198,2002,1);

-- Ajout de données initiales dans la table 'actor'

INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("James", "Stewart", '1958-08-24');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Ali", "Astin", '2003-12-11');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Deborah", "Kerr", '1982-07-30');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Peter", "OToole", '1962-06-17');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Robert", "De Niro", '1942-01-25');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("F. Murray", "Abraham", '1976-03-12');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Harrison", "FORD", '1990-02-02');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Nicole", "Kidman", '1967-09-29');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Jack", "Nicholson", '1973-02-01');
INSERT INTO actor (first_name_actor, last_name_actor,birthdate_actor)VALUES ("Jack", "Nalon", '1989-07-04');

-- Ajout de données initiales dans la table 'favorite'

INSERT INTO favorite (id_user, id_movie) VALUES (1, 2);
INSERT INTO favorite (id_user, id_movie) VALUES (1, 5);
INSERT INTO favorite (id_user, id_movie) VALUES (1, 18);
INSERT INTO favorite (id_user, id_movie) VALUES (2, 11);
INSERT INTO favorite (id_user, id_movie) VALUES (2, 6);
INSERT INTO favorite (id_user, id_movie) VALUES (2, 18);
INSERT INTO favorite (id_user, id_movie) VALUES (4, 6);
INSERT INTO favorite (id_user, id_movie) VALUES (4, 8);
INSERT INTO favorite (id_user, id_movie) VALUES (4,9 );
INSERT INTO favorite (id_user, id_movie) VALUES (4,17 );

-- Ajout de données initiales dans la table 'perform'

INSERT INTO perform (role, is_lead_role, id_actor, id_movie) VALUES ("Alice Harford",1,10,10);
INSERT INTO perform (role, is_lead_role, id_actor, id_movie) VALUES ("Alex",1,4,10);
INSERT INTO perform (role, is_lead_role, id_actor, id_movie) VALUES ("Miss Giddens",0,4,18);
INSERT INTO perform (role, is_lead_role, id_actor, id_movie) VALUES ("San",0,7,10);
INSERT INTO perform (role, is_lead_role, id_actor, id_movie) VALUES ("Older Jamal",1,11,2);
