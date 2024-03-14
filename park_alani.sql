CREATE DATABASE IF NOT EXISTS DENEME;
USE DENEME;
CREATE TABLE IF NOT EXISTS PARK_YERI(
yer_id INT,
tarih DATE NOT NULL
);

INSERT INTO park_yeri (yer_id, tarih)
VALUES
(1,'2024-03-06'),
(1,'2024-03-07'),
(1,'2024-03-08'),
(1,'2024-03-09'),
(2,'2024-03-07'),
(2,'2024-03-08'),
(3,'2024-03-10'),
(3,'2024-03-11'),
(3,'2024-03-12'),
(3,'2024-03-13'),
(4,'2024-03-03'),
(4,'2024-03-04'),
(4,'2024-03-05'),
(4,'2024-03-06'),
(4,'2024-03-07'),
(5,'2024-03-08'),
(5,'2024-03-09'),
(5,'2024-03-10'),
(6,'2024-03-11'),
(6,'2024-03-12');
SELECT * FROM park_yeri WHERE yer_id=$i;