-- Création de la base de données pour l'exécution des requêtes suivantes
CREATE DATABASE IF NOT EXISTS adminbdd_td1;

-- Question 2 (Code généré avec Looping)
CREATE TABLE Etudiant(
   matricule INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   date_naissance DATE,
   adresse VARCHAR(50),
   PRIMARY KEY(matricule)
);

CREATE TABLE Enseignant(
   id_enseignant INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   specialite VARCHAR(50),
   PRIMARY KEY(id_enseignant)
);

CREATE TABLE Salle(
   numero_salle INT,
   capacite INT,
   PRIMARY KEY(numero_salle)
);

CREATE TABLE Cours(
   code_cours INT,
   nom_cours VARCHAR(50),
   credits INT,
   id_enseignant INT NOT NULL,
   PRIMARY KEY(code_cours),
   FOREIGN KEY(id_enseignant) REFERENCES Enseignant(id_enseignant)
);

CREATE TABLE Derouler(
   code_cours INT,
   numero_salle INT,
   datetime_cours DATETIME,
   PRIMARY KEY(code_cours, numero_salle),
   FOREIGN KEY(code_cours) REFERENCES Cours(code_cours),
   FOREIGN KEY(numero_salle) REFERENCES Salle(numero_salle)
);

CREATE TABLE Participer(
   matricule INT,
   code_cours INT,
   PRIMARY KEY(matricule, code_cours),
   FOREIGN KEY(matricule) REFERENCES Etudiant(matricule),
   FOREIGN KEY(code_cours) REFERENCES Cours(code_cours)
);


-- Question 3
INSERT INTO Etudiant (matricule, nom, prenom, date_naissance, adresse)
VALUES
(1, 'Torvalds', 'Linus', '1969-12-28', '91 Rue Nationale, 59800 Lille'),
(2, 'Turing', 'Alan', '1912-06-23', '91 Rue Nationale, 59800 Lille'),
(3, 'Musk', 'Elon', '1971-06-28', '91 Rue Nationale, 59800 Lille'),
(4, 'Gates', 'Bill', '1955-10-28', '91 Rue Nationale, 59800 Lille'),
(5, 'Persson', 'Markus Alexej', '1979-06-01', '91 Rue Nationale, 59800 Lille');

INSERT INTO Enseignant (id_enseignant, nom, prenom, specialite)
VALUES
(1, 'Zuckerberg', 'Marc', 'Social Network dev'),
(2, 'Hopper', 'Grace', 'OS dev'),
(3, 'Miyamoto', 'Shigeru', 'Game dev'),
(4, 'Wozniak', 'Steve', 'Mobile dev'),
(5, 'Page', 'Larry', 'Web dev');

INSERT INTO Salle (numero_salle, capacite)
VALUES
(101, 30),
(102, 25),
(103, 40),
(104, 35),
(105, 20);

INSERT INTO Cours (code_cours, nom_cours, credits, id_enseignant)
VALUES
(1, 'Social Network dev', 3, 1),
(2, 'OS dev', 4, 2),
(3, 'Game dev', 3, 3),
(4, 'Mobile dev', 2, 4),
(5, 'Web dev', 6, 5);

INSERT INTO Derouler (code_cours, numero_salle, datetime_cours)
VALUES
(1, 101, '2023-02-15 10:00:00'),
(2, 102, '2023-02-16 14:30:00'),
(3, 103, '2023-02-17 09:45:00'),
(4, 104, '2023-02-18 11:15:00'),
(5, 105, '2023-02-19 13:00:00');

INSERT INTO Participer (matricule, code_cours)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Question 4
UPDATE Etudiant 
SET adresse='404 Rue Nationale, 59800 Lille' 
WHERE matricule=1;

-- Question 5
DELETE FROM Derouler
WHERE numero_salle=101;

-- Question 6
-- il n'y avait pas de question 6 dans le sujet

-- Question 7
-- je n'ai pas pu exécuter cette commande sur ma base de données
-- mon utilisateur n'a pas les permissions d'effectuer un GRANT et mon serveur n'est pas configuré pour permettre à root
-- de se connecter à distance
CREATE USER 'FinanceUser'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON adminbdd_td1.Cours TO 'FinanceUser'@'localhost';
FLUSH PRIVILEGES;

-- Question 8
REVOKE ALL PRIVILEGES ON DATABASE adminbdd_td1 FROM 'FinanceUser'@'localhost';

-- Question 9
-- Comme pour la question 6, il n'y a pas de question 9 dans le sujet

-- Question 10
-- Je ne mets pas les vrais identifiants de mon utilisateur pour des raisons évidentes
-- mysqldump -u [user] -p[password] --databases adminbdd_td1 > backup.sql

-- Question 11
/*
    - mot de passe fort
    - mise en place du moindre privilège quitte à créer de nombreux utilisateurs avec peu de permissions
    - chiffrement des communications avec des protocoles comme SSL ou TLS
    - système de journalisation robuste pour enregistrer les activités sur la base
    - surveiller régulièrement ces journaux
    - effectuer des backups régulières de la base de données
    - garder plusieurs copies de chaque backup à des endroits différents
    - configuration des règles du pare feu pour limiter l'accès à la base
*/