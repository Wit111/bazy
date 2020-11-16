```sql
lab 04
Zadanie 1
a)
SELECT * FROM postac WHERE rodzaj ='wiking' AND nazwa !='Bjorn' ORDER BY data_ur DESC;
DELETE FROM postac WHERE nazwa='Bern';
DELETE FROM postac WHERE nazwa='Cern';
b)
ALTER TABLE postac MODIFY id_postaci int;
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE postac DROP PRIMARY KEY;

Zadanie 2
a)
ALTER TABLE postac ADD pesel varchar(11) FIRST;
UPDATE postac SET pesel='01378472639'+id_postaci;
ALTER TABLE postac ADD PRIMARY KEY(pesel);
b)
ALTER TABLE postac MODIFY rodzaj enum('ptak','wiking','kobieta','syrena');
c)
INSERT INTO postac VALUES ('02875493847',8,'Gertruda Nieszczera','syrena','1999-02-26',21,default,default);

Zadanie 3
a)
UPDATE postac SET statek='Radny' WHERE nazwa LIKE '%a%';
b)
UPDATE statek SET max_ladownosc=0.7*max_ladownosc WHERE data_wodowania BETWEEN '1910-01-01' AND '2020-06-02';
c)
ALTER TABLE postac CHECK(wiek<=1000); 

Zadanie 4
a)
ALTER TABLE postac MODIFY rodzaj enum('wiking','kobieta','ptak','syrena','waz');
INSERT INTO postac VALUES('83676253781',10,'Waz Loko','waz','1980-06-23',40,default,default);
b)
pierwszy sposób
CREATE TABLE marynarz LIKE postac; (przenossi klucz główny i obce)
INSERT INTO marynarz SELECT * FROM postac WHERE statek IS NOT NULL;
drugi sposób
CREATE TABLE marynarz SELECT * FROM postac WHERE statek IS NOT NULL; (NIE przenosi kluczy)
c)
przy pierwszym sposobie zrobione od razu
przy drugim ALTER TABLE marynarz2 ADD PRIMARY KEY(pesel);

Zadanie 5
a)
UPDATE postac SET statek=NULL WHERE statek!=NULL;
b)
DELETE postac WHERE nazwa='Derm';
c)
DELETE FROM statek WHERE nazwa_statku IS NOT NULL;
d)
ALTER TABLE postac DROP FOREIGN KEY postac_ibfk_1;
DROP TABLE statek;
e)
CREATE TABLE zwierz(id INT unsigned auto_increment PRIMARY KEY,nazwa VARCHAR(40),);
f)
INSERT INTO zwierz SELECT id_postaci,nazwa,wiek FROM postac WHERE rodzaj='ptak' OR rodzaj='waz';
