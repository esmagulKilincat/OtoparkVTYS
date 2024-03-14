CREATE DATABASE OTOPARK;
USE OTOPARK;
CREATE TABLE IF NOT EXISTS KULLANICI(
kullanici_id INT AUTO_INCREMENT,
ad varchar(50) NOT NULL,
soyad varchar(50) NOT NULL,
tc varchar(11) NOT NULL,
telno varchar(11) NOT NULL,
PRIMARY KEY (kullanici_id),
UNIQUE (tc)
);

CREATE TABLE IF NOT EXISTS TARIFE(
tarife_id INT,
tarife_tip varchar(20),
ucret INT,
PRIMARY KEY (tarife_id)
);

CREATE TABLE IF NOT EXISTS  ARACLAR(
 arac_id INT AUTO_INCREMENT ,
 plaka varchar(10) NOT NULL,
 tarife_id INT,
 kullanici_id INT,
 PRIMARY KEY(arac_id),
 FOREIGN KEY (tarife_id) REFERENCES TARIFE(tarife_id),
 FOREIGN KEY (kullanici_id) REFERENCES KULLANICI(kullanici_id),
 UNIQUE(plaka)
);

CREATE TABLE IF NOT EXISTS PARK_ALANI(
park_id INT AUTO_INCREMENT,
durum BOOLEAN NOT NULL,
PRIMARY KEY (park_id)
);

CREATE TABLE IF NOT EXISTS REZERVASYON(
rezervasyon_id INT AUTO_INCREMENT,
baslangic_tarih DATE NOT NULL,
bitis_tarih DATE NOT NULL,
park_id INT,
arac_id INT,
PRIMARY KEY (rezervasyon_id),
FOREIGN KEY (park_id) REFERENCES PARK_ALANI(park_id),
FOREIGN KEY (arac_id) REFERENCES ARACLAR(arac_id)
);

CREATE TABLE IF NOT EXISTS KARTLAR(
kart_id INT AUTO_INCREMENT,
kart_no varchar(16) NOT NULL,
kart_cvv varchar(3) NOT NULL,
kart_skt varchar(4) NOT NULL,
kullanici_id INT NOT NULL,
PRIMARY KEY (kart_id),
UNIQUE(kart_no),
FOREIGN KEY (kullanici_id) REFERENCES KULLANICI(kullanici_id)
);


INSERT INTO KULLANICI (kullanici_id, ad, soyad, tc, telno) VALUES
(1, 'Doğukan', 'Görür', 11100022333, 5554445555),
(2, 'Ayşe', 'Kaya', 22211133444, 5556667777),
(3, 'Mehmet', 'Yılmaz', 33322244555, 5558889999),
(4, 'Fatma', 'Demir', 44433355666, 5551112222),
(5, 'Ahmet', 'Aydın', 55544466777, 5553334444),
(6, 'Aylin', 'Çelik', 66655577888, 5555556666),
(7, 'Mustafa', 'Aksoy', 77766688999, 5557778888),
(8, 'Zeynep', 'Şahin', 88877700111, 5559990000),
(9, 'Emre', 'Koç', 99988811222, 5550001111),
(10, 'Selin', 'Yıldız', 10109992233, 5552223333);

INSERT INTO TARIFE (tarife_id, tarife_tip, ucret) VALUES
(1, 'abonman', 10),
(2, 'misafir', 50);


INSERT INTO ARACLAR (arac_id, plaka, tarife_id, kullanici_id) VALUES
(1, '34ABC123', 1, 1),
(2, '06DEF456', 2, 2),
(3, '35GHI789', 1, 3);

INSERT INTO PARK_ALANI (park_id, durum) VALUES
(1, 1),
(2, 0),
(3, 1);

INSERT INTO REZERVASYON (rezervasyon_id, baslangic_tarih, bitis_tarih, park_id, arac_id) VALUES
(1, '2024-03-11', '2024-03-12', 1, 1),
(2, '2024-03-12', '2024-03-14', 2, 2),
(3, '2024-03-13', '2024-03-20', 3, 3);

INSERT INTO KARTLAR (kart_id, kart_no, kart_cvv, kart_skt, kullanici_id) VALUES
(1, '1234567890123456', '123', '0328', 1),
(2, '2345678901234567', '456', '0625', 2),
(3, '3456789012345678', '789', '1123', 3);
