# Streaming-HB 🎬🍿🎥

Bienvenue à Streaming-HB, où même nos serveurs prennent des pauses popcorn ! 🎬🍿

## Author

- Hafawa Bargaoui

## Installation de XAMPP

## Prérequis

Assurez-vous que votre système répond aux exigences minimales avant d'installer XAMPP.

- **Système d'exploitation :** Windows, macOS, Linux
- **Espace disque :** Au moins 500 Mo disponibles
- **Mémoire RAM :** Au moins 1 Go recommand

## Instructions d'Installation

1. **Téléchargement :**

   - Rendez-vous sur le [site officiel de XAMPP](https://www.apachefriends.org/index.html).
   - Téléchargez la version appropriée pour votre système d'exploitation.

2. **Lancement de l'Installateur :**

   - Sur Windows, exécutez le fichier d'installation `.exe`.
   - Sur macOS, ouvrez le fichier `.dmg` et faites glisser l'icône XAMPP vers votre dossier Applications.
   - Sur Linux, exécutez le script d'installation à partir du terminal.

3. **Configuration de XAMPP :**

   - Sur Windows, suivez les instructions de l'installateur.
   - Sur macOS, vous devrez peut-être donner la permission d'ouvrir l'application depuis un développeur non identifié dans les préférences système.

4. **Démarrage de XAMPP :**

   - Sur Windows, exécutez XAMPP Control Panel en tant qu'administrateur et démarrez les modules nécessaires (Apache, MySQL, etc.).
   - Sur macOS, ouvrez XAMPP depuis le dossier Applications.
   - Sur Linux, ouvrez un terminal et exécutez `sudo /opt/lampp/manager-linux-x64.run` (ajustez le chemin selon votre installation).

5. **Vérification de l'Installation :**
   - Ouvrez votre navigateur web et accédez à [http://localhost](http://localhost).
   - Si tout est correctement installé, vous verrez le tableau de bord de XAMPP.

## Documentation et Ressources

- [Documentation officielle de XAMPP](https://www.apachefriends.org/documentation.html)
- [Forums XAMPP](https://community.apachefriends.org/f/)

## Problèmes Connus

- Sur macOS, vous pourriez rencontrer des problèmes avec les autorisations. Assurez-vous que les fichiers et les répertoires ont les autorisations appropriées.

## Licence

XAMPP est distribué sous la [licence Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0).

## Liste de Requêtes SQL

Bienvenue dans la liste de requêtes SQL pour notre base de données. Ces requêtes vous seront utiles pour effectuer diverses opérations sur les données.

### Les titres et dates de sortie des films du plus récent au plus ancien

```sql
SELECT title, release_year FROM movie ORDER BY release_year DESC;
```

### Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique (prénom d'abord, puis nom)

```sql
SELECT
    first_name_actor,
    last_name_actor,
    TIMESTAMPDIFF(YEAR, birthdate_actor, CURDATE()) AS age
FROM
    actor
WHERE
    TIMESTAMPDIFF(YEAR, birthdate_actor, CURDATE()) > 30
    ORDER BY first_name_actor,  last_name_actor;

```

### La liste des acteurs/actrices principaux pour un film donné

```sql
    actor.first_name_actor,
    actor.last_name_actor,
    perform.role
FROM
    actor
JOIN
    perform ON actor.id_actor = perform.id_actor
JOIN
    movie ON perform.id_movie = movie.id_movie
WHERE
    movie.title = 'Eyes Wide Shut' AND
    perform.is_lead_role = 1;
```

### Modifier un film

```sql
UPDATE movie
SET
  duration = 194
  WHERE
  id_movie = 2;
```

### Supprimer un acteur/actrice

```sql
DELETE FROM actor
WHERE id_actor = 2;
```

### Afficher les 3 derniers acteurs/actrices ajouté(e)s

```sql
SELECT \*
FROM actor
ORDER BY created_date DESC
LIMIT 3;
```
