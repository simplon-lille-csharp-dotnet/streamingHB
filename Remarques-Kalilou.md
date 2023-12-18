1) CREATE DATABASE movies;  au lieu de CREATE movies;
  

2) L'utilisation d'une clé primaire auto-incrémentée (AUTO_INCREMENT dans MySQL) est recommandée.
Lorsque tu utilises une clé auto-incrémentée, la base de données gère automatiquement l'attribution 
de valeurs uniques à cette clé. Cela simplifie la gestion et évite les conflits potentiels.


3) pour les SGBD sensibiles à la casse il faut remplacer Films par films  
ALTER TABLE Films ADD COLUMN acteur_id INT
ALTER TABLE Films ADD COLUMN realisateur_id INT
ALTER TABLE Films ADD CONSTRAINT fk_acteur FOREIGN KEY (acteur_id) REFERENCES Acteurs(acteur_id)
ALTER TABLE films ADD CONSTRAINT fk_realisateur FOREIGN KEY (realisateur_id) REFERENCES realisateurs(realisateur_id);

4) Il faut éleminer les accents (réalisateur_id et prénom) pour pouvoir faire des insert 
INSERT INTO Réalisateurs (réalisateur_id, nom, prénom)
