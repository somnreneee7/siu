-- Tugas SMBD Prak7
-- Kelompok 7
-- Akmal Raka Pangestu (Informatika)
-- Febri Rahayu Ningsih (Informatika)
-- Fadila Nur Kamala (Sistem Informasi)
-- -----------------------------------------------------------------------------------------------
-- Membuat Database dengan tema Tour Perjalanan
create database tour_perjalanan_2;
use tour_perjalanan_2;
show databases;
-- Membuat Tabel Database
-- Table Hotel (1)
create table hotel (id_hotel int(5) primary key, 
					nama_hotel varchar(35) not null,
					alamat varchar(225) not null,
					bintang_hotel int(2) not null,
					harga_hotel int(7) not null);
select * from hotel;
-- ---------------------
-- Table Pesawat (2)
create table pesawat (id_pesawat int(5) primary key, 
					  maskapai varchar(35) not null,
				      kelas varchar(35) not null,
                      harga_tiket int(7) not null,
                      seat_kursi varchar (35) not null);
select * from pesawat;
-- ------------------------
-- Table Destinasi (3)
create table destinasi (id_destinasi int(9) primary key, 
                        nama_destinasi varchar(35) not null,
                        deskripsi_destinasi varchar (225) not null,
					    kegiatan_yg_dilakukan varchar (225) not null,
                        lokasi varchar(225) not null);
select * from destinasi;
-- ------------------------
-- Table Pelanggan (4)
create table pelanggan (id_pelanggan int(7) primary key, 
                        nama_pelanggan varchar(35) not null,
                        jenis_kelamin enum ('L','P'),
                        alamat varchar(225) not null,
                        tanggal_lahir date not null,
                        nomor_telepon bigint(16));
select * from pelanggan;
-- --------------------------
-- Table Paket_Pariwisata (5)
create table paket_pariwisata (id_paket int(8) primary key, 
							   nama_paket varchar(35) not null,
							   durasi varchar(35) not null,
						       harga_paket int(7),
                               ketersediaan_paket enum ('Y','T') not null,
                               layanan_tambahan varchar (225) not null,
							   id_hotel int,
						       id_pesawat int,
							   id_destinasi int,
							   FOREIGN KEY (id_hotel) REFERENCES hotel(id_hotel),
							   FOREIGN KEY (id_pesawat) REFERENCES pesawat(id_pesawat),
							   FOREIGN KEY (id_destinasi) REFERENCES destinasi(id_destinasi));
select * from paket_pariwisata;
-- -------------------------------
-- Table Pemesanan (6) 
create table pemesanan (id_pemesanan int(4) primary key, 
                        metode_pembayaran varchar (10) not null,
                        tanggal_pemesanan date,
                        status_pembayaran enum ('Berhasil','Tidak Berhasil') not null,
						total_bayar int(10) not null,
                        request_tambahan varchar(225) not null,
                        id_pelanggan int,
						id_paket int,
						FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
						FOREIGN KEY (id_paket) REFERENCES paket_pariwisata(id_paket));
select * from pemesanan;
-- -----------------------------------------------------------------------------------------------

-- Menambahkan Data ke Tabel
-- Data Table Hotel (1)
insert into hotel (id_hotel, nama_hotel, alamat, bintang_hotel, harga_hotel)
values  (10001, 'Alpha Hotel', 'Jalan Kebangsaan Bandung', 1, 100000),
		(10002, 'Beta Hotel', 'Jalan Berada Bandung', 1, 120000),
		(10011, 'Stay Hotel', 'Phenang street kuala lumpur', 2, 200000),
		(10012, 'Ritz Hotel', 'Melaka street kuala lumpur', 3, 300000),
		(10021, 'Bangkoknese Hotel', 'Pherita street bangkok', 3, 250000),
		(10022, 'Melaneseza Hotel', 'Senirat street bangkok', 2, 200000),
		(10031, 'Calm Hotel', 'Kuta street Bali', 3, 300000),
		(10032, 'Cendana Hotel', 'Denpasar street Bali', 3, 250000),
		(10041, 'Asten Hotel', 'Jalan Patriot', 2, 150000),
		(10042, 'Merdeka Hotel', 'Jalan Cendrawasih', 2, 170000);
-- ---------------------------------------
-- Data Table Pesawat (2)
insert into pesawat (id_pesawat, maskapai, kelas, harga_tiket, seat_kursi)
values  (22111, 'Bangkok Airways', 'Economy', 1000000, 'Baris 1 Nomor 1A'),
		(22222, 'Thai Airlines', 'Economy', 1200000, 'Baris 1 Nomor 1B'),
		(11112, 'Garuda Airlines', 'Economy', 800000, 'Baris 1 Nomor 1C'),
		(11115, 'Batik Air', 'Economy', 700000, 'Baris 1 Nomor 1D'),
		(11114, 'Lion Air', 'Economy', 450000, 'Baris 1 Nomor 1E'),
		(11119, 'Citilink', 'Economy', 600000, 'Baris 1 Nomor 1F'),
		(11118, 'Sriwijaya Air', 'Economy', 500000, 'Baris 1 Nomor 1G'),
		(32111, 'Malaysia Airlines', 'Economy', 1000000, 'Baris 1 Nomor 1H'),
		(32211, 'Berjaya Airways', 'Economy', 900000, 'Baris 1 Nomor 1I'),
		(32311, 'Air Asia', 'Economy', 750000, 'Baris 1 Nomor 1J');
-- ------------------------------------------------------
-- Data Table Destinasi (3)
insert into destinasi (id_destinasi, nama_destinasi, deskripsi_destinasi, kegiatan_yg_dilakukan, lokasi)
values  (123456781, 'Bandung', 'Bandung adalah sebuah kota di Jawa Barat, Indonesia, yang terkenal dengan keindahan alamnya.', 'Mengenali Kebudayaan Lokal Bandung', 'Indonesia'),
		(123456782, 'Bangkok','Bangkok adalah ibu kota dan kota terbesar Thailand. Kota ini merupakan pusat kehidupan budaya, sejarah, dan hiburan di Asia Tenggara.', 'Mengenali Kebudayaan Lokal Thailand', 'Thailand'),
		(123456783, 'Kuala Lumpur', 'Kuala Lumpur adalah ibu kota Malaysia yang modern dan kosmopolitan. Kota ini memiliki ikon terkenal seperti Menara Kembar Petronas dan Istana Raja.', 'Mengenali Kebudayaan Lokal Malaysia', 'Malaysia'),
		(123456784, 'Bali', 'Bali adalah pulau indah di Indonesia yang terkenal dengan pantainya yang memukau, kehidupan malam yang aktif, dan budaya yang kaya', 'Mengenali Kebudayaan Lokal Bali', 'Indonesia'),
		(123456785, 'Purwokerto', 'Purwokerto adalah kota yang terletak di Jawa Tengah, Indonesia. Kota ini memiliki pesona alam dengan pegunungan yang indah di sekitarnya.', 'Mengenali Kebudayaan Lokal Purwokerto', 'Indonesia');
-- -----------------------------------------------------------
-- Data Table Pelanggan (4)
insert into pelanggan (id_pelanggan, nama_pelanggan, jenis_kelamin, alamat, tanggal_lahir, nomor_telepon)
values  (1001001, 'Anto', 'L', 'Perumahan griya sari', '1993-04-23', 081234567812),
		(1001002, 'Yono', 'L', 'Jalan Nagasari', '1996-08-03', 081235467283),
		(1001003, 'Joko', 'L', 'Perumahan Sasana Buadaya', '1994-02-13', 081637254627),
		(1001004, 'Somad', 'L', 'Jalan Metroman', '1997-01-27', 081273849286),
		(1001005, 'Soleh', 'L', 'Perumahan Pondok Cabe', '1995-12-17', 081627384901);
-- ------------------------------------------------------------------------
-- Data Table Paket_Pariwisata (5)
insert into paket_pariwisata (id_paket, nama_paket, durasi, harga_paket, ketersediaan_paket, layanan_tambahan, id_hotel, id_pesawat, id_destinasi)
values  (11122211, 'Long Holiday Bandung', '10 Hari', 4500000, 'Y', 'Makan Malam Romantis', 10001, 11112, 123456781),
		(11122222, 'Short Holiday Bangkok', '3 Hari', 7000000, 'Y', 'Eksplorasi Flora dan Fauna', 10021, 22222, 123456782),
		(11122233, 'Short Holiday Kuala Lumpur', '3 Hari', 6500000, 'Y', 'Tur Panduan Pribadi', 10011, 32111, 123456783),
		(11122244, 'Staycation Bali', '4 Hari', 4750000, 'Y', 'Layanan Antar-Jemput Bandara', 10031, 11118, 123456784),
		(11122255, 'Liburan Asik Purwokerto', '5 Hari', 2500000, 'Y', 'Membuat Kreasi Unik', 10041, 11115, 123456785);
-- --------------------------------------------------------------------------
-- Data Table Pemesanan (6)
insert into pemesanan (id_pemesanan, metode_pembayaran, tanggal_pemesanan, status_pembayaran, total_bayar, request_tambahan, id_pelanggan, id_paket)
values  (2001, 'Cash', '2023-01-03', 'Berhasil', 4500000, 'Makan Harus Menggunakan Nasi', 1001001, 11122211),
		(2002, 'Debit', '2023-01-07', 'Berhasil', 7000000, 'Tidak Kuat Udara Dingin', 1001002, 11122222),
		(2003, 'Cash', '2023-01-12', 'Berhasil', 6500000, 'Setiap Minum Sediakan Air Putih', 1001003,  11122233),
		(2004, 'Cash', '2023-01-16', 'Berhasil', 4750000, 'Selalu Sediakan Tissue', 1001004,  11122244),
		(2005, 'Debit', '2023-01-28', 'Berhasil', 2500000, 'Makan Harus Menggunakan Kecap', 1001005,  11122255);
-- -----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- diusahakan bisa menjawab apa yang melatarbelakangi pembuatan database tersebut, cari buat ppt nya penjelasan dll
-- ???
