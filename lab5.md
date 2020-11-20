```sql
lab 05
Zadanie 1
a)
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;
b)
SELECT * FROM zasob;
c)
SELECT * FROM zasob WHERE rodzaj='jedzenie';
d)
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN(1,3,5);

Zadanie 2
a)
SELECT * FROM kreatura WHERE udzwig>=50;
b)
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
c)
SELECT * FROM kreatura WHERE nazwa LIKE'%or%' AND udzwig BETWEEN 30 AND 70;

Zadanie 3
a)
select * FROM zasob WHERE month(dataPozyskania) IN (7,8);
b)
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY ASC;
c)
SELECT * FROM kreatura ORDER BY dataUr ASC LIMIT 5;

Zadanie 4
a)
SELECT DISTINCT rodzaj FROM kreatura;
b)
SELECT CONCAT(nazwa,'-',rodzaj) AS 'nazwa-rodzaj' FROM kreatura WHERE rodzaj LIKE 'wi%';
c)
(SELECT CONCAT(ilosc*waga) AS 'laczna masa zasobu' FROM zasob WHERE year(dataPozyskania) BETWEEN 2000 AND 2007;)(Tak nie robic zmienia na varchar)
SELECT nazwa, waga*ilosc FROM zasob WHERE dataPozyskania BETWEEN '2000-01-01' AND '2007-12-31';

Zadanie 5
a)
SELECT nazwa,0.7*waga*ilosc as 'Waga netto',0.3*waga*ilosc as 'Waga odpadkow' FROM zasob where rodzaj='jedzenie';
b)
SELECT * FROM zasob WHERE rodzaj IS NULL;
lub
SELECT nazwa,rodzaj FROM zasob WHERE rodzaj='';
c)
SELECT nazwa,DISTINCT(rodzaj) FROM zasob WHERE nazwa like'Ba%' or nazwa like'%os' ORDER BY nazwa ASC;