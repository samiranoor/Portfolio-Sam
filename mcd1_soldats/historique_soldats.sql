-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 03 fév. 2026 à 09:57
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `historique_soldats`
--

-- --------------------------------------------------------

--
-- Structure de la table `affecte`
--

CREATE TABLE `affecte` (
  `code_soldat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Code_unite` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Date_affection` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `batailles`
--

CREATE TABLE `batailles` (
  `code_bataille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Lieu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Date_debut` date NOT NULL,
  `Date_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blesse`
--

CREATE TABLE `blesse` (
  `code_soldat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `code_blessure` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `code_bataille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Date_blessure` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blessures`
--

CREATE TABLE `blessures` (
  `code_blessure` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Type_blessure` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `grades`
--

CREATE TABLE `grades` (
  `code_grade` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `intitule_grade` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promu`
--

CREATE TABLE `promu` (
  `code_soldat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `code_grade` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Date_promotion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `soldats`
--

CREATE TABLE `soldats` (
  `code_soldat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nom_soldat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Prenom_soldat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Date_naissance` date NOT NULL,
  `Date_deces` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `unites`
--

CREATE TABLE `unites` (
  `Code_unite` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Nom_unite` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affecte`
--
ALTER TABLE `affecte`
  ADD PRIMARY KEY (`code_soldat`,`Code_unite`);

--
-- Index pour la table `batailles`
--
ALTER TABLE `batailles`
  ADD PRIMARY KEY (`code_bataille`);

--
-- Index pour la table `blesse`
--
ALTER TABLE `blesse`
  ADD PRIMARY KEY (`code_soldat`,`code_blessure`,`code_bataille`),
  ADD KEY `Blesse_code_blessure_FK` (`code_blessure`),
  ADD KEY `Blesse_code_bataille_FK` (`code_bataille`);

--
-- Index pour la table `blessures`
--
ALTER TABLE `blessures`
  ADD PRIMARY KEY (`code_blessure`);

--
-- Index pour la table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`code_grade`);

--
-- Index pour la table `promu`
--
ALTER TABLE `promu`
  ADD PRIMARY KEY (`code_soldat`,`code_grade`),
  ADD KEY `Promu_code_grade_FK` (`code_grade`);

--
-- Index pour la table `soldats`
--
ALTER TABLE `soldats`
  ADD PRIMARY KEY (`code_soldat`);

--
-- Index pour la table `unites`
--
ALTER TABLE `unites`
  ADD PRIMARY KEY (`Code_unite`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affecte`
--
ALTER TABLE `affecte`
  ADD CONSTRAINT `Affecte_code_soldat_FK` FOREIGN KEY (`code_soldat`) REFERENCES `soldats` (`code_soldat`);

--
-- Contraintes pour la table `blesse`
--
ALTER TABLE `blesse`
  ADD CONSTRAINT `Blesse_code_bataille_FK` FOREIGN KEY (`code_bataille`) REFERENCES `batailles` (`code_bataille`),
  ADD CONSTRAINT `Blesse_code_blessure_FK` FOREIGN KEY (`code_blessure`) REFERENCES `blessures` (`code_blessure`),
  ADD CONSTRAINT `Blesse_code_soldat_FK` FOREIGN KEY (`code_soldat`) REFERENCES `soldats` (`code_soldat`);

--
-- Contraintes pour la table `promu`
--
ALTER TABLE `promu`
  ADD CONSTRAINT `Promu_code_grade_FK` FOREIGN KEY (`code_grade`) REFERENCES `grades` (`code_grade`),
  ADD CONSTRAINT `Promu_code_soldat_FK` FOREIGN KEY (`code_soldat`) REFERENCES `soldats` (`code_soldat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
