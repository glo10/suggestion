-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 16 nov. 2018 à 10:20
-- Version du serveur :  10.1.36-MariaDB
-- Version de PHP :  7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `suggestions`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `libelle`) VALUES
(1, 'argent'),
(2, 'amour'),
(3, 'sagesse'),
(4, 'amitié'),
(5, 'chance'),
(6, 'femme'),
(7, 'homme'),
(8, 'réligion');

-- --------------------------------------------------------

--
-- Structure de la table `proverb`
--

CREATE TABLE `proverb` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `proverb`
--

INSERT INTO `proverb` (`id`, `body`) VALUES
(1, 'Le bonheur ne s\'acquiert pas, il ne réside pas dans les apparences, chacun d\'entre nous le construit à chaque instant de sa vie avec son coeur.'),
(2, 'Parmi les hommes, le plus faible est celui qui ne sait pas garder un secret. Le plus fort, celui qui maîtrise sa colère, le plus patient, celui qui cache sa pauvreté, le plus riche, celui qui se contente de la part que dieu lui a faite.'),
(3, 'Quand la pauvreté entre par la porte, l\'amour s\'en va par la fenêtre.'),
(4, 'Souviens-toi qu\'au moment de ta naissance tout le monde était dans la joie et toi dans les pleurs. Vis de manière qu\'au moment de ta mort, tout le monde soit dans les pleurs et toi dans la joie.'),
(5, 'Il vaut mieux se disputer avec quelqu\'un d\'intelligent que parler à un imbécile.'),
(6, 'Qui donne ne doit jamais s\'en souvenir. Qui reçoit ne doit jamais oublier.'),
(7, 'Le menteur, quand il dit la vérité, tombe malade.'),
(8, 'Une tente sans femme est comme un violon sans cordes.');

-- --------------------------------------------------------

--
-- Structure de la table `proverb_category`
--

CREATE TABLE `proverb_category` (
  `id` int(11) NOT NULL,
  `proverb_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `proverb_category`
--

INSERT INTO `proverb_category` (`id`, `proverb_id`, `category_id`) VALUES
(1, 5, 2),
(2, 3, 2),
(3, 1, 4),
(4, 2, 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `proverb`
--
ALTER TABLE `proverb`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `proverb_category`
--
ALTER TABLE `proverb_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proverb` (`proverb_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `proverb`
--
ALTER TABLE `proverb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `proverb_category`
--
ALTER TABLE `proverb_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `proverb_category`
--
ALTER TABLE `proverb_category`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `fk_proverb` FOREIGN KEY (`proverb_id`) REFERENCES `proverb` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
