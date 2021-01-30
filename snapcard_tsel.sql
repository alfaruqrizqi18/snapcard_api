-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jan 2021 pada 14.16
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snapcard_tsel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(10) NOT NULL,
  `phone_number` text NOT NULL,
  `imei` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `blacklist`
--

INSERT INTO `blacklist` (`id`, `phone_number`, `imei`, `created_at`) VALUES
(1, '081123123123', '1010101010', '2020-08-05 12:56:41'),
(2, '081081081081', '098098098098', '2020-08-05 12:56:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bundling`
--

CREATE TABLE `bundling` (
  `id` int(10) NOT NULL,
  `sim_card_1` text NOT NULL,
  `sim_card_2` text NOT NULL,
  `imei_1` text NOT NULL,
  `imei_2` text NOT NULL,
  `brand` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bundling`
--

INSERT INTO `bundling` (`id`, `sim_card_1`, `sim_card_2`, `imei_1`, `imei_2`, `brand`, `created_at`) VALUES
(1, '9789787588678', '9789787588678', '9789787588678', '9789787588678', 'Nokia', '2020-08-05 09:51:09'),
(2, '9789787', '9789787588', '97897875886', '97875886', 'Nokia', '2020-08-05 09:52:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sim_card`
--

CREATE TABLE `sim_card` (
  `id` int(10) NOT NULL,
  `sim_card_barcode` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sim_card`
--

INSERT INTO `sim_card` (`id`, `sim_card_barcode`, `created_at`) VALUES
(1, '238787238878782387', '2020-08-03 13:54:27'),
(2, '38787238878782387', '2020-08-03 14:58:20'),
(3, '213234', '2020-08-03 14:58:42'),
(4, '21323413213', '2020-08-03 14:58:44'),
(5, '21323413213123', '2020-08-03 14:58:48'),
(6, '12312324', '2020-08-03 14:58:51'),
(7, '345345345', '2020-08-03 14:58:53'),
(8, '234234132', '2020-08-03 14:58:56'),
(9, '31453146136', '2020-08-03 14:58:58'),
(10, '24565578958', '2020-08-03 14:59:02'),
(11, '12342341235', '2020-08-03 14:59:05'),
(12, '989898123', '2020-08-04 08:12:13'),
(13, '123123', '2020-08-04 08:13:15'),
(14, '123123234324', '2020-08-04 08:15:20'),
(15, '12312323324324', '2020-08-04 08:15:21'),
(16, '323123', '2020-08-04 08:18:39'),
(17, '323123213', '2020-08-04 08:18:39'),
(18, '32312312213', '2020-08-04 08:18:39'),
(19, '11222334', '2020-08-04 08:18:39'),
(20, '9809890890', '2020-08-04 08:28:11'),
(21, '232323', '2020-08-04 08:28:11'),
(22, '23232366', '2020-08-04 08:30:45'),
(23, '01782158', '2020-08-04 08:30:46'),
(24, '2323236688', '2020-08-04 08:30:46'),
(25, '23232366881111', '2020-08-04 08:33:51'),
(26, '123213', '2020-08-04 08:34:46'),
(27, '1232132323', '2020-08-04 08:34:47'),
(28, '123213232311', '2020-08-04 08:34:47'),
(29, '87866', '2020-08-04 09:09:52'),
(30, '12837782378238', '2020-08-04 09:11:06'),
(31, '232132323', '2020-08-04 09:13:26'),
(32, '45456456', '2020-08-04 09:13:26'),
(33, '7867767', '2020-08-04 09:13:26'),
(34, '987898789', '2020-08-04 09:13:52'),
(35, '98778878', '2020-08-04 10:13:16'),
(36, '987897', '2020-08-04 10:26:44'),
(37, '098908898', '2020-08-04 10:26:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sim_card_plus`
--

CREATE TABLE `sim_card_plus` (
  `id` int(11) NOT NULL,
  `sim_card_plus_barcode` text NOT NULL,
  `physical_voucher` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sim_card_plus`
--

INSERT INTO `sim_card_plus` (`id`, `sim_card_plus_barcode`, `physical_voucher`, `created_at`) VALUES
(1, '772388237', '123123123', '2020-08-03 15:06:22'),
(2, '13213123324', '123122342343123', '2020-08-03 15:06:51'),
(3, '234234', '123131', '2020-08-03 15:06:57'),
(4, '233242345', '123123141', '2020-08-03 15:07:03'),
(5, '32434123', '123323', '2020-08-03 15:07:48'),
(6, '23422342343', '123323423', '2020-08-03 15:07:53'),
(7, '3434234', '3434234', '2020-08-05 08:47:16'),
(8, '273617276', '27273727', '2020-08-05 08:48:46'),
(9, 'qsd86123871hw7e8123t7g81231wd12312d12', 'ijbihb786gu', '2020-08-05 08:50:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `full_name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Superadmin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `whitelist`
--

CREATE TABLE `whitelist` (
  `id` int(10) NOT NULL,
  `phone_number` text NOT NULL,
  `imei` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `whitelist`
--

INSERT INTO `whitelist` (`id`, `phone_number`, `imei`, `created_at`) VALUES
(1, '1234567890', '0000000000', '2020-08-05 12:55:41'),
(2, '081234234234', '1111111111', '2020-08-05 12:56:17');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bundling`
--
ALTER TABLE `bundling`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sim_card`
--
ALTER TABLE `sim_card`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sim_card_plus`
--
ALTER TABLE `sim_card_plus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bundling`
--
ALTER TABLE `bundling`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sim_card`
--
ALTER TABLE `sim_card`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `sim_card_plus`
--
ALTER TABLE `sim_card_plus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `whitelist`
--
ALTER TABLE `whitelist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
