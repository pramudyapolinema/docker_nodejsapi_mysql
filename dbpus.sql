-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Nov 2021 pada 07.19
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `nm_admin` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`idadmin`, `nm_admin`, `username`, `password`) VALUES
(1, 'Admin', 'jwd', '1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbanggota`
--

CREATE TABLE `tbanggota` (
  `idanggota` varchar(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jeniskelamin` varchar(10) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `status` varchar(20) NOT NULL,
  `foto` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbanggota`
--

INSERT INTO `tbanggota` (`idanggota`, `nama`, `jeniskelamin`, `alamat`, `status`, `foto`) VALUES
('AG001', 'Pramudya Wibowo', 'Pria', 'Jl. Merapi No. 26', 'Tidak Meminjam', 'AG001.jpg'),
('AG002', 'Francisco Rivera', 'Pria', 'Jl. Semeru No. 80', 'Tidak Meminjam', 'AG002.jpg'),
('AG003', 'Italo Melo', 'Pria', 'Jl. Penanggungan No. 43', 'Tidak Meminjam', 'AG003.jpg'),
('AG004', 'Stefan Fancik', 'Pria', 'Jl. Merbabu No. 30', 'Tidak Meminjam', 'AG004.jpg'),
('AG005', 'Judita', 'Wanita', 'Jl. Kopian No. 91', 'Tidak Meminjam', 'AG005.jpg'),
('AG006', 'Tania', 'Wanita', 'Jl. Raung No. 53', 'Tidak Meminjam', 'AG006.jpg'),
('AG007', 'Andrea', 'Wanita', 'Jl. Sunan Muria No. 83', 'Tidak Meminjam', 'AG007.jpg'),
('AG008', 'Olivet', 'Pria', 'Jl. Kembang Turi No. 87', 'Meminjam', 'AG008.jpg'),
('AG009', 'Bryna', 'Wanita', 'Jl. Ikan Kakap Atas No. 56', 'Tidak Meminjam', 'AG009.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbbuku`
--

CREATE TABLE `tbbuku` (
  `idbuku` varchar(5) NOT NULL,
  `kategori` enum('Novel','Komik','Ensiklopedi','Biografi','Majalah') NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `cover` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbbuku`
--

INSERT INTO `tbbuku` (`idbuku`, `kategori`, `penerbit`, `pengarang`, `judul`, `stok`, `cover`) VALUES
('BK001', 'Novel', 'mediakita', 'Fiersa Besari', 'Tapak Jejak', 5, 'BK001.jfif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbpeminjaman`
--

CREATE TABLE `tbpeminjaman` (
  `idpeminjaman` varchar(5) NOT NULL,
  `idanggota` varchar(5) NOT NULL,
  `idbuku` varchar(5) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tglpinjam` date NOT NULL,
  `tglkembali` date NOT NULL,
  `statuspeminjaman` enum('Dipinjam','Dikembalikan','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbpeminjaman`
--

INSERT INTO `tbpeminjaman` (`idpeminjaman`, `idanggota`, `idbuku`, `jumlah`, `tglpinjam`, `tglkembali`, `statuspeminjaman`) VALUES
('PJ001', 'AG001', 'BK001', 1, '2021-09-01', '2021-09-08', 'Dikembalikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbpengembalian`
--

CREATE TABLE `tbpengembalian` (
  `idpengembalian` varchar(5) NOT NULL,
  `idpeminjaman` varchar(5) NOT NULL,
  `tglkembali` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbpengembalian`
--

INSERT INTO `tbpengembalian` (`idpengembalian`, `idpeminjaman`, `tglkembali`, `denda`) VALUES
('PB001', 'PJ001', '2021-09-15', 32000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbanggota`
--
ALTER TABLE `tbanggota`
  ADD PRIMARY KEY (`idanggota`);

--
-- Indeks untuk tabel `tbbuku`
--
ALTER TABLE `tbbuku`
  ADD PRIMARY KEY (`idbuku`);

--
-- Indeks untuk tabel `tbpeminjaman`
--
ALTER TABLE `tbpeminjaman`
  ADD PRIMARY KEY (`idpeminjaman`),
  ADD KEY `idanggota` (`idanggota`),
  ADD KEY `tbpinjam_ibfk_2` (`idbuku`);

--
-- Indeks untuk tabel `tbpengembalian`
--
ALTER TABLE `tbpengembalian`
  ADD PRIMARY KEY (`idpengembalian`),
  ADD KEY `idpeminjaman` (`idpeminjaman`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbpeminjaman`
--
ALTER TABLE `tbpeminjaman`
  ADD CONSTRAINT `tbpeminjaman_ibfk_1` FOREIGN KEY (`idanggota`) REFERENCES `tbanggota` (`idanggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbpeminjaman_ibfk_2` FOREIGN KEY (`idbuku`) REFERENCES `tbbuku` (`idbuku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbpengembalian`
--
ALTER TABLE `tbpengembalian`
  ADD CONSTRAINT `tbpengembalian_ibfk_1` FOREIGN KEY (`idpeminjaman`) REFERENCES `tbpeminjaman` (`idpeminjaman`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
