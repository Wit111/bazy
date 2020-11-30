```sql
Zadanie 1
b)
SELECT nazwa FROM kreatura k WHERE k.idKreatury NOT IN(SELECT id_uczestnika FROM uczestnicy);
c)
SELECT w.nazwa FROM wyprawa w WHERE w.