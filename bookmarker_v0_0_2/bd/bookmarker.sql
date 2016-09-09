-- phpMyAdmin SQL Dump
-- version 4.2.0
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 30 Août 2016 à 15:38
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bookmarker`
--

-- --------------------------------------------------------

--
-- Structure de la table `bookmarks`
--

CREATE TABLE IF NOT EXISTS `bookmarks` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `title`, `description`, `url`, `created`, `modified`) VALUES
(2, 1, 'Google', 'engin de recherche', 'https://www.google.ca/', '2016-08-30 14:27:04', '2016-08-30 14:27:04'),
(3, 2, ' cmontmorency', 'collège', 'http://www.cmontmorency.qc.ca/', '2016-08-30 14:28:24', '2016-08-30 15:05:52'),
(4, 1, 'CakePHP', 'Framework PHP', 'http://book.cakephp.org/3.0/fr/contents.html', '2016-08-30 14:29:02', '2016-08-30 14:29:02');

-- --------------------------------------------------------

--
-- Structure de la table `bookmarks_tags`
--

CREATE TABLE IF NOT EXISTS `bookmarks_tags` (
  `bookmark_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `bookmarks_tags`
--

INSERT INTO `bookmarks_tags` (`bookmark_id`, `tag_id`) VALUES
(3, 1),
(4, 1),
(3, 2),
(2, 3),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'éducation', '2016-08-30 14:23:37', '2016-08-30 14:23:37'),
(2, 'Laval', '2016-08-30 14:23:56', '2016-08-30 14:23:56'),
(3, 'international', '2016-08-30 14:24:06', '2016-08-30 14:24:06');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'admin@admin.com', '$2y$10$e/qYfsncGaaXPw5AoJqD..hfPbSvNRgE/8OmW3MIGWw7DVlIbE1tS', '2016-08-30 14:25:51', '2016-08-30 14:33:41'),
(2, 'user@user.com', '$2y$10$X.hBV14tUJwt7tyQ1T9Ef.PxNMIYMrrWRvx1k1p3nVTe43cIVigeW', '2016-08-30 14:26:06', '2016-08-30 14:33:59');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bookmarks`
--
ALTER TABLE `bookmarks`
 ADD PRIMARY KEY (`id`), ADD KEY `user_key` (`user_id`);

--
-- Index pour la table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
 ADD PRIMARY KEY (`bookmark_id`,`tag_id`), ADD KEY `tag_key` (`tag_id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `title` (`title`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bookmarks`
--
ALTER TABLE `bookmarks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bookmarks`
--
ALTER TABLE `bookmarks`
ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
ADD CONSTRAINT `bookmarks_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
ADD CONSTRAINT `bookmarks_tags_ibfk_2` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
