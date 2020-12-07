```sql
Zadanie 1
a)
DELIMITER //
CREATE TRIGGER test_wagi
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
IF waga<0
THEN
SET NEW.waga=0;
END IF;
END
//
DELIMITER ;

Zadanie 2
a)
DELIMITER //
CREATE TRIGGER wyprawa_after_delete
AFTER DELETE ON wyprawa
FOR EACH ROW
BEGIN
DECLARE kierownik_nazwa VARCHAR(100);
SET kierownik_nazwa = (SELECT kreatura.nazwa FROM kreatura WHERE idKreatury = OLD.kierownik);
INSERT INTO archiwum_wypraw VALUES (OLD.id_wyprawy, OLD.nazwa, OLD.data_rozpoczecia, OLD.data_zakonczenia, kierownik_nazwa);
END
//
DELIMITER ;

Zadanie 3
a)
DELIMITER $$
CREATE PROCEDURE eliksir_sily(IN id INT)
BEGIN
UPDATE kreatura SET udzwig=1.2*udzwig WHERE idKreatury=id;
END
$$
DELIMITER ;

b)
DELIMITER $$
CREATE FUNCTION uppercase(tekst varchar(255))
RETURNS varchar(255)
BEGIN
DECLARE utekst VARCHAR(255);
SET @utekst=UPPER(utekst);
RETURN @utekst;
END
$$
DELIMITER ;

Zadanie 4
a)
CREATE TABLE system_alarmowy(id_alarmu INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,wiadomosc varchar(255));
b)
DELIMITER //
CREATE TRIGGER alarm
BEFORE INSERT ON wyprawa
FOR EACH ROW
BEGIN
DECLARE zmienna INT;
SELECT count(*) INTO zmienna from (select w.id_wyprawy from wyprawa w, uczestnicy u, kreatura k, etapy_wyprawy ew
where w.id_wyprawy=u.id_wyprawy
and u.id_uczestnika=k.idKreatury
and ew.idWyprawy=w.id_wyprawy
and k.nazwa = "Tesciowa" and ew.sektor=7
and w.id_wyprawy = NEW.id_wyprawy);
IF (zmienna>0)
THEN
INSERT INTO alarm (default,'Tesciowa Nadchodzi');
END
//
DELIMITER ;


