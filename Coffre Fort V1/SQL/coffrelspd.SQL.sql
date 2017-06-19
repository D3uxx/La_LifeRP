-- Généré le :  Dim 18 Juin 2017 à 23:51
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

--
-- Structure de la table `coffre_fort`
--

CREATE TABLE `coffre_fort` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `solde` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `soldesale` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `lasttransfert` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `lasttransfertsale` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour la table `coffre_fort`
--
ALTER TABLE `coffre_fort`
  ADD PRIMARY KEY (`identifier`);


--Createur Nelyo  :   https://github.com/ElNelyo/cop-coffre

--Modifications et Ameliorations  : Irtas Momaki / Walter White