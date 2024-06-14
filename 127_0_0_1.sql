-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 14 juin 2024 à 09:54
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `folio`
--
CREATE DATABASE IF NOT EXISTS `folio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `folio`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`) VALUES
(1, 'TP'),
(2, 'diplôme'),
(3, 'attestation'),
(4, 'stage'),
(5, 'job etudiant'),
(6, 'expérience pro'),
(7, 'veille légale'),
(8, 'veille technique');

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

DROP TABLE IF EXISTS `competence`;
CREATE TABLE IF NOT EXISTS `competence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`id`, `nom`) VALUES
(1, 'Montage vidéo'),
(2, 'php'),
(3, 'pack office'),
(4, 'configuration routeur et switch'),
(5, 'Docker');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240530083700', '2024-05-30 08:37:55', 106),
('DoctrineMigrations\\Version20240530085526', '2024-05-30 08:55:30', 165),
('DoctrineMigrations\\Version20240530091046', '2024-05-30 09:11:07', 33),
('DoctrineMigrations\\Version20240531093704', '2024-05-31 09:37:30', 98);

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE IF NOT EXISTS `experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `date_d` datetime NOT NULL,
  `date_f` datetime DEFAULT NULL,
  `nom_etablissement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville_etablissement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_poste` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_590C10312469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `experience`
--

INSERT INTO `experience` (`id`, `category_id`, `date_d`, `date_f`, `nom_etablissement`, `ville_etablissement`, `nom_poste`, `mission`, `responsable`) VALUES
(1, 4, '2019-12-09 08:00:00', '2019-12-13 00:00:00', 'Cabinet Cecile', 'Grenoble, Seyssins Expert-comptable', 'Stagiaire', 'Remplir des fiches de paies, gérér l\'entrée de la TVA et TTC, classifier des dossiers juridiques, Trier des fichiers clients,', 1);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `niveau_id` int NOT NULL,
  `category_id` int NOT NULL,
  `nom_etablissement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville_etablissement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distanciel` tinyint(1) NOT NULL,
  `date_d` datetime NOT NULL,
  `date_f` datetime DEFAULT NULL,
  `nom_formation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_404021BFB3E9C81` (`niveau_id`),
  KEY `IDX_404021BF12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `niveau_id`, `category_id`, `nom_etablissement`, `ville_etablissement`, `distanciel`, `date_d`, `date_f`, `nom_formation`, `specialite`) VALUES
(1, 1, 2, 'IUT Roanne UJM Jean Monnet', 'Roanne', 0, '2023-09-04 00:00:00', '2024-06-29 00:00:00', 'BUT', 'Réseau et Télécommunication'),
(2, 2, 2, 'IUT1 Grenoble (en cours de formation)', 'Grenoble, Saint Martin D\'Hères', 0, '2024-09-02 00:00:00', '2025-06-30 00:00:00', 'BUT RT', 'devclound'),
(3, 1, 2, 'Lycée Polyvalent Vaucanson', 'Grenoble', 0, '2022-09-05 08:00:00', '2023-07-06 00:00:00', 'Bac STI2D', 'SIN (science et d\'informations numériques)');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `nom`) VALUES
(1, 'bac'),
(2, 'bac+2'),
(3, 'bac+3'),
(4, 'bac+4');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'nathan.lacombe@etu.univ-st-etienne.fr', '[]', '$2y$13$1b7837BIDXP2hBgc77sb3ODn6BoqCZPi.52thfyh4zHO5mETGrUl.');

-- --------------------------------------------------------

--
-- Structure de la table `veille`
--

DROP TABLE IF EXISTS `veille`;
CREATE TABLE IF NOT EXISTS `veille` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_d` datetime NOT NULL,
  `acquisition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veille_continue` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CE188CF312469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `veille`
--

INSERT INTO `veille` (`id`, `category_id`, `nom`, `date_d`, `acquisition`, `veille_continue`) VALUES
(1, 8, 'Actualité', '2023-06-14 00:00:00', 'Références sources ; LeMonde.fr', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `FK_590C10312469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BF12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_404021BFB3E9C81` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`);

--
-- Contraintes pour la table `veille`
--
ALTER TABLE `veille`
  ADD CONSTRAINT `FK_CE188CF312469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
