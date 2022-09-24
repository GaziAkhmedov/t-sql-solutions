1
Напишите запрос, который генерирует виртуальную вспомогательную таблицу 
с десятью числами в диапазоне от 1 до 10, не используя при этом цикл. Конечный 
результат можно не упорядочивать.
   Не используется ни одной таблицы.
     Ожидаемый результат:
n
-----------
1
2
3
4
5
6
7
8
9
10
(строк обработано: 10)


SELECT 1 AS n;



Задание 2

Напишите запрос, который возвращает пары «клиент — сотрудник», работавшие 
с заказами в январе, а не в феврале 2008 г.
   Используется таблица Sales.Orders.
   Ожидаемый результат:
custid      empid
----------- -----------
1           1
3           3
5           8
5           9
6           9
7           6
9           1
12          2
16          7
17          1
20          7
24          8
25          1
26          3
32          4
38          9
39          3
40          2
41          2
42          2
44          8
47          3
47          4
47          8
49          7
55          2
55          3
56          6

59          8
63          8
64          9
65          3
65          8
66          5
67          5
70          3
71          2
75          1
76          2
76          5
80          1
81          1
81          3
81          4
82          6
84          1
84          3
84          4
88          7
89          4
(строк обработано: 50)



SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080101' AND orderdate < '20080201'
EXCEPT
SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080201' AND orderdate < '20080301';

Заддание 3
Напишите запрос, который возвращает пары «клиент — сотрудник», работавшие 
с заказами как в январе, так и в феврале 2008 г.
   Используется таблица Sales.Orders.
   Ожидаемый результат:
custid      empid
----------- -----------
20          3
39          9
46          5
67          1
71          4
(строк обработано: 5)

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080101' AND orderdate < '20080201'
INTERSECT
SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080201' AND orderdate < '20080301';

Задание 4
Напишите запрос, который возвращает пары «клиент — сотрудник», работавшие 
с заказами в январе и феврале 2008 г., но не в 2007 г.
   Используется таблица Sales.Orders.
   Ожидаемый результат:
custid      empid
----------- -----------
67          1
46          5
(строк обработано: 2)


SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080101' AND orderdate < '20080201'
INTERSECT
SELECT custid, empid
FROM Sales.Orders

WHERE orderdate >= '20080201' AND orderdate < '20080301'
EXCEPT
SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20070101' AND orderdate < '20080101';


Задание 5 (углубленное, по желанию)
У вас есть следующий запрос.
SELECT country, region, city
FROM HR.Employees
UNION ALL
SELECT country, region, city
FROM Production.Suppliers;
Вы должны добавить в него код, благодаря которому строки из таблицы Employees 
будут находиться в результирующем наборе перед строками из таблицы Suppliers. 
Кроме того, каждый сегмент должен быть отсортирован по стране, региону и городу.
   Используются таблицы HR.Employees и Production.Suppliers.
   Ожидаемый результат:
country         region          city
--------------- --------------- ---------------
Великобритания  NULL            Лондон
Великобритания  NULL            Лондон
Великобритания  NULL            Лондон
Великобритания  NULL            Лондон
США             WA              Киркланд
США             WA              Редмонд
США             WA              Сиэтл
США             WA              Сиэтл
США             WA              Такома
Австралия       NSW             Сидней
Австралия       Виктория        Мельбурн
Бразилия        NULL            Сан-Паулу
Великобритания  NULL            Лондон
Великобритания  NULL            Манчестер
Германия        NULL            Берлин
Германия        NULL            Куксхафен
Германия        NULL            Франкфурт
Дания           NULL            Лингби
Испания         Астурия         Овьедо
Италия          NULL            Равенна
Италия          NULL            Салерно
Канада          Квебек          Монреаль
Канада          Квебек          Сент-Иасент
Нидерланды      NULL            Зандам
Норвегия        NULL            Сандвика
Сингапур        NULL            Сингапур
США             LA              Новый Орлеан
США             MA              Бостон
США             MI              Энн-Арбор
США             OR              Бенд
Финляндия       NULL            Лаппеэнранта
Франция         NULL            Анси
Франция         NULL            Монсо
Франция         NULL            Париж
Швеция          NULL            Гетеборг
Швеция          NULL            Стокгольм

SELECT country, region, city
FROM (SELECT 1 AS sortcol, country, region, city
      FROM HR.Employees
      UNION ALL
      SELECT 2, country, region, city
      FROM Production.Suppliers) AS D
ORDER BY country, region, city;