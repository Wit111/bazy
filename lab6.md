```sql

Lab 6

Zadanie 1
a)
SELECT AVG(waga) FROM kreatura WHERE rodzaj='wiking';
b)
SELECT rodzaj,AVG(waga),COUNT(*) AS ilosc FROM kreatura GROUP BY rodzaj;
c)
SELECT rodzaj,AVG(2020-YEAR(dataUr)) AS sredni_wiek FROM kreatura GROUP BY rodzaj;

Zadanie 2
a)
SELECT rodzaj,SUM(waga) FROM zasob GROUP BY rodzaj;
b)
SELECT nazwa,AVG(waga) FROM zasob WHERE ilosc>=4 GROUP BY nazwa HAVING SUM(waga)>10;
lub SELECT nazwa,SUM(waga*ilosc),sum(ilosc) FROM zasob GROUP BY nazwa ORDER BY nazwa;
c)
SELECT rodzaj,COUNT(DISTINCT(nazwa)) FROM zasob GROUP BY rodzaj HAVING MIN(ilosc)>1;
lub SELECT rodzaj,COUNT(DISTINCT(nazwa)) AS liczba FROM zasob GROUP BY rodzaj HAVING liczba>1;

Zadanie 3
a)
SELECT nazwa,sum(ilosc) FROM kreatura k,ekwipunek e WHERE k.idKreatury=e.idKreatury GROUP BY nazwa;
b)
SELECT k.nazwa,e.ekwipunek,e.ilosc FROM kreatura k,ekwipunek e, zasob z WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu;
c)
SELECT DISTINCT k.idKreatury,k.nazwa,e.idKreatury FROM kreatura k left join ekwipunek e ON k.idKreatury=e.idKreatury WHERE e.idKreatury IS NULL;
lub SELECT k.idKreatury, k.nazwa from kreatura k WHERE k.idKreatury not in(SELECT idKreatury FROM ekwipunek where idKreatury is NOT NULL);

Zadanie 4
a)
SELECT k.nazwa,z.nazwa  FROM kreatura k,zasob z, ekwipunek e WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND k.rodzaj='wiking' AND YEAR(k.dataUr) BETWEEN 1670 AND 1679;
lub z natural join
SELECT k.nazwa,z.nazwa  FROM kreatura k,zasob z NATURAL JOIN ekwipunek e WHERE e.idZasobu=z.idZasobu AND k.rodzaj='wiking' AND YEAR(k.dataUr) BETWEEN 1670 AND 1679;
b)
SELECT k.nazwa FROM kreatura k left join ekwipunek e ON k.idKreatury=e.idKreatury INNER JOIN zasob z ON e.idZasobu=z.idZasobu WHERE z.rodzaj='jedzenie' ORDER BY dataUr DESC LIMIT 5;
c)
SELECT k.nazwa, k2.nazwa FROM kreatura k,kreatura k2 WHERE k.idKreatury-k2.idKreatury=5 ;
Zadanie 5
a)
SELECT k.rodzaj, AVG(e.ilosc *z.waga) FROM kreatura AS k, ekwipunek AS e, zasob AS z where k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND k.rodzaj NOT IN('malpa','waz') GROUP BY rodzaj HAVING SUM(e.ilosc) < 30;
b)
SELECT DISTINCT k.rodzaj,
(SELECT CONCAT(k2.nazwa, " - " , k2.dataUr) FROM kreatura k2 WHERE k.rodzaj=k2.rodzaj ORDER BY k2.dataUr LIMIT 1) AS najstarsze,
(SELECT CONCAT(k2.nazwa, " - " , k2.dataUr) FROM kreatura k2 WHERE k.rodzaj=k2.rodzaj ORDER BY k2.dataUr DESC LIMIT 1) AS najmlodsze
FROM kreatura k;