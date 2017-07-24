-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 24 Juillet 2017 à 09:47
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.5.38

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduit`
--

CREATE TABLE `categorieproduit` (
  `ID` bigint(20) NOT NULL,
  `LIBELLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `entiteadministratif`
--

CREATE TABLE `entiteadministratif` (
  `ID` bigint(20) NOT NULL,
  `CREDITOUVERT` decimal(38,0) DEFAULT NULL,
  `LOGO` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `CHEF_LOGIN` varchar(255) DEFAULT NULL,
  `MAGASIN_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `expressionbesoin`
--

CREATE TABLE `expressionbesoin` (
  `ID` bigint(20) NOT NULL,
  `DATECREATION` date DEFAULT NULL,
  `TOTAL` bigint(20) DEFAULT NULL,
  `DEMANDEUR_LOGIN` varchar(255) DEFAULT NULL,
  `ENTITEADMINISTRATIF_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `expressionbesoinitem`
--

CREATE TABLE `expressionbesoinitem` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` text,
  `ETAT` int(11) DEFAULT NULL,
  `QTECONFIRME` bigint(20) DEFAULT NULL,
  `QTEDEMANDE` bigint(20) DEFAULT NULL,
  `EXPRESSIONBESOIN_ID` bigint(20) DEFAULT NULL,
  `CATEGORIEPRODUIT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `ID` bigint(20) NOT NULL,
  `DATECREATION` datetime DEFAULT NULL,
  `DATELIVRAISON` date DEFAULT NULL,
  `EXPRESSIONBESOIN_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livraisonitem`
--

CREATE TABLE `livraisonitem` (
  `ID` bigint(20) NOT NULL,
  `QTE` bigint(20) DEFAULT NULL,
  `QTEAVOIR` bigint(20) DEFAULT NULL,
  `LIVRAISON_ID` bigint(20) DEFAULT NULL,
  `MAGASIN_ID` bigint(20) DEFAULT NULL,
  `PRODUIT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `magasin`
--

CREATE TABLE `magasin` (
  `ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `magasin_stock`
--

CREATE TABLE `magasin_stock` (
  `Magasin_ID` bigint(20) NOT NULL,
  `stocks_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` text,
  `LIBELLE` varchar(255) DEFAULT NULL,
  `PRIX` decimal(38,0) DEFAULT NULL,
  `CATEGORIEPRODUIT_ID` bigint(20) DEFAULT NULL,
  `UNITEMESURE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produititem`
--

CREATE TABLE `produititem` (
  `ID` bigint(20) NOT NULL,
  `QTECONFIRM` bigint(20) DEFAULT NULL,
  `QTEDEMANDE` bigint(20) DEFAULT NULL,
  `PRODUIT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reception`
--

CREATE TABLE `reception` (
  `ID` bigint(20) NOT NULL,
  `DATECREATION` datetime DEFAULT NULL,
  `DATERECEPTION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `receptionitem`
--

CREATE TABLE `receptionitem` (
  `ID` bigint(20) NOT NULL,
  `QTE` bigint(20) DEFAULT NULL,
  `QTEAVOIR` bigint(20) DEFAULT NULL,
  `MAGASIN_ID` bigint(20) DEFAULT NULL,
  `PRODUIT_ID` bigint(20) DEFAULT NULL,
  `RECEPTION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `ID` bigint(20) NOT NULL,
  `QTE` decimal(38,0) DEFAULT NULL,
  `QTEDEFFECTUEUX` decimal(38,0) DEFAULT NULL,
  `MAGASIN_ID` bigint(20) DEFAULT NULL,
  `PRODUIT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `unitemesure`
--

CREATE TABLE `unitemesure` (
  `ID` bigint(20) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `UM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `LOGIN` varchar(255) NOT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `TEL` varchar(255) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categorieproduit`
--
ALTER TABLE `categorieproduit`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `entiteadministratif`
--
ALTER TABLE `entiteadministratif`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ENTITEADMINISTRATIF_MAGASIN_ID` (`MAGASIN_ID`),
  ADD KEY `FK_ENTITEADMINISTRATIF_CHEF_LOGIN` (`CHEF_LOGIN`);

--
-- Index pour la table `expressionbesoin`
--
ALTER TABLE `expressionbesoin`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EXPRESSIONBESOIN_ENTITEADMINISTRATIF_ID` (`ENTITEADMINISTRATIF_ID`),
  ADD KEY `FK_EXPRESSIONBESOIN_DEMANDEUR_LOGIN` (`DEMANDEUR_LOGIN`);

--
-- Index pour la table `expressionbesoinitem`
--
ALTER TABLE `expressionbesoinitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EXPRESSIONBESOINITEM_CATEGORIEPRODUIT_ID` (`CATEGORIEPRODUIT_ID`),
  ADD KEY `FK_EXPRESSIONBESOINITEM_EXPRESSIONBESOIN_ID` (`EXPRESSIONBESOIN_ID`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_LIVRAISON_EXPRESSIONBESOIN_ID` (`EXPRESSIONBESOIN_ID`);

--
-- Index pour la table `livraisonitem`
--
ALTER TABLE `livraisonitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_LIVRAISONITEM_MAGASIN_ID` (`MAGASIN_ID`),
  ADD KEY `FK_LIVRAISONITEM_PRODUIT_ID` (`PRODUIT_ID`),
  ADD KEY `FK_LIVRAISONITEM_LIVRAISON_ID` (`LIVRAISON_ID`);

--
-- Index pour la table `magasin`
--
ALTER TABLE `magasin`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `magasin_stock`
--
ALTER TABLE `magasin_stock`
  ADD PRIMARY KEY (`Magasin_ID`,`stocks_ID`),
  ADD KEY `FK_MAGASIN_STOCK_stocks_ID` (`stocks_ID`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PRODUIT_CATEGORIEPRODUIT_ID` (`CATEGORIEPRODUIT_ID`),
  ADD KEY `FK_PRODUIT_UNITEMESURE_ID` (`UNITEMESURE_ID`);

--
-- Index pour la table `produititem`
--
ALTER TABLE `produititem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PRODUITITEM_PRODUIT_ID` (`PRODUIT_ID`);

--
-- Index pour la table `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `receptionitem`
--
ALTER TABLE `receptionitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_RECEPTIONITEM_PRODUIT_ID` (`PRODUIT_ID`),
  ADD KEY `FK_RECEPTIONITEM_MAGASIN_ID` (`MAGASIN_ID`),
  ADD KEY `FK_RECEPTIONITEM_RECEPTION_ID` (`RECEPTION_ID`);

--
-- Index pour la table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_STOCK_MAGASIN_ID` (`MAGASIN_ID`),
  ADD KEY `FK_STOCK_PRODUIT_ID` (`PRODUIT_ID`);

--
-- Index pour la table `unitemesure`
--
ALTER TABLE `unitemesure`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`LOGIN`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `entiteadministratif`
--
ALTER TABLE `entiteadministratif`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `expressionbesoin`
--
ALTER TABLE `expressionbesoin`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `unitemesure`
--
ALTER TABLE `unitemesure`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `entiteadministratif`
--
ALTER TABLE `entiteadministratif`
  ADD CONSTRAINT `FK_ENTITEADMINISTRATIF_CHEF_LOGIN` FOREIGN KEY (`CHEF_LOGIN`) REFERENCES `user` (`LOGIN`),
  ADD CONSTRAINT `FK_ENTITEADMINISTRATIF_MAGASIN_ID` FOREIGN KEY (`MAGASIN_ID`) REFERENCES `magasin` (`ID`);

--
-- Contraintes pour la table `expressionbesoin`
--
ALTER TABLE `expressionbesoin`
  ADD CONSTRAINT `FK_EXPRESSIONBESOIN_DEMANDEUR_LOGIN` FOREIGN KEY (`DEMANDEUR_LOGIN`) REFERENCES `user` (`LOGIN`),
  ADD CONSTRAINT `FK_EXPRESSIONBESOIN_ENTITEADMINISTRATIF_ID` FOREIGN KEY (`ENTITEADMINISTRATIF_ID`) REFERENCES `entiteadministratif` (`ID`);

--
-- Contraintes pour la table `expressionbesoinitem`
--
ALTER TABLE `expressionbesoinitem`
  ADD CONSTRAINT `FK_EXPRESSIONBESOINITEM_CATEGORIEPRODUIT_ID` FOREIGN KEY (`CATEGORIEPRODUIT_ID`) REFERENCES `categorieproduit` (`ID`),
  ADD CONSTRAINT `FK_EXPRESSIONBESOINITEM_EXPRESSIONBESOIN_ID` FOREIGN KEY (`EXPRESSIONBESOIN_ID`) REFERENCES `expressionbesoin` (`ID`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `FK_LIVRAISON_EXPRESSIONBESOIN_ID` FOREIGN KEY (`EXPRESSIONBESOIN_ID`) REFERENCES `expressionbesoin` (`ID`);

--
-- Contraintes pour la table `livraisonitem`
--
ALTER TABLE `livraisonitem`
  ADD CONSTRAINT `FK_LIVRAISONITEM_LIVRAISON_ID` FOREIGN KEY (`LIVRAISON_ID`) REFERENCES `livraison` (`ID`),
  ADD CONSTRAINT `FK_LIVRAISONITEM_MAGASIN_ID` FOREIGN KEY (`MAGASIN_ID`) REFERENCES `magasin` (`ID`),
  ADD CONSTRAINT `FK_LIVRAISONITEM_PRODUIT_ID` FOREIGN KEY (`PRODUIT_ID`) REFERENCES `produit` (`ID`);

--
-- Contraintes pour la table `magasin_stock`
--
ALTER TABLE `magasin_stock`
  ADD CONSTRAINT `FK_MAGASIN_STOCK_Magasin_ID` FOREIGN KEY (`Magasin_ID`) REFERENCES `magasin` (`ID`),
  ADD CONSTRAINT `FK_MAGASIN_STOCK_stocks_ID` FOREIGN KEY (`stocks_ID`) REFERENCES `stock` (`ID`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_PRODUIT_CATEGORIEPRODUIT_ID` FOREIGN KEY (`CATEGORIEPRODUIT_ID`) REFERENCES `categorieproduit` (`ID`),
  ADD CONSTRAINT `FK_PRODUIT_UNITEMESURE_ID` FOREIGN KEY (`UNITEMESURE_ID`) REFERENCES `unitemesure` (`ID`);

--
-- Contraintes pour la table `produititem`
--
ALTER TABLE `produititem`
  ADD CONSTRAINT `FK_PRODUITITEM_PRODUIT_ID` FOREIGN KEY (`PRODUIT_ID`) REFERENCES `produit` (`ID`);

--
-- Contraintes pour la table `receptionitem`
--
ALTER TABLE `receptionitem`
  ADD CONSTRAINT `FK_RECEPTIONITEM_MAGASIN_ID` FOREIGN KEY (`MAGASIN_ID`) REFERENCES `magasin` (`ID`),
  ADD CONSTRAINT `FK_RECEPTIONITEM_PRODUIT_ID` FOREIGN KEY (`PRODUIT_ID`) REFERENCES `produit` (`ID`),
  ADD CONSTRAINT `FK_RECEPTIONITEM_RECEPTION_ID` FOREIGN KEY (`RECEPTION_ID`) REFERENCES `reception` (`ID`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_STOCK_MAGASIN_ID` FOREIGN KEY (`MAGASIN_ID`) REFERENCES `magasin` (`ID`),
  ADD CONSTRAINT `FK_STOCK_PRODUIT_ID` FOREIGN KEY (`PRODUIT_ID`) REFERENCES `produit` (`ID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
