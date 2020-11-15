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