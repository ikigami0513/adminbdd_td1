-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 04 déc. 2023 à 09:07
-- Version du serveur : 8.0.35-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `adminbdd_td1`
--

-- --------------------------------------------------------

--
-- Structure de la table `Cours`
--

CREATE TABLE `Cours` (
  `code_cours` int NOT NULL,
  `nom_cours` varchar(50) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  `id_enseignant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Cours`
--

INSERT INTO `Cours` (`code_cours`, `nom_cours`, `credits`, `id_enseignant`) VALUES
(1, 'Social Network dev', 3, 1),
(2, 'OS dev', 4, 2),
(3, 'Game dev', 3, 3),
(4, 'Mobile dev', 2, 4),
(5, 'Web dev', 6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Derouler`
--

CREATE TABLE `Derouler` (
  `code_cours` int NOT NULL,
  `numero_salle` int NOT NULL,
  `datetime_cours` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Derouler`
--

INSERT INTO `Derouler` (`code_cours`, `numero_salle`, `datetime_cours`) VALUES
(2, 102, '2023-02-16 14:30:00'),
(3, 103, '2023-02-17 09:45:00'),
(4, 104, '2023-02-18 11:15:00'),
(5, 105, '2023-02-19 13:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `Enseignant`
--

CREATE TABLE `Enseignant` (
  `id_enseignant` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `specialite` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Enseignant`
--

INSERT INTO `Enseignant` (`id_enseignant`, `nom`, `prenom`, `specialite`) VALUES
(1, 'Zuckerberg', 'Marc', 'Social Network dev'),
(2, 'Hopper', 'Grace', 'OS dev'),
(3, 'Miyamoto', 'Shigeru', 'Game dev'),
(4, 'Wozniak', 'Steve', 'Mobile dev'),
(5, 'Page', 'Larry', 'Web dev');

-- --------------------------------------------------------

--
-- Structure de la table `Etudiant`
--

CREATE TABLE `Etudiant` (
  `matricule` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Etudiant`
--

INSERT INTO `Etudiant` (`matricule`, `nom`, `prenom`, `date_naissance`, `adresse`) VALUES
(1, 'Torvalds', 'Linus', '1969-12-28', '404 Rue Nationale, 59800 Lille'),
(2, 'Turing', 'Alan', '1912-06-23', '91 Rue Nationale, 59800 Lille'),
(3, 'Musk', 'Elon', '1971-06-28', '91 Rue Nationale, 59800 Lille'),
(4, 'Gates', 'Bill', '1955-10-28', '91 Rue Nationale, 59800 Lille'),
(5, 'Persson', 'Markus Alexej', '1979-06-01', '91 Rue Nationale, 59800 Lille');

-- --------------------------------------------------------

--
-- Structure de la table `Participer`
--

CREATE TABLE `Participer` (
  `matricule` int NOT NULL,
  `code_cours` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Participer`
--

INSERT INTO `Participer` (`matricule`, `code_cours`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Salle`
--

CREATE TABLE `Salle` (
  `numero_salle` int NOT NULL,
  `capacite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Salle`
--

INSERT INTO `Salle` (`numero_salle`, `capacite`) VALUES
(101, 30),
(102, 25),
(103, 40),
(104, 35),
(105, 20);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`code_cours`),
  ADD KEY `id_enseignant` (`id_enseignant`);

--
-- Index pour la table `Derouler`
--
ALTER TABLE `Derouler`
  ADD PRIMARY KEY (`code_cours`,`numero_salle`),
  ADD KEY `numero_salle` (`numero_salle`);

--
-- Index pour la table `Enseignant`
--
ALTER TABLE `Enseignant`
  ADD PRIMARY KEY (`id_enseignant`);

--
-- Index pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD PRIMARY KEY (`matricule`);

--
-- Index pour la table `Participer`
--
ALTER TABLE `Participer`
  ADD PRIMARY KEY (`matricule`,`code_cours`),
  ADD KEY `code_cours` (`code_cours`);

--
-- Index pour la table `Salle`
--
ALTER TABLE `Salle`
  ADD PRIMARY KEY (`numero_salle`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD CONSTRAINT `Cours_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `Enseignant` (`id_enseignant`);

--
-- Contraintes pour la table `Derouler`
--
ALTER TABLE `Derouler`
  ADD CONSTRAINT `Derouler_ibfk_1` FOREIGN KEY (`code_cours`) REFERENCES `Cours` (`code_cours`),
  ADD CONSTRAINT `Derouler_ibfk_2` FOREIGN KEY (`numero_salle`) REFERENCES `Salle` (`numero_salle`);

--
-- Contraintes pour la table `Participer`
--
ALTER TABLE `Participer`
  ADD CONSTRAINT `Participer_ibfk_1` FOREIGN KEY (`matricule`) REFERENCES `Etudiant` (`matricule`),
  ADD CONSTRAINT `Participer_ibfk_2` FOREIGN KEY (`code_cours`) REFERENCES `Cours` (`code_cours`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
