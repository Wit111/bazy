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
