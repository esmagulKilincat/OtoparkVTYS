create database otopark_otomasyon;
use otopark_otomasyon;
create table if not exists tarife(
tarife_id INT AUTO_INCREMENT,
tarife_tipi VARCHAR(20),
ucret INT,
PRIMARY KEY(tarife_id)
);
create table if not exists kullanici(
kullanici_id INT AUTO_INCREMENT,
ad VARCHAR(50),
soyad VARCHAR(50),
tc_no VARCHAR(11),
tel_No VARCHAR(10),
tarife_id INT,
PRIMARY KEY(kullanici_id),
FOREIGN KEY(tarife_id) REFERENCES tarife(tarife_id)
);
create table if not exists arac(
arac_id INT AUTO_INCREMENT,
plaka varchar(20) UNIQUE,
kullanici_id INT,
PRIMARY KEY(arac_id),
FOREIGN KEY(kullanici_id) REFERENCES kullanici(kullanici_id)
);
create table if not exists rezervasyon(
rez_id INT AUTO_INCREMENT,
baslangic_tarih DATE,
bitis_tarih DATE,
park_id INT,
arac_id INT,
PRIMARY KEY(rez_id),
FOREIGN KEY(arac_id) REFERENCES arac(arac_id)
);
create table if not exists kart(
kart_id INT AUTO_INCREMENT,
kart_no VARCHAR(16) UNIQUE,
kart_skt VARCHAR(5),
cvv VARCHAR(3),
kullanici_id INT,
PRIMARY KEY(kart_id),
FOREIGN KEY(kullanici_id) REFERENCES kullanici(kullanici_id)
);
create table if not exists arac_kayit(
kayit_id INT AUTO_INCREMENT,
rez_id INT,
tarih DATE,
PRIMARY KEY(kayit_id),
FOREIGN KEY(rez_id) REFERENCES rezervasyon(rez_id)
);
create table if not exists admin(
admin_id INT AUTO_INCREMENT,
kullanici_adi VARCHAR(30),
sifre VARCHAR(30),
PRIMARY KEY(admin_id)
);
create table if not exists iletisim(
iletisim_id INT AUTO_INCREMENT,
adres VARCHAR(100),
telefon varchar(20),
mail VARCHAR(50),
PRIMARY KEY(iletisim_id)
);
INSERT INTO tarife (tarife_tipi, ucret) VALUES
('Tam', 100),
('Emekli', 85),
('Öğrenci', 70),
('Asker/Polis', 75);
INSERT INTO kullanici (kullanici_id, ad, soyad, tc_no, tel_No, tarife_id) VALUES
(10,'Ahmet', 'Yılmaz', '12345678901', '5551234567', 1),
(11,'Ayşe', 'Kara', '23456789012', '5552345678', 2),
(12,'Mehmet', 'Demir', '34567890123', '5553456789', 2),
(13,'Fatma', 'Şahin', '45678901234', '5554567890', 4),
(14,'Ali', 'Çelik', '56789012345', '5555678901', 3);
INSERT INTO arac (plaka, kullanici_id) VALUES
('34ABC123', 10),
('35DEF456', 11),
('36GHI789', 12),
('37JKL012', 13),
('38MNO345', 14);
INSERT INTO rezervasyon (rez_id, baslangic_tarih, bitis_tarih, park_id, arac_id) VALUES
(100,'2024-04-01', '2024-04-05', 1, 1),
(101,'2024-04-02', '2024-04-06', 2, 2),
(102,'2024-04-03', '2024-04-07', 3, 3),
(103,'2024-04-04', '2024-04-08', 4, 4),
(104,'2024-04-05', '2024-04-09', 5, 5);
INSERT INTO kart (kart_no, kart_skt, cvv, kullanici_id) VALUES
('1111222233334444', '04/26', '123', 10),
('2222333344445555', '05/27', '234', 11),
('3333444455556666', '06/28', '345', 12),
('4444555566667777', '07/29', '456', 13),
('5555666677778888', '08/30', '567', 14);
INSERT INTO arac_kayit (rez_id, tarih) VALUES
(100, '2024-04-01'),
(100, '2024-04-02'),
(100, '2024-04-03'),
(100, '2024-04-04'),
(100, '2024-04-05');
INSERT INTO arac_kayit (rez_id, tarih) VALUES
(101, '2024-04-03'),
(101, '2024-04-04'),
(101, '2024-04-05'),
(101, '2024-04-06'),
(101, '2024-04-07');
INSERT INTO arac_kayit (rez_id, tarih) VALUES
(102, '2024-04-03'),
(102, '2024-04-04');
INSERT INTO arac_kayit (rez_id, tarih) VALUES
(103, '2024-04-05'),
(103, '2024-04-06'),
(103, '2024-04-07');
INSERT INTO arac_kayit (rez_id, tarih) VALUES
(104, '2024-04-08'),
(104, '2024-04-09'),
(104, '2024-04-10');
