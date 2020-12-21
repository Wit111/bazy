SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE TABLE `projekt__Format` (
  `id_formatu` int NOT NULL AUTO_INCREMENT,
  `nazwa_formatu` varchar(45) NOT NULL,
  `szerokosc` int NOT NULL,
  `wysokosc` int NOT NULL,
  PRIMARY KEY (`id_formatu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Papier` (
  `id_papieru` int NOT NULL AUTO_INCREMENT,
  `nazwa_papieru` varchar(45) NOT NULL,
  `gramatura` int NOT NULL,
  `bialosc` decimal(5,2) NOT NULL,
  `grubosc` int NOT NULL,
  PRIMARY KEY (`id_papieru`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Laczenie_kartek` (
  `id_laczenia` int NOT NULL AUTO_INCREMENT,
  `nazwa_laczenia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_laczenia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Ksiazka` (
  `id_ksiazki` int NOT NULL AUTO_INCREMENT,
  `pelny_tytul` varchar(45) NOT NULL,
  `ilosc_stron` int NOT NULL,
  `koszt_produkcji` decimal(6,2) NOT NULL,
  `typ_oprawy` enum('twarda','miekka') NOT NULL,
  `format` int NOT NULL,
  `papier` int NOT NULL,
  `laczenie_kartek` int NOT NULL,
  PRIMARY KEY (`id_ksiazki`),
  KEY `fk_Tytul_Format_idx` (`format`),
  KEY `fk_Ksiazka_Papier1_idx` (`papier`),
  KEY `fk_Ksiazka_Laczenie_kartek1_idx` (`laczenie_kartek`),
  CONSTRAINT `fk_Ksiazka_Laczenie_kartek1` FOREIGN KEY (`laczenie_kartek`) REFERENCES `projekt__Laczenie_kartek` (`id_laczenia`),
  CONSTRAINT `fk_Ksiazka_Papier1` FOREIGN KEY (`papier`) REFERENCES `projekt__Papier` (`id_papieru`),
  CONSTRAINT `fk_Tytul_Format` FOREIGN KEY (`format`) REFERENCES `projekt__Format` (`id_formatu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Klient` (
  `id_klienta` int NOT NULL AUTO_INCREMENT,
  `czy_firma` enum('tak','nie') NOT NULL,
  `nip` varchar(15) DEFAULT NULL,
  `pelna_nazwa` varchar(90) NOT NULL,
  PRIMARY KEY (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Autor` (
  `id_autora` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autora`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Status_zamowienia` (
  `id_statusu` int NOT NULL AUTO_INCREMENT,
  `nazwa_statusu` varchar(30) NOT NULL,
  PRIMARY KEY (`id_statusu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Pracownik` (
  `id_pracownika` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `pensja` decimal(7,2) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `data_zatrodnienia` date NOT NULL,
  `pesel` varchar(11) NOT NULL,
  PRIMARY KEY (`id_pracownika`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Zamowienie` (
  `id_zamowienia` int NOT NULL AUTO_INCREMENT,
  `ksiazka` int NOT NULL,
  `numer_zamowienia` varchar(25) DEFAULT NULL,
  `ilosc` int NOT NULL,
  `cena_sztuki` decimal(6,2) NOT NULL,
  `klient` int NOT NULL,
  `status_zamowienia` int NOT NULL,
  `data_zamowienia` date NOT NULL,
  `pracownik` int NOT NULL,
  PRIMARY KEY (`id_zamowienia`),
  KEY `fk_Zamowienie_Klient1_idx` (`klient`),
  KEY `fk_Zamowienie_Status_zamowienia1_idx` (`status_zamowienia`),
  KEY `fk_Zamowienie_Pracownicy1_idx` (`pracownik`),
  KEY `fk_projekt__Zamowienie_projekt__Ksiazka1_idx` (`ksiazka`),
  CONSTRAINT `fk_projekt__Zamowienie_projekt__Ksiazka1` FOREIGN KEY (`ksiazka`) REFERENCES `projekt__Ksiazka` (`id_ksiazki`),
  CONSTRAINT `fk_Zamowienie_Klient1` FOREIGN KEY (`klient`) REFERENCES `projekt__Klient` (`id_klienta`),
  CONSTRAINT `fk_Zamowienie_Pracownicy1` FOREIGN KEY (`pracownik`) REFERENCES `projekt__Pracownik` (`id_pracownika`),
  CONSTRAINT `fk_Zamowienie_Status_zamowienia1` FOREIGN KEY (`status_zamowienia`) REFERENCES `projekt__Status_zamowienia` (`id_statusu`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Adres_klienta` (
  `id_adresu_klienta` int NOT NULL AUTO_INCREMENT,
  `ulica` varchar(40) NOT NULL,
  `kod_miejscowosci` varchar(9) NOT NULL,
  `miejscowosc` varchar(50) NOT NULL,
  `klient` int NOT NULL,
  PRIMARY KEY (`id_adresu_klienta`),
  KEY `fk_projekt__Adres_klienta_projekt__Klient1_idx` (`klient`),
  CONSTRAINT `fk_projekt__Adres_klienta_projekt__Klient1` FOREIGN KEY (`klient`) REFERENCES `projekt__Klient` (`id_klienta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projekt__Autor_ksiazki` (
  `id_ksiazki` int NOT NULL,
  `id_autora` int NOT NULL,
  PRIMARY KEY (`id_ksiazki`,`id_autora`),
  KEY `fk_projekt__Ksiazka_has_projekt__Autor_projekt__Autor1_idx` (`id_autora`),
  KEY `fk_projekt__Ksiazka_has_projekt__Autor_projekt__Ksiazka1_idx` (`id_ksiazki`),
  CONSTRAINT `fk_projekt__Ksiazka_has_projekt__Autor_projekt__Autor1` FOREIGN KEY (`id_autora`) REFERENCES `projekt__Autor` (`id_autora`),
  CONSTRAINT `fk_projekt__Ksiazka_has_projekt__Autor_projekt__Ksiazka1` FOREIGN KEY (`id_ksiazki`) REFERENCES `projekt__Ksiazka` (`id_ksiazki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TRIGGER `projekt__znizka_hurtowa` BEFORE INSERT ON `projekt__Zamowienie` FOR EACH ROW BEGIN
IF NEW.ilosc>100
THEN
SET NEW.cena_sztuki=NEW.cena_sztuki*0.95;
END IF;
END

CREATE TRIGGER `projekt__strony` BEFORE INSERT ON `projekt__Ksiazka` FOR EACH ROW BEGIN
IF NEW.ilosc_stron<0
THEN
SET NEW.ilosc_stron=0;
END IF;
END

CREATE FUNCTION `projekt__Zysk_z_zamowienia`(id_zam INT) RETURNS decimal(8,2)
BEGIN
DECLARE zysk DECIMAL(8,2);
DECLARE cena_sz DECIMAL(6,2);
DECLARE koszt_prod DECIMAL(6,2);
DECLARE ile INT;
SELECT cena_sztuki INTO cena_sz FROM projekt__Zamowienie WHERE id_zam=id_zamowienia;
SELECT ilosc INTO ile FROM projekt__Zamowienie WHERE id_zam=id_zamowienia;
SELECT k.koszt_produkcji INTO koszt_prod FROM projekt__Ksiazka k,projekt__Zamowienie z 
WHERE id_zam=p.id_zamowienia AND k.id_ksiazki=z.ksiazka;
SET zysk=ile*(cena_sz-koszt_prod);
RETURN zysk;
END

CREATE PROCEDURE `projekt__Podwyzka`(IN id INT, IN wartosc DECIMAL(7,2))
BEGIN
UPDATE projekt__Pracownik SET pensja=pensja+wartosc WHERE id_pracownika=id;
END


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;