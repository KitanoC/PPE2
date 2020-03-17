-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 07 mars 2020 à 18:07
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tholdi`
--

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

DROP TABLE IF EXISTS `agence`;
CREATE TABLE IF NOT EXISTS `agence` (
  `num` int(2) NOT NULL AUTO_INCREMENT,
  `agencenom` varchar(20) NOT NULL,
  `agenceadrs1` varchar(20) NOT NULL,
  `agenceadrs2` varchar(20) DEFAULT NULL,
  `agencecp` varchar(6) NOT NULL,
  `agenceville` varchar(15) NOT NULL,
  `agenceport` int(5) NOT NULL,
  `agencetel` varchar(15) NOT NULL,
  `agencemel` varchar(25) NOT NULL,
  `agenceimage` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `cli_ID` int(11) NOT NULL AUTO_INCREMENT,
  `cli_societe` varchar(32) NOT NULL,
  `cli_tel` char(10) NOT NULL,
  `cli_pays` char(3) NOT NULL,
  `cli_ville` varchar(32) NOT NULL,
  `cli_CP` char(5) NOT NULL,
  `cli_adresse` varchar(64) NOT NULL,
  `cli_mail` varchar(255) NOT NULL,
  `cli_mdp` varchar(64) NOT NULL,
  `cli_nom` varchar(32) DEFAULT NULL,
  `cli_prenom` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cli_ID`),
  KEY `FK_cli_pays` (`cli_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `contener`
--

DROP TABLE IF EXISTS `contener`;
CREATE TABLE IF NOT EXISTS `contener` (
  `contcode` char(2) NOT NULL,
  `conttype` int(11) NOT NULL,
  `conttaille` int(11) NOT NULL,
  `conttarifjour` double NOT NULL,
  `conttariftrim` double NOT NULL,
  `conttarifan` double NOT NULL,
  PRIMARY KEY (`contcode`),
  KEY `fk_contener_type` (`conttype`),
  KEY `fk_contener_taille` (`conttaille`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

DROP TABLE IF EXISTS `continent`;
CREATE TABLE IF NOT EXISTS `continent` (
  `contnum` int(11) NOT NULL AUTO_INCREMENT,
  `connomfr` varchar(20) NOT NULL,
  `connomgb` varchar(20) NOT NULL,
  PRIMARY KEY (`contnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `detail`
--

DROP TABLE IF EXISTS `detail`;
CREATE TABLE IF NOT EXISTS `detail` (
  `detail_devis` int(11) NOT NULL,
  `contcode` char(2) NOT NULL,
  `detail_qte` int(3) NOT NULL,
  PRIMARY KEY (`detail_devis`,`contcode`),
  KEY `fk_detail_contener` (`contcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

DROP TABLE IF EXISTS `devis`;
CREATE TABLE IF NOT EXISTS `devis` (
  `devis_num` int(11) NOT NULL AUTO_INCREMENT,
  `facture_num` int(11) DEFAULT NULL,
  `statut_code` int(1) NOT NULL,
  `cli_num` int(11) NOT NULL,
  `devis_date` date NOT NULL,
  `port_depart` char(5) NOT NULL,
  `port_arrivee` char(5) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `devis_qte_jour` int(11) NOT NULL,
  PRIMARY KEY (`devis_num`),
  KEY `fk_devis_client` (`cli_num`),
  KEY `fk_devis_statut` (`statut_code`),
  KEY `fk_devis_port_depart` (`port_depart`),
  KEY `fk_devis_port_arrivee` (`port_arrivee`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `payscode` char(3) NOT NULL,
  `alpha2` char(2) DEFAULT NULL,
  `paysnomfr` varchar(45) NOT NULL,
  `paysnomgb` varchar(45) NOT NULL,
  `payscont` int(11) NOT NULL,
  `UE` tinyint(1) NOT NULL,
  PRIMARY KEY (`payscode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `port`
--

DROP TABLE IF EXISTS `port`;
CREATE TABLE IF NOT EXISTS `port` (
  `portcode` char(5) NOT NULL,
  `portnom` varchar(15) NOT NULL,
  `portpays` char(3) NOT NULL,
  PRIMARY KEY (`portcode`),
  KEY `fk_port_pays` (`portpays`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

DROP TABLE IF EXISTS `societe`;
CREATE TABLE IF NOT EXISTS `societe` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  `adresse` varchar(15) NOT NULL,
  `adresse2` varchar(20) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `mel` varchar(20) NOT NULL,
  `directeur` varchar(25) NOT NULL,
  `numcnil` varchar(20) NOT NULL,
  `numintra` varchar(20) NOT NULL,
  `IBAN` varchar(30) NOT NULL,
  `SIRET` varchar(30) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `statut_code` int(1) NOT NULL,
  `statut_libele` varchar(32) NOT NULL,
  PRIMARY KEY (`statut_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `taille`
--

DROP TABLE IF EXISTS `taille`;
CREATE TABLE IF NOT EXISTS `taille` (
  `taillcode` int(11) NOT NULL AUTO_INCREMENT,
  `taillong` int(2) NOT NULL,
  `taillarg` int(2) NOT NULL,
  `tailhaut` int(2) NOT NULL,
  PRIMARY KEY (`taillcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typecontener`
--

DROP TABLE IF EXISTS `typecontener`;
CREATE TABLE IF NOT EXISTS `typecontener` (
  `typecode` int(11) NOT NULL AUTO_INCREMENT,
  `typelibel` varchar(15) NOT NULL,
  `phototype` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`typecode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
