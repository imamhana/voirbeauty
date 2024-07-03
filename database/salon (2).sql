-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jul 2024 pada 10.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salon`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` varchar(100) NOT NULL,
  `nama_gallery` varchar(100) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `nama_gallery`, `ket`, `file`, `tgl_upload`) VALUES
('2854bf67-6f53-11ee-8d63-93f0fa14750d', 'Creambath', 'Jasa creambath ini menyegarkan rambut kering sehingga kilau alami dan rambut terasa lebih sehat.', 'c83c86a26a3adc376ddc7f98e371ec54.jpeg', '2023-12-03 14:32:18'),
('32007824-6f53-11ee-8d63-93f0fa14750d', 'Catok & Cuci', 'Jasa catok untuk tampilan rambut rapi dan stylish. Hasil cepat dan tahan lama.', '683ad0c0698a718b7a800aea77fdeb78.jpg', '2023-12-03 14:34:19'),
('3c26117d-6f53-11ee-8d63-93f0fa14750d', 'Menicure', 'Jasa manicure ini menghadirkan kelembutan pada tangan Anda dengan perawatan teliti.', '10b7305245ffcce4ed6a771849d7bda1.jpg', '2023-12-03 14:29:57'),
('bce15815-91e9-11ee-a7c1-704d7b67aaac', 'Eyelash Extension', 'Jasa eyelash ini menciptakan mata memukau dengan ekstensi bulu mata yang indah dan hasil natural', 'e71b2c5ac14149bea14c23ca2be46714.jpg', '2024-06-30 13:01:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(100) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
('00c82ed7-8c23-11ee-bfa4-704d7b67aaac', 'Pedicure'),
('51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 'Eyelash Extentsion'),
('bbba07f5-6f55-11ee-8d63-93f0fa14750d', 'Lashlift'),
('c16aaf50-6f55-11ee-8d63-93f0fa14750d', 'Hair Treatment'),
('c7eda182-6f55-11ee-8d63-93f0fa14750d', 'Body Treatment'),
('cca5c67a-8c22-11ee-bfa4-704d7b67aaac', 'Nail Art'),
('cfb74822-8c22-11ee-bfa4-704d7b67aaac', 'Waxing'),
('fe9f0cb4-8c22-11ee-bfa4-704d7b67aaac', 'Menicure');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE `kontak` (
  `id_kontak` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `pesan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id_kontak`, `nama`, `no_hp`, `subject`, `pesan`) VALUES
('794a0ad3-9efd-11ee-a091-e8f40802874d', 'Test', '09870708709', 'Komplain', 'test'),
('7e8d5d3e-91ea-11ee-a7c1-704d7b67aaac', 'Amira', '085421654651', 'Nice', 'Terimakasih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(100) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jk` varchar(2) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk`, `tempat_lahir`, `tgl_lahir`, `alamat`, `no_telp`, `username`, `password`, `role`) VALUES
('0e166091-3767-11ef-a0df-5d9cf70327b9', 'mam', 'L', 'bekasi', '2024-07-01', 'Perumahan Taman Alamanda', '080984198411', 'mam', 'b735b0c78e12553e91397a3ff19f8fd1', 1),
('4fb17b35-386a-11ef-a166-04d4c4e1a4f9', 'adi', 'L', 'Jakarta', '2024-08-08', 'Turi Jaya', '09767544567', 'adi', 'c46335eb267e2e1cde5b017acb4cd799', 1),
('810ecc29-3868-11ef-a166-04d4c4e1a4f9', 'nael', 'L', 'Medan', '2024-08-02', 'Turi Jaya', '09767544567', 'nael', 'e5043893a42f9d2e8d29540792034ba6', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `role`) VALUES
('dioqoinda23w12e', 'admin', '21232f297a57a5a743894a0e4a801fc3', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `service`
--

CREATE TABLE `service` (
  `id_service` varchar(100) NOT NULL,
  `nama_service` varchar(100) NOT NULL,
  `id_kategori` varchar(100) NOT NULL,
  `biaya` int(11) NOT NULL,
  `durasi` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `service`
--

INSERT INTO `service` (`id_service`, `nama_service`, `id_kategori`, `biaya`, `durasi`, `file`) VALUES
('01e6459d-91eb-11ee-a7c1-704d7b67aaac', 'Waxing Brazillian', 'cfb74822-8c22-11ee-bfa4-704d7b67aaac', 250000, '30 Menit', 'bf9d9814734724e5e29755c83c32e3a1.jpg'),
('07a3c267-91ec-11ee-a7c1-704d7b67aaac', 'Ear Candle', 'c7eda182-6f55-11ee-8d63-93f0fa14750d', 50000, '30 Menit', '3efd607fb570f944311b7692a6c7e24c.jpg'),
('09d76ddf-91ee-11ee-a7c1-704d7b67aaac', 'Russian Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 255000, '1 Jam', 'ae381ab4bf6044cb617d5cb76d25d0d9.jpg'),
('14f2206b-91ed-11ee-a7c1-704d7b67aaac', 'Nails Extension', 'cca5c67a-8c22-11ee-bfa4-704d7b67aaac', 100000, '1 Jam', '760f84ff06b942d6b644c2824849f639.jpg'),
('152d96ab-91eb-11ee-a7c1-704d7b67aaac', 'Waxing Full Kaki', 'cfb74822-8c22-11ee-bfa4-704d7b67aaac', 270000, '30 Menit', '27dafb03fa695ba04bac0282f8b51ded.jpg'),
('17979044-91ee-11ee-a7c1-704d7b67aaac', 'Wispey Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 135000, '1 Jam', 'd6b90c2a88924d2bba51c67fb8f8e27a.jpg'),
('2015dedb-91ec-11ee-a7c1-704d7b67aaac', 'Hand Scrub', 'c7eda182-6f55-11ee-8d63-93f0fa14750d', 40000, '30 Menit', '547ab96344d6d85895e6b1bf23f061bd.jpg'),
('2497f041-91ed-11ee-a7c1-704d7b67aaac', 'Fake Nails', 'cca5c67a-8c22-11ee-bfa4-704d7b67aaac', 50000, '1 Jam', '22a172b783d31ee4b1bc79de77cad840.jpg'),
('2a7cd51f-8c25-11ee-bfa4-704d7b67aaac', 'Doll Eye Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 120000, '1 Jam', 'bac6dcbfe84d6ed43183234a21cbf955.jpg'),
('2c2bf835-91eb-11ee-a7c1-704d7b67aaac', 'Waxing Full Tangan', 'cfb74822-8c22-11ee-bfa4-704d7b67aaac', 150000, '30 Menit', '34289b0b70edbaf29098d93565f805ee.jpg'),
('3a65586e-91eb-11ee-a7c1-704d7b67aaac', 'Waxing Ketiak', 'cfb74822-8c22-11ee-bfa4-704d7b67aaac', 50000, '30 Menit', 'be8ecd0492e94dd2e1aad8390792b381.jpg'),
('4d682909-91eb-11ee-a7c1-704d7b67aaac', 'Waxing Perut', 'cfb74822-8c22-11ee-bfa4-704d7b67aaac', 80000, '30 Menit', 'af067bbc715269b96d787eead6a6cf63.jpg'),
('5776d4f2-91ed-11ee-a7c1-704d7b67aaac', 'Basic Lashlift', 'bbba07f5-6f55-11ee-8d63-93f0fa14750d', 60000, '30 Menit', '2c3855c376f7d38ca0c1c90d8f9423da.jpg'),
('5b5f7cc8-8c26-11ee-bfa4-704d7b67aaac', 'Catok', 'c16aaf50-6f55-11ee-8d63-93f0fa14750d', 50000, '1 jam', 'cf354d53f70e4cd182efd1b2242daffc.jpg'),
('610c7712-91ec-11ee-a7c1-704d7b67aaac', 'Hair Spa', 'c16aaf50-6f55-11ee-8d63-93f0fa14750d', 100000, '1.5 jam', '9bcd4fed1a1b3c33e22869b689aa6926.jpeg'),
('6aadf0f0-91ed-11ee-a7c1-704d7b67aaac', 'Lashlift Tint & Keratin', '--Pilih kategori--', 80000, '1 Jam', '7d00a80bfba6d0e9cee49bd13884ba84.jpg'),
('790e556d-8c26-11ee-bfa4-704d7b67aaac', 'Cuci & Catok', 'c16aaf50-6f55-11ee-8d63-93f0fa14750d', 55000, '1.5 jam', 'ef39d32d5463c2328611106d22f69a3d.jpg'),
('8d7bd209-8c26-11ee-bfa4-704d7b67aaac', 'Creambath', 'c16aaf50-6f55-11ee-8d63-93f0fa14750d', 70000, '1 jam', '01493d9627c17a9be31f4ba35d3c4a4e.jpg'),
('933c8ce4-8c24-11ee-bfa4-704d7b67aaac', 'Cat Eye Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 90000, '1.5 jam', 'e7cc46ac300916dc7a841060be39ee1c.jpg'),
('969a42b8-91ed-11ee-a7c1-704d7b67aaac', 'Natural Lashes', 'bbba07f5-6f55-11ee-8d63-93f0fa14750d', 120000, '1 Jam', 'fafba3da19b0b0c9a53df1d4b97f5b81.jpg'),
('9a5a57c4-8c25-11ee-bfa4-704d7b67aaac', 'Double Lashes', '--Pilih kategori--', 100000, '1 jam', '3323971eb98a14e9e3fb16376f4daf46.jpg'),
('a393caa9-91ed-11ee-a7c1-704d7b67aaac', 'Bloom Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 165000, '1 Jam', '01edef5928eaf91a8346ff7472bfc3a3.jpg'),
('a5a44ec0-91eb-11ee-a7c1-704d7b67aaac', 'Menicure', 'fe9f0cb4-8c22-11ee-bfa4-704d7b67aaac', 70000, '1 jam', '846b8d772fecc300d04029b4efc781c4.jpg'),
('ab3b69ae-8c25-11ee-bfa4-704d7b67aaac', 'Double Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 100000, '1 jam', '9e08d6f6cad60a3c4437f339f90e92db.jpg'),
('b1049891-91ed-11ee-a7c1-704d7b67aaac', 'Brown Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 125000, '1 Jam', '1a229b56a48215fb9183147d9e60ef15.jpg'),
('b514fb88-91eb-11ee-a7c1-704d7b67aaac', 'Pedicure', '00c82ed7-8c23-11ee-bfa4-704d7b67aaac', 80000, '1 jam', '6b28f2f84a0eafbf5c3ee41f0eaf6975.jpg'),
('c0fef3a6-91ed-11ee-a7c1-704d7b67aaac', 'Double Brown Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 165000, '1 Jam', '2c73670fb8fc96cec4d68f4ad82b1d77.jpg'),
('cb57cbe9-91ec-11ee-a7c1-704d7b67aaac', 'Nail Art Gel Polos', 'cca5c67a-8c22-11ee-bfa4-704d7b67aaac', 80000, '1 Jam', 'cb65adb487a586e0d53b5b726c844968.png'),
('d3ca24b4-91ed-11ee-a7c1-704d7b67aaac', 'Double WIspey Lashes', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 170000, '1 Jam', '27b0fda0f5183e01180b8e928a494b6f.jpg'),
('dd9286f8-91ec-11ee-a7c1-704d7b67aaac', 'Nailart Gel Halal', 'cca5c67a-8c22-11ee-bfa4-704d7b67aaac', 90000, '1 Jam', 'f2a9c2d5ec7480d6744e415c3286a42a.jpg'),
('eb727c66-91ed-11ee-a7c1-704d7b67aaac', 'Remover', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 50000, '30 Menit', 'f0ca4547ceb86bb52bfaf8cac62f9ccc.jpg'),
('f0fd1762-91ec-11ee-a7c1-704d7b67aaac', 'Nail art Gel Color & Art', 'cca5c67a-8c22-11ee-bfa4-704d7b67aaac', 90000, '1 Jam', '341653fbe1de9aa18bcd3371757f9fb6.jpg'),
('fc1804d0-91ed-11ee-a7c1-704d7b67aaac', 'Retouch', '51aea3ab-6f4c-11ee-8d63-93f0fa14750d', 50000, '30 Menit', '924ef16294b250d602aa8c0cbdcf1cba.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimoni`
--

CREATE TABLE `testimoni` (
  `id_testimoni` varchar(100) NOT NULL,
  `nama_testimoni` varchar(100) NOT NULL,
  `ket` varchar(255) NOT NULL,
  `tgl_testimoni` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `testimoni`
--

INSERT INTO `testimoni` (`id_testimoni`, `nama_testimoni`, `ket`, `tgl_testimoni`) VALUES
('b0c997a6-6f54-11ee-8d63-93f0fa14750d', 'mam', 'Wow! Saya benar-benar terkesan dengan pengalaman waxing di sini. Prosesnya cepat dan higienis.', '2024-07-02 01:46:27'),
('d1c3067e-6f54-11ee-8d63-93f0fa14750d', 'sirvhy', 'Saya sangat senang dengan hasil eyelash extension dari jasa ini! Para ahli di sini benar-benar profesional', '2024-07-02 01:55:36'),
('db3e13b1-6f54-11ee-8d63-93f0fa14750d', 'wolfff', 'Saya benar-benar terkesan dengan hasil dari jasa hair treatment ini. Rambut saya yang sebelumnya kering menjadi sangat sehat.', '2024-07-02 01:56:24'),
('deb7f46e-6f54-11ee-8d63-93f0fa14750d', 'cipung', 'Saya sangat senang dengan pelayanan dari jasa nail art ini!', '2024-07-02 01:55:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(100) NOT NULL,
  `id_pelanggan` varchar(100) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `id_service` varchar(100) NOT NULL,
  `bukti` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tgl_booking` date NOT NULL,
  `jam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indeks untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id_testimoni`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
