INSERT INTO Clients VALUES('DAN','POP','email1','address1')
INSERT INTO Clients VALUES('ION','GAL','anothermail@e.com','adresss105')
INSERT INTO Clients VALUES('CATALIN','PAN','myemail@p.com','street23')
INSERT INTO Clients VALUES('ALIN','POPESCU','alin@p.com','strABC121')
INSERT INTO Clients VALUES('PAULA','BOTA','paula@p.com','12STREEET')

INSERT INTO Plants VALUES('ORHIDEE','WHITE')
INSERT INTO Plants(name) VALUES('CACTUS')
INSERT INTO Plants VALUES('ROSE','RED')


INSERT INTO Employees VALUES('MIHAI','DAN')
INSERT INTO Employees(first_name,last_name) VALUES('ION','POPESCU')
INSERT INTO Employees VALUES('PAUL','VLAD')
INSERT INTO Employees VALUES('DAVID','GIURGIU')


INSERT INTO Plant_Employees VALUES(1,2)
INSERT INTO Plant_Employees VALUES(2,1)
INSERT INTO Plant_Employees VALUES(1,3)
INSERT INTO Plant_Employees VALUES(3,4)
INSERT INTO Souvenirs VALUES('magnets')


INSERT INTO Vouchers VALUES('voucher1',100,13)
INSERT INTO Vouchers VALUES('myVoucher',121,9)
INSERT INTO Vouchers VALUES('roseVoucher',200,10)
INSERT INTO Vouchers VALUES('goldVaucher',350,11)
INSERT INTO Vouchers VALUES('silverVoucher',300,12)



 
 DELETE FROM Clients WHERE ID = 2
 DELETE FROM Plant_Employees 
 WHERE id_plant BETWEEN 1 AND 2
 DELETE FROM Plants
 WHERE id BETWEEN 1 AND 3

UPDATE Clients
SET email = 'popa@y.com' , address = 'abcStreet'
WHERE first_name = 'POPA'

UPDATE Clients
SET email= 'em@g.com' 
WHERE ID >=3 AND first_name = 'DAN'

UPDATE Plants
SET color  = 'blue'
WHERE color IS NULL

UPDATE Plants
SET color = 'PINK'
WHERE name LIKE '%D%'


SELECT * FROM Clients
SELECT * FROM Plants
SELECT * FROM Plant_Employees
SELECT * FROM Vouchers
SELECT * FROM Employees


SELECT first_name, last_name FROM Clients
WHERE email LIKE 'e%'

SELECT first_name , last_name FROM Clients
WHERE email > 'm'

SELECT id
FROM Clients 
WHERE last_name like '%P'
UNION --OR	
SELECT id
FROM Clients
WHERE id > 2


SELECT id
FROM Clients 
WHERE last_name like '%P'
INTERSECT --AND
SELECT id
FROM Clients
WHERE id > 2

SELECT id
FROM Clients 
WHERE last_name like '%P'
EXCEPT 
SELECT id
FROM Clients
WHERE id>10


select *
from Clients c INNER JOIN Employees e ON
c.id=e.id

-- LEFT OUTER JOIN
INSERT INTO Vouchers VALUES('V1',200,13) 
SELECT *
FROM Clients a LEFT OUTER JOIN Vouchers b ON
a.id=b.id

-- RIGHT OUTER JOIN
SELECT *
FROM Vouchers c RIGHT OUTER JOIN Clients d ON
c.ID=d.id

-- FULL OUTER JOIN
SELECT *
FROM Vouchers e FULL OUTER JOIN Clients f ON
e.id=f.id

--IN AND EXISTS 
SELECT s.id, s.type
FROM Vouchers s 
WHERE summ>100 and s.id IN (SELECT f.id FROM Clients f)

SELECT s.id, s.type
FROM Vouchers s 
WHERE summ>100 and EXISTS (SELECT * FROM Clients g
WHERE g.id=s.id)

--FROM
SELECT A.id, A.id
FROM (SELECT g.id, s.type, s.summ
FROM Clients g INNER JOIN Vouchers s ON g.id=s.id
WHERE summ>5) A

--GROUP BY
select TOP 2 g.id, AVG(s.summ)
FROM Clients g INNER JOIN Vouchers s ON g.id=s.id
GROUP BY g.id
HAVING AVG(s.summ)>=100

-- group by COUNT DESC
SELECT g.id, COUNT(*) as clients
FROM Clients g
GROUP BY g.id
order by COUNT(*) DESC

--HAVING MIN AVG
select DISTINCT c.id, AVG(v.summ)
FROM Vouchers v INNER JOIN Clients c ON v.id=c.id
GROUP BY c.id
HAVING AVG(v.summ)>=(SELECT MIN(summ) FROM Vouchers)

SELECT g.id, AVG(s.id)
FROM Clients g INNER JOIN Vouchers s ON
g.id=s.id
WHERE g.id<=2 or type LIKE 'V%'
GROUP BY g.id

SELECT g.id, AVG(s.summ)
FROM Clients g INNER JOIN Vouchers s ON
g.id=s.id
WHERE g.id<=2 AND type LIKE 'V%'
GROUP BY g.id

select DISTINCT s.summ
from Vouchers s

SELECT *
FROM Vouchers
ORDER BY type ASC

SELECT *
FROM Vouchers
ORDER BY summ DESC

SELECT TOP 2 summ,type 
from Vouchers 





