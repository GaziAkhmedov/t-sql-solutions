1
�������� ������, ������� ���������� ����������� ��������������� ������� 
� ������� ������� � ��������� �� 1 �� 10, �� ��������� ��� ���� ����. �������� 
��������� ����� �� �������������.
   �� ������������ �� ����� �������.
     ��������� ���������:
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
(����� ����������: 10)


SELECT 1 AS n;



������� 2

�������� ������, ������� ���������� ���� ������� � ���������, ���������� 
� �������� � ������, � �� � ������� 2008 �.
   ������������ ������� Sales.Orders.
   ��������� ���������:
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
(����� ����������: 50)



SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080101' AND orderdate < '20080201'
EXCEPT
SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080201' AND orderdate < '20080301';

�������� 3
�������� ������, ������� ���������� ���� ������� � ���������, ���������� 
� �������� ��� � ������, ��� � � ������� 2008 �.
   ������������ ������� Sales.Orders.
   ��������� ���������:
custid      empid
----------- -----------
20          3
39          9
46          5
67          1
71          4
(����� ����������: 5)

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080101' AND orderdate < '20080201'
INTERSECT
SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20080201' AND orderdate < '20080301';

������� 4
�������� ������, ������� ���������� ���� ������� � ���������, ���������� 
� �������� � ������ � ������� 2008 �., �� �� � 2007 �.
   ������������ ������� Sales.Orders.
   ��������� ���������:
custid      empid
----------- -----------
67          1
46          5
(����� ����������: 2)


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


������� 5 (�����������, �� �������)
� ��� ���� ��������� ������.
SELECT country, region, city
FROM HR.Employees
UNION ALL
SELECT country, region, city
FROM Production.Suppliers;
�� ������ �������� � ���� ���, ��������� �������� ������ �� ������� Employees 
����� ���������� � �������������� ������ ����� �������� �� ������� Suppliers. 
����� ����, ������ ������� ������ ���� ������������ �� ������, ������� � ������.
   ������������ ������� HR.Employees � Production.Suppliers.
   ��������� ���������:
country         region          city
--------------- --------------- ---------------
��������������  NULL            ������
��������������  NULL            ������
��������������  NULL            ������
��������������  NULL            ������
���             WA              ��������
���             WA              �������
���             WA              �����
���             WA              �����
���             WA              ������
���������       NSW             ������
���������       ��������        ��������
��������        NULL            ���-�����
��������������  NULL            ������
��������������  NULL            ���������
��������        NULL            ������
��������        NULL            ���������
��������        NULL            ���������
�����           NULL            ������
�������         �������         ������
������          NULL            �������
������          NULL            �������
������          ������          ��������
������          ������          ����-������
����������      NULL            ������
��������        NULL            ��������
��������        NULL            ��������
���             LA              ����� ������
���             MA              ������
���             MI              ���-�����
���             OR              ����
���������       NULL            ������������
�������         NULL            ����
�������         NULL            �����
�������         NULL            �����
������          NULL            ��������
������          NULL            ���������

SELECT country, region, city
FROM (SELECT 1 AS sortcol, country, region, city
      FROM HR.Employees
      UNION ALL
      SELECT 2, country, region, city
      FROM Production.Suppliers) AS D
ORDER BY country, region, city;