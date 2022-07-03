-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jul 2022 pada 18.17
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petsqu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(2) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'anril', 'anril123', 'Anril Pratama');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(2) NOT NULL,
  `nama_kategori` varchar(15) NOT NULL,
  `foto_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `foto_kategori`) VALUES
(1, 'Anak Kucing', 'kittens.png'),
(2, 'Lebih dari 1', '1-years.png'),
(5, 'Diatas 7 Tahun', '7-years.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mode_bayar`
--

CREATE TABLE `mode_bayar` (
  `id_mode` int(2) NOT NULL,
  `mode_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mode_bayar`
--

INSERT INTO `mode_bayar` (`id_mode`, `mode_bayar`) VALUES
(1, 'Transfer Bank'),
(2, 'OVO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(4) NOT NULL,
  `email_pelanggan` varchar(25) NOT NULL,
  `password_pelanggan` varchar(15) NOT NULL,
  `nama_pelanggan` varchar(25) NOT NULL,
  `telepon_pelanggan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`) VALUES
(2, 'kiky@gmail.com', 'kiky123', 'muhammad Rizki', '08193322333'),
(3, 'anrilpratama@gmail.com', 'anril123', 'anrik', '08193388110'),
(4, 'afriza@gmail.com', 'afriza123', 'afriza', '08193388111');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(4) NOT NULL,
  `id_pembelian` int(4) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(7, 37, 'anril', 'mandiri', 81400, '2022-07-03', '20220703155516makanan-untuk-anak-kucing.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(4) NOT NULL,
  `id_pelanggan` int(4) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(6) NOT NULL,
  `mode_bayar` varchar(15) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(30) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `mode_bayar`, `alamat_pengiriman`, `status_pembelian`) VALUES
(37, 3, '2022-07-03', 81400, 'Transfer Bank', 'citayem', 'Makanan Diterima'),
(38, 3, '2022-07-03', 172800, 'Transfer Bank', 'Citayem 2', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(4) NOT NULL,
  `id_pembelian` int(4) NOT NULL,
  `id_produk` int(3) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subharga` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `subharga`) VALUES
(45, 37, 17, 1, 81400),
(46, 38, 17, 2, 162800),
(47, 38, 18, 1, 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(3) NOT NULL,
  `id_kategori` int(2) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `harga_produk` int(5) NOT NULL,
  `foto_produk` varchar(50) NOT NULL,
  `des_produk` text NOT NULL,
  `stok_produk` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `foto_produk`, `des_produk`, `stok_produk`) VALUES
(17, 1, 'Whiskas® Dry Junior Mackerel F', 81400, 'anakkucing.jpg', 'WHISKAS® Junior menyediakan kibble susu berkualitas yang diperkaya dengan 41 nutrien esensial. Formulasi kami sekarang diperbarui dengan DHA dan kolostrum untuk memberikan nutrisi terbaik yang dibutuhkan anak kucing bagi  kehidupan yang sehat mereka dewasa nanti.', 7),
(18, 1, 'ORI CAT KITTEN 500GR - MAKANAN', 10000, 'anakkucing2.jpg', 'Makanan kucing kering\r\n-untuk kitten (anak kucing)\r\n-terbuat dari ikan laut,daging sapi,daging kambing,kuning telur\r\n-baik untuk kesehatan kulit dan bulu\r\n-melindungi pencernaan dari bakteri', 10),
(19, 2, 'Whiskas® Dry Adult 1+ Indoor', 81000, '1-years1.png', 'Sebagai pencipta makanan kucing WHISKAS®, kami tahu bahwa kucing rumahan memiliki kebutuhan diet khusus yang perlu disesuaikan dengan gaya hidup mereka yang santai. Kucing rumahan cenderung menghabiskan waktu mereka dengan tidur dan bersantai di tempat favorit mereka seharian, mereka tidak terlalu aktif dan membutuhkan hanya sedikit energi. Karena itu, kucing rumahan lebih rentan terhadap kenaikan berat badan. Juga, dengan kurangnya bergerak, pergerakan usus merekapun menjadi lamban, ini menyebabkan feses mereka menjadi sangat bau dan mengganggu kenyamanan pemilik kucing.', 11),
(20, 5, 'Whiskas Senior Mackerel 1.1 kg', 71000, 'kucing.jpg', 'Pada usia 7 tahun, kucing Anda mungkin tidak terlihat atau bertindak jauh berbeda, tetapi kebutuhan nutrisi mereka telah berubah. Misalnya, sistem pencernaan mereka tidak sekuat dulu, sehingga kemampuan mereka untuk menyerap nutrisi melemah. Bantu mereka beralih ke WHISKAS Dewasa 7+, khusus diformulasikan untuk menunda efek usia tua.', 20);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `mode_bayar`
--
ALTER TABLE `mode_bayar`
  ADD PRIMARY KEY (`id_mode`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `mode_bayar`
--
ALTER TABLE `mode_bayar`
  MODIFY `id_mode` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `id_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD CONSTRAINT `pembelian_produk_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
