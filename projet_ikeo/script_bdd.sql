CREATE DATABASE IF NOT EXISTS `PRODUITS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `PRODUITS`;

CREATE TABLE `CONCERNE` (
  `1n_concerne` VARCHAR(42),
  `id_facture` VARCHAR(42),
  PRIMARY KEY (`1n_concerne`, `id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PRODUITS` (
  `1n_concerne` VARCHAR(42),
  `id_produit` VARCHAR(42),
  `nom_produit` VARCHAR(42),
  `ref_produit` VARCHAR(42),
  `description_produit` VARCHAR(42),
  `abandonne` VARCHAR(42),
  `nom_usine` VARCHAR(42),
  `id_etat` VARCHAR(42),
  PRIMARY KEY (`1n_concerne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
CREATE TABLE `ETAT_PRODUIT` (
  `id_etat` VARCHAR(42),
  PRIMARY KEY (`id_etat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/

CREATE TABLE `FACTURES` (
  `id_facture` VARCHAR(42),
  `numero` VARCHAR(42),
  `date` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `nom_produit` VARCHAR(42),
  `id_client` VARCHAR(42),
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PRODUIRE` (
  `id_site_production` VARCHAR(42),
  `1n_concerne` VARCHAR(42),
  PRIMARY KEY (`id_site_production`, `1n_concerne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SITES_PRODUCTIONS` (
  `id_site_production` VARCHAR(42),
  `nom_usine` VARCHAR(42),
  `adresse` VARCHAR(42),
  `ville` VARCHAR(42),
  `id_pays` VARCHAR(42),
  `id_client` VARCHAR(42),
  PRIMARY KEY (`id_site_production`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CONTIENT` (
  `1n_concerne` VARCHAR(42),
  `id_quantite` VARCHAR(42),
  PRIMARY KEY (`1n_concerne`, `id_quantite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `LOCALISATION` (
  `id_pays` VARCHAR(42),
  `ville` VARCHAR(42),
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
CREATE TABLE `QUANTITE` (
  `id_quantite` VARCHAR(42),
  PRIMARY KEY (`id_quantite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/

CREATE TABLE `TYPE_CLIENT` (
  `id_type` VARCHAR(42),
  `id_client` VARCHAR(42),
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CLIENTS` (
  `id_client` VARCHAR(42),
  `nom_client` VARCHAR(42),
  `type` VARCHAR(42),
  `raison_sociale` VARCHAR(42),
  `adresse` VARCHAR(42),
  `ville` VARCHAR(42),
  `pays` VARCHAR(42),
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `INCLUT` (
  `id_quantite` VARCHAR(42),
  `id_client` VARCHAR(42),
  PRIMARY KEY (`id_quantite`, `id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `CONCERNE` ADD FOREIGN KEY (`id_facture`) REFERENCES `FACTURES` (`id_facture`);
ALTER TABLE `CONCERNE` ADD FOREIGN KEY (`1n_concerne`) REFERENCES `PRODUITS` (`1n_concerne`);
-- ALTER TABLE `PRODUITS` ADD FOREIGN KEY (`id_etat`) REFERENCES `ETAT_PRODUIT` (`id_etat`);
ALTER TABLE `FACTURES` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENTS` (`id_client`);
ALTER TABLE `PRODUIRE` ADD FOREIGN KEY (`1n_concerne`) REFERENCES `PRODUITS` (`1n_concerne`);
ALTER TABLE `PRODUIRE` ADD FOREIGN KEY (`id_site_production`) REFERENCES `SITES_PRODUCTIONS` (`id_site_production`);
ALTER TABLE `SITES_PRODUCTIONS` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENTS` (`id_client`);
ALTER TABLE `SITES_PRODUCTIONS` ADD FOREIGN KEY (`id_pays`) REFERENCES `LOCALISATION` (`id_pays`);
-- ALTER TABLE `CONTIENT` ADD FOREIGN KEY (`id_quantite`) REFERENCES `QUANTITE` (`id_quantite`);
ALTER TABLE `CONTIENT` ADD FOREIGN KEY (`1n_concerne`) REFERENCES `PRODUITS` (`1n_concerne`);
ALTER TABLE `TYPE_CLIENT` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENTS` (`id_client`);
ALTER TABLE `INCLUT` ADD FOREIGN KEY (`id_client`) REFERENCES `CLIENTS` (`id_client`);
-- ALTER TABLE `INCLUT` ADD FOREIGN KEY (`id_quantite`) REFERENCES `QUANTITE` (`id_quantite`);