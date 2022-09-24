

--1
--��������� ��������� ���, ����� ������� � �� TSQL2012 ������� dbo.Customers.

USE TSQL2012;
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
CREATE TABLE dbo.Customers
(
  custid      INT          NOT NULL PRIMARY KEY,
  companyname NVARCHAR(40) NOT NULL,
  country     NVARCHAR(15) NOT NULL,
  region      NVARCHAR(15) NULL,
  city        NVARCHAR(15) NOT NULL
);


--1-1
--�������� � ������� dbo.Customers ������ �� ���������� ����������:
--   custid: 100
--   companyname: ���� � ������
--   country: ���
--   region: WA
--   city: �������





--1-2
--�������� �� ������� Sales.Customers ������ � ���� ��������, ������� ��������� 
--������, � ���������� �� � ������� dbo.Customers.



--1-3
--� ������� ������� SELECT INTO �������� ������� dbo.Orders � ��������� �� 
--�������� �� ������� Sales.Orders, ������� ���� ��������� � 2006�2008 ��. ����� 
--��������, ��� ��� ���������� ����� ��������� ������ �� ��������� ������ SQL 
--Server, ��������� SQL Database �� ������������ ������� SELECT INTO (������ 
--����� ������������ ������� CREATE TABLE � INSERT SELECT).


--2
--������� �� ������� dbo.Orders ������, ����������� �� ������� 2006 �. ������-
--����� ���������� OUTPUT, ����� ������� �������� orderid � orderdate, ���-
--���������� ��������� �������.
--   ��������� ���������:
--orderid     orderdate
------------- -----------------------
--10248       2006-07-04 00:00:00.000
--10249       2006-07-05 00:00:00.000
--10250       2006-07-08 00:00:00.000
--10251       2006-07-08 00:00:00.000
--10252       2006-07-09 00:00:00.000
--10253       2006-07-10 00:00:00.000
--10254       2006-07-11 00:00:00.000
--10255       2006-07-12 00:00:00.000
--10256       2006-07-15 00:00:00.000
--10257       2006-07-16 00:00:00.000
--10258       2006-07-17 00:00:00.000
--10259       2006-07-18 00:00:00.000
--10260       2006-07-19 00:00:00.000
--10261       2006-07-19 00:00:00.000
--10262       2006-07-22 00:00:00.000
--10263       2006-07-23 00:00:00.000
--10264       2006-07-24 00:00:00.000
--10265       2006-07-25 00:00:00.000
--10266       2006-07-26 00:00:00.000
--10267       2006-07-29 00:00:00.000
--10268       2006-07-30 00:00:00.000
--10269       2006-07-31 00:00:00.000
--(����� ����������: 22)


--3
--������� �� ������� dbo.Orders ������, ����������� ������������ ���������.


4
��������� ������ � ������� dbo.Customers, �������������� ����. �������� 
��������, ��� ��������� ������ �������� NULL � ������� region.
SELECT * FROM dbo.Customers;

��������� ������ ���� ���������.
custid      companyname   country         region          city
----------- ------------- --------------- --------------- ------------
1           ������ NRZBB  ��������        NULL            ������
2           ������ MLTDN  �������         NULL            ������
3           ������ KBUDE  �������         NULL            ������
4           ������ HFBZG  ��������������  NULL            ������
5           ������ HGVLZ  ������          NULL            �����
6           ������ XHXJV  ��������        NULL            �������
7           ������ QXVLA  �������         NULL            ���������
8           ������ QUHWH  �������         NULL            ������
9           ������ RTXGC  �������         NULL            �������
10          ������ EEALV  ������          BC              ����������
...
(����� ����������: 90)

������ �������� ������� dbo.Customers, ������� ������� NULL ���������� 
'<None>'. ����������� ���������� OUTPUT, ����� ������� ���������� �����-
��� custid, oldregion � newregion.
��������� ���������:
custid      oldregion       newregion
----------- --------------- ---------------
1           NULL            <None>
2           NULL            <None>
3           NULL            <None>
4           NULL            <None>
5           NULL            <None>
6           NULL            <None>
7           NULL            <None>
8           NULL            <None>
9           NULL            <None>
11          NULL            <None>
12          NULL            <None>
13          NULL            <None>
14          NULL            <None>
16          NULL            <None>
17          NULL            <None>
18          NULL            <None>
19          NULL            <None>
20          NULL            <None>
23          NULL            <None>
24          NULL            <None>
25          NULL            <None>
26          NULL            <None>
27          NULL            <None>
28          NULL            <None>
29          NULL            <None>
30          NULL            <None>
39          NULL            <None>
40          NULL            <None>
41          NULL            <None>
44          NULL            <None>
49          NULL            <None>
50          NULL            <None>
52          NULL            <None>
53          NULL            <None>
54          NULL            <None>
56          NULL            <None>
58          NULL            <None>
59          NULL            <None>
60          NULL            <None>
63          NULL            <None>
64          NULL            <None>
66          NULL            <None>
68          NULL            <None>
69          NULL            <None>
70          NULL            <None>
72          NULL            <None>
73          NULL            <None>
74          NULL            <None>
76          NULL            <None>
79          NULL            <None>
80          NULL            <None>
83          NULL            <None>
84          NULL            <None>
85          NULL            <None>
86          NULL            <None>
87          NULL            <None>
90          NULL            <None>
91          NULL            <None>
(����� ����������: 58)

--5
--�������� � ������� dbo.Orders ��� ������, ������� ���� ��������� �����-
--���� �� ��������������; ��������� �� ��������� shipcountry, shipregion 
--� shipcity �������� country, region � city, ������ �� ������� dbo.Customers.
--�������� � ������������, ��������� ��������� ���, ����� �������� ��.
--IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL DROP TABLE dbo.Orders;
--IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;


