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