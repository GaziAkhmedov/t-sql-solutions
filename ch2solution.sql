--�����2 

--1
--�������� ������ � ������� Sales.Orders, ������� ���������� ������, ����������� � ���� 2007 �.
--������������ �� TSQL2012 � ������� Sales.Orders.
--��������� ��������� (� ����������� ����):
--orderid orderdate custid empid
------------- ----------------------- ----------- -----------
--10555 2007-06-02 00:00:00.000 71 6
--10556 2007-06-03 00:00:00.000 73 2
--10557 2007-06-03 00:00:00.000 44 9
--10558 2007-06-04 00:00:00.000 4 1
--10559 2007-06-05 00:00:00.000 7 6
--10560 2007-06-06 00:00:00.000 25 8
--10561 2007-06-06 00:00:00.000 24 2
--10562 2007-06-09 00:00:00.000 66 1
--10563 2007-06-10 00:00:00.000 67 2
--10564 2007-06-10 00:00:00.000 65 4
--�
--(����� ����������: 30)

SELECT orderid, orderdate, custid, empid
FROM Sales.Orders
WHERE YEAR(orderdate) = 2007 AND MONTH(orderdate) = 6;






2
�������� ������ � ������� Sales.Orders, ������� ���������� ������, ����������� � ��������� ���� ������.
������������ �� TSQL2012 � ������� Sales.Orders.
��������� ��������� (� ����������� ����):
orderid orderdate custid empid
----------- ----------------------- ----------- -----------
10269 2006-07-31 00:00:00.000 89 5
10317 2006-09-30 00:00:00.000 48 6
10343 2006-10-31 00:00:00.000 44 4
10399 2006-12-31 00:00:00.000 83 8
10432 2007-01-31 00:00:00.000 75 3
10460 2007-02-28 00:00:00.000 24 8
10461 2007-02-28 00:00:00.000 46 1
10490 2007-03-31 00:00:00.000 35 7
10491 2007-03-31 00:00:00.000 28 8
10522 2007-04-30 00:00:00.000 44 4
�
(����� ����������: 26)


use TSQL2012
select *
from sales.Orders
where EOMONTH(orderdate) = orderdate


--3
--�������� ������ � ������� HR.Employees, ������� ���������� ������ � �����������, ��� ������� �������� ������ ����� ����� ��.
--������������ �� TSQL2012 � ������� HR.Employees.
--��������� ���������:
--empid firstname lastname
------------- ---------- --------------------
--9 ��� �����������
--(����� ����������: 1)


select *
from HR.Employees
where lastname LIKE '%o%o%'




--4
--�������� ������ � ������� Sales.OrderDetails, ������� ���������� ������ � ����� 
--���������� (����������� ��� ����������, ���������� �� ���� ���������� ������) 
--����� 10 000. ���������� ����������� �� ����� ���������.
--������������ �� TSQL2012 � ������� Sales.OrderDetails.
--��������� ���������:
--orderid totalvalue
------------- ---------------------
--10865 17250,00
--11030 16321,90
--10981 15810,00
--10372 12281,20
--10424 11493,20
--10817 11490,70
--10889 11380,00
--10417 11283,20
--10897 10835,24
--10353 10741,60
--10515 10588,50
--10479 10495,60
--10540 10191,70
--10691 10164,80
--(����� ����������: 14)

Select orderid, SUM(unitprice*qty) AS totalvalue
from Sales.OrderDetails
group by orderid
HAVING SUM(unitprice*qty ) > 10000
order by totalvalue DESC;



--5
--�������� ������ � ������� Sales.Orders, ����� �� ��������� ��� ������, ������� 
--��������� �������� ������� � ������� ���� ����� ������� � 2007 �.
--������������ �� TSQL2012 � ������� Sales.Orders.
--��������� ���������:
--shipcountry avgfreight
----------------------------------- ---------------------
--������� 178,3642
--��������� 117,1775
--������ 105,16
--(����� ����������: 3)

select shipcountry, AVG(freight) as avgfreight
FROM Sales.Orders
where DATEPART(YEAR, orderdate) = 2007
group by shipcountry
order by avgfreight desc



--6
--�������� ������ � ������� Sales.Orders, ������� ��������� ������ ����� �������� ��� ������� �������, ������ �� ���� ���������� ������ (��������� ������������� ������ � �������� ��������������� �������).
--������������ �� TSQL2012 � ������� Sales.Orders.
--��������� ��������� (� ����������� ����):
--custid orderdate orderid rownum
------------- ----------------------- ----------- ---------
--1 2007-08-25 00:00:00.000 10643 1
--1 2007-10-03 00:00:00.000 10692 2
--1 2007-10-13 00:00:00.000 10702 3
--1 2008-01-15 00:00:00.000 10835 4
--1 2008-03-16 00:00:00.000 10952 5
--1 2008-04-09 00:00:00.000 11011 6
--2 2006-09-18 00:00:00.000 10308 1
--2 2007-08-08 00:00:00.000 10625 2
--2 2007-11-28 00:00:00.000 10759 3
--2 2008-03-04 00:00:00.000 10926 4
--�
--(����� ����������: 830)


Select custid, orderdate, orderid, ROW_NUMBER () OVER (PARTITION BY custid ORDER BY orderdate, orderid) AS rownum
From Sales.Orders
Order by custid, rownum


--7
--��������� ������� HR.Employees, �������� ���������� SELECT, ������� ���������� ��� ������� ����������, ������ �� ����� ��������� � ����. �������� 
--'����' � '������' �������� '�������'; '������' �������� '�������'; �� ���� 
--��������� ������� (��������, '������') ������ ������������ '����������'.
--������������ �� TSQL2012 � ������� HR.Employees.
--��������� ���������:
--empid firstname lastname titleofcourtesy gender
------------- ---------- ------------- ------------------- ----------
--1 ���� ����� ���� �������
--2 ��� ���� ������ ����������
--3 ����� ��� ���� �������
--4 ����� ����� ������ �������
--5 ���� ��� ������ �������
--6 ��� ����� ������ �������
--7 ������ ���� ������ �������
--8 ����� ������� ���� �������
--9 ��� ����������� ���� �������
--(����� ����������: 9)


use TSQL2012

SELECT empid, firstname, lastname, titleofcourtesy,
	CASE titleofcourtesy
		WHEN 'Mr.' THEN 'man'
		WHEN 'Mrs.' THEN 'woman'
		WHEN 'Ms.' THEN 'woman'
		ELSE 'unknown'
	END AS gender
FROM HR.Employees




--8
--�������� ������ � ������� Sales.Customers, ������� ���������� ��� ������� 
--������� ��� ������������� � ������. ���������� ������ ����������� �� �������, 
--� ������� NULL ���������� ����� ����������� ��������. �������, ��� �� ��������� ���� T-SQL ��������� ������� NULL � ������ ��������������� ������

--������������ �� TSQL2012 � ������� Sales.Customers.
--��������� ��������� (� ����������� ����):
--custid region
------------- ---------------
--55 AK
--10 BC
--42 BC
--45 CA
--33 DF
--71 ID
--78 MT
--65 NM
--32 OR
--...
--1 NULL
--2 NULL
--3 NULL
--4 NULL
--5 NULL
--6 NULL
--7 NULL
--8 NULL
--9 NULL
--11 NULL
--...
--(����� ����������: 91)


SELECT custid, region
FROM Sales.Customers
ORDER BY 
	CASE WHEN region IS NULL THEN 1 ELSE 0 END, region



