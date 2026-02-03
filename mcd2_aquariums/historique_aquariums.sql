-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 03 fév. 2026 à 12:15
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
-- Base de données : `historique_aquariums`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id_animal` int NOT NULL,
  `ordre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `famille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_especes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bassin`
--

CREATE TABLE `bassin` (
  `id_animal` int NOT NULL,
  `id_deplacement` int NOT NULL,
  `id_bassin` int NOT NULL,
  `Volume` decimal(10,2) NOT NULL,
  `temperature` decimal(10,2) NOT NULL,
  `ordre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `famille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_deplacement` date NOT NULL,
  `id_especes` int NOT NULL,
  `id_animal_Deplacement` int NOT NULL,
  `id_bassin_depart` int NOT NULL,
  `id_bassin_arrivee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

CREATE TABLE `deplacement` (
  `id_animal_1` int NOT NULL,
  `id_deplacement` int NOT NULL,
  `date_deplacement` date NOT NULL,
  `ordre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `famille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_animal` int NOT NULL,
  `id_bassin_depart` int NOT NULL,
  `id_bassin_arrivee` int NOT NULL,
  `id_especes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `especes`
--

CREATE TABLE `especes` (
  `id_animal` int NOT NULL,
  `id_espece` int NOT NULL,
  `nom_scientifique` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `ordre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `famille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_especes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `soins`
--

CREATE TABLE `soins` (
  `id_animal_1` int NOT NULL,
  `id_soins` int NOT NULL,
  `date_soins` date NOT NULL,
  `nature_soins` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `resultat_soins` text COLLATE utf8mb4_general_ci NOT NULL,
  `ordre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `famille` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_animal` int NOT NULL,
  `id_especes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`);

--
-- Index pour la table `bassin`
--
ALTER TABLE `bassin`
  ADD PRIMARY KEY (`id_animal`,`id_deplacement`,`id_bassin`);

--
-- Index pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD PRIMARY KEY (`id_animal_1`,`id_deplacement`);

--
-- Index pour la table `especes`
--
ALTER TABLE `especes`
  ADD PRIMARY KEY (`id_animal`,`id_espece`);

--
-- Index pour la table `soins`
--
ALTER TABLE `soins`
  ADD PRIMARY KEY (`id_animal_1`,`id_soins`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bassin`
--
ALTER TABLE `bassin`
  ADD CONSTRAINT `Bassin_id_animal_id_deplacement_FK` FOREIGN KEY (`id_animal`,`id_deplacement`) REFERENCES `deplacement` (`id_animal_1`, `id_deplacement`);

--
-- Contraintes pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD CONSTRAINT `Deplacement_id_animal_1_FK` FOREIGN KEY (`id_animal_1`) REFERENCES `animal` (`id_animal`);

--
-- Contraintes pour la table `especes`
--
ALTER TABLE `especes`
  ADD CONSTRAINT `Especes_id_animal_FK` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`);

--
-- Contraintes pour la table `soins`
--
ALTER TABLE `soins`
  ADD CONSTRAINT `Soins_id_animal_1_FK` FOREIGN KEY (`id_animal_1`) REFERENCES `animal` (`id_animal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
