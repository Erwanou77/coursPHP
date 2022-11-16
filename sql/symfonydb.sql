-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3310
-- Généré le : mer. 16 nov. 2022 à 16:49
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `symfonydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`) VALUES
(1, 'Article 1', 'Contenu 1'),
(2, 'Article 2', 'Contenu 2'),
(3, 'test', 'etst');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221115104911', '2022-11-15 10:49:21', 176),
('DoctrineMigrations\\Version20221115162139', '2022-11-15 16:21:51', 144),
('DoctrineMigrations\\Version20221115163035', '2022-11-15 16:31:51', 72),
('DoctrineMigrations\\Version20221116082913', '2022-11-16 08:29:57', 149),
('DoctrineMigrations\\Version20221116140928', '2022-11-16 14:09:53', 220),
('DoctrineMigrations\\Version20221116141615', '2022-11-16 14:16:21', 107),
('DoctrineMigrations\\Version20221116145829', '2022-11-16 14:58:39', 225),
('DoctrineMigrations\\Version20221116150238', '2022-11-16 15:02:42', 126),
('DoctrineMigrations\\Version20221116150401', '2022-11-16 15:04:05', 193),
('DoctrineMigrations\\Version20221116150805', '2022-11-16 15:08:09', 128),
('DoctrineMigrations\\Version20221116151127', '2022-11-16 15:11:32', 201);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D6494A4A3511` (`vehicule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `vehicule_id`) VALUES
(1, 'erwan.launay77@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$e422vh3e1U6wAnkt1e1Onu90BF10XW5WWHNp9FcQoTl/VPl8Bjnaa', 'Erwan', 'LAUNAY', 2),
(2, 'demo@demo.fr', '[]', '$2y$13$022Z8iWtue6ubYAXFeyERunexVfV7gdedSvk57ty92GK6pFmytXI2', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `brand`, `color`) VALUES
(2, 'porsche', 'blue');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6494A4A3511` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
