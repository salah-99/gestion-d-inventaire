
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `fournisseur` (
  `id_F` int(11) NOT NULL,
  `nameF` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `société` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `produit` (
  `id_P` int(11) NOT NULL,
  `nameP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `categorie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantité` int(11) NOT NULL,
  `price` float NOT NULL,
  `id_F` int(11) NOT NULL,
  `id_R` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `rayon` (
  `id_R` int(11) NOT NULL,
  `nameRayon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_F`);

ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_P`),
  ADD KEY `id_F` (`id_F`),
  ADD KEY `id_R` (`id_R`);

ALTER TABLE `rayon`
  ADD PRIMARY KEY (`id_R`);


ALTER TABLE `fournisseur`
  MODIFY `id_F` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `produit`
  MODIFY `id_P` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `rayon`
  MODIFY `id_R` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_F`) REFERENCES `fournisseur` (`id_F`),
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`id_R`) REFERENCES `rayon` (`id_R`);
COMMIT;