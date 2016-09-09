-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 09 Septembre 2016 à 15:02
-- Version du serveur :  5.6.30
-- Version de PHP :  5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `findjobs`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidats`
--

CREATE TABLE IF NOT EXISTS `candidats` (
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `adresseC` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cv` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lettreP` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cvs`
--

CREATE TABLE IF NOT EXISTS `cvs` (
  `infoNominative` varchar(100) NOT NULL,
  `nomCv` varchar(30) NOT NULL,
  `visibilite` enum('visible','limite','prive') NOT NULL,
  `permisTravail` varchar(100) NOT NULL,
  `niveauCarriere` varchar(100) NOT NULL,
  `niveauScolaire` varchar(100) NOT NULL,
  `titrePostRechercher` varchar(100) NOT NULL,
  `salaireMin` varchar(100) NOT NULL,
  `salaireMax` varchar(100) NOT NULL,
  `secteurActivite` varchar(100) NOT NULL,
  `metiers` varchar(100) NOT NULL,
  `lieuPoste` varchar(100) NOT NULL,
  `typePosteSouhaite` varchar(100) NOT NULL,
  `situtationEmploi` varchar(100) NOT NULL,
  `pretDemenager` varchar(100) NOT NULL,
  `pretVoyage` varchar(3) NOT NULL,
  `langue` varchar(100) NOT NULL,
  `quandCommancer` varchar(50) NOT NULL,
  `candidat_id` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `enterprises`
--

CREATE TABLE IF NOT EXISTS `enterprises` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL,
  `startOffers` date NOT NULL,
  `endOffers` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `displayDateOffers` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `responsabilities` varchar(255) NOT NULL,
  `aptitudes` varchar(255) NOT NULL,
  `requirement` varchar(255) NOT NULL,
  `asset` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `scholarity` varchar(255) NOT NULL,
  `activityArea` varchar(255) NOT NULL,
  `jobs` varchar(255) NOT NULL,
  `jobType` varchar(255) NOT NULL,
  `jobSituation` varchar(255) NOT NULL,
  `jobBeginningDate` int(11) NOT NULL,
  `enterprise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cvs`
--
ALTER TABLE `cvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidat_key` (`candidat_id`);

--
-- Index pour la table `enterprises`
--
ALTER TABLE `enterprises`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enterprise_key` (`enterprise_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `candidats`
--
ALTER TABLE `candidats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `cvs`
--
ALTER TABLE `cvs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `enterprises`
--
ALTER TABLE `enterprises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cvs`
--
ALTER TABLE `cvs`
  ADD CONSTRAINT `candidat_key` FOREIGN KEY (`candidat_id`) REFERENCES `candidats` (`id`);

--
-- Contraintes pour la table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `enterprise_key` FOREIGN KEY (`enterprise_id`) REFERENCES `enterprises` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
