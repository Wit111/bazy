```sql
Zadanie 1
b)
SELECT nazwa FROM kreatura k WHERE k.idKreatury NOT IN(SELECT id_uczestnika FROM uczestnicy);
c)
SElect w.nazwa,sum(e.ilosc) from wyprawa w,ekwipunek e, uczestnicy u where u.id_uczestnika=e.idKreatury and u.id_wyprawy=w.id_wyprawy group by w.nazwa; 
Zadanie 2
a)
SELECT w.nazwa, count(u.id_uczestnika),group_concat(k.nazwa) 
FROM wyprawa w,uczestnicy u,kreatura k WHERE u.id_wyprawy=w.id_wyprawy 
AND u.id_uczestnika=k.idKreatury group by w.nazwa;
b)
SELECT e.idEtapu, s.nazwa,k.nazwa FROM sektor s,etapy_wyprawy.e,wyprawa w,kreatura k WHERE w.kierownik=k.idKreatury AND w.id_wyprawy=e.idWyprawy AND e.sektor=s.id_sektora ORDER BY w.data_rozpoczecia,e.kolejnosc; 

ZAdanie 3
a)
SELECT s.nazwa,count(e.sektor) from sektor s LEFT JOIN etapy_wyprawy e ON s.id_sektora=e.sektor GROUP BY s.nazwa;
b)
SELECT k.nazwa, if(count(u.id_wyprawy)=0,'nie bral udzialu w wyprawie','bral udzial w wyprawie')
from kreatura k left join uczestnicy u ON k.idKreatury=u.id_uczestnika
group by k.nazwa;
Zadanie 4
a)
SELECT w.nazwa, sum(length(e.dziennik)) as ilosc from wyprawa w JOIN etapy_wyprawy e ON w.id_wyprawy=e.idWyprawy 
group by w.nazwa having ilosc<400 ;
b)
SELECT w.nazwa,sum(z.waga*e.ilosc)/count(u.id_uczestnika) as waga 
FROM wyprawa w 
JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy
JOIN kreatura k ON u.id_uczestnika=k.idKreatury
JOIN ekwipunek e ON e.idKreatury=k.idKreatury
JOIN zasob z ON e.idZasobu=z.idZasobu
GROUP BY w.nazwa

Zadanie 5
a)
SELECT k.nazwa,DATEDIFF(w.data_rozpoczecia,k.dataUr) AS wiek_w_dniach FROM kreatura k
JOIN uczestnicy u ON u.id_uczestnika=k.idKreatury
JOIN wyprawa w ON w.id_wyprawy=u.id_wyprawy
JOIN etapy_wyprawy e ON w.id_wyprawy=e.idWyprawy
JOIN sektor s ON s.id_sektora=e.sektor
WHERE s.nazwa='chatka dziadka';