-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2022 a las 01:57:44
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbo_paloaguao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_adi_pers`
--

CREATE TABLE `tbl_adi_pers` (
  `Id_adi_pers` varchar(13) NOT NULL,
  `Edad` tinyint(4) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Tipo_via` varchar(10) NOT NULL,
  `Num_via` tinyint(4) NOT NULL,
  `Placa` varchar(10) NOT NULL,
  `Tipo_via_gen` varchar(10) NOT NULL,
  `Num_via_gen` tinyint(4) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_barr`
--

CREATE TABLE `tbl_barr` (
  `Id_barr` varchar(15) NOT NULL,
  `Nom_barr` varchar(15) NOT NULL,
  `Fk_Id_locc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cate`
--

CREATE TABLE `tbl_cate` (
  `Id_cate` varchar(15) NOT NULL,
  `Nom_cate` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ciud`
--

CREATE TABLE `tbl_ciud` (
  `Id_ciud` varchar(15) NOT NULL,
  `Nom_ciud` varchar(15) NOT NULL,
  `Fk_Id_pais` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comp`
--

CREATE TABLE `tbl_comp` (
  `Id_comp` varchar(255) NOT NULL,
  `Det_comp` varchar(255) DEFAULT NULL,
  `Cant_comp` int(11) NOT NULL,
  `Total_comp` bigint(20) NOT NULL,
  `Fk_Id_inve` varchar(255) NOT NULL,
  `Fk_Id_prod` varchar(20) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comprob_pag`
--

CREATE TABLE `tbl_comprob_pag` (
  `Id_comprob_pag` varchar(255) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `Fech_pag` datetime NOT NULL,
  `Total_pago` bigint(20) NOT NULL,
  `Fk_Id_met_pag` varchar(255) NOT NULL,
  `Fk_Id_comp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_envi`
--

CREATE TABLE `tbl_envi` (
  `Id_envi` varchar(255) NOT NULL,
  `Peso` varchar(10) NOT NULL,
  `Nom_transportadora` varchar(255) NOT NULL,
  `Fech_envio` datetime NOT NULL,
  `Fech_recibido` datetime NOT NULL,
  `Tarifa_envio` varchar(15) NOT NULL,
  `Fk_Id_adic_pers` varchar(13) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL,
  `Fk_Id_sali_inve` varchar(255) NOT NULL,
  `Fk_Id_inve` varchar(255) NOT NULL,
  `Fk_Id_comp` varchar(255) NOT NULL,
  `Fk_Id_met_pag` varchar(255) NOT NULL,
  `Fk_Id_comprob_pag` varchar(255) NOT NULL,
  `Fk_Id_producto` varchar(20) NOT NULL,
  `Fk_Id_barrio` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_fact`
--

CREATE TABLE `tbl_fact` (
  `Id_fact` varchar(255) NOT NULL,
  `Cant_prod_total` varchar(255) NOT NULL,
  `Total_pago` bigint(20) NOT NULL,
  `Fech_comp` datetime NOT NULL,
  `Fk_Id_comp` varchar(255) NOT NULL,
  `Fk_Id_met_pag` varchar(255) NOT NULL,
  `Fk_Id_comprob_pag` varchar(255) NOT NULL,
  `Fk_Id_inve` varchar(255) NOT NULL,
  `Fk_Id_prod` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inve`
--

CREATE TABLE `tbl_inve` (
  `Id_inve` varchar(255) NOT NULL,
  `Fech_ingreso` datetime NOT NULL,
  `Unid_disp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_locc`
--

CREATE TABLE `tbl_locc` (
  `Id_locc` varchar(15) NOT NULL,
  `Nom_locc` varchar(15) NOT NULL,
  `Fk_Id_ciud` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_met_pag`
--

CREATE TABLE `tbl_met_pag` (
  `Id_met_pag` varchar(255) NOT NULL,
  `Met_pag` varchar(20) NOT NULL,
  `Cuotas` int(11) NOT NULL,
  `Total_pago` bigint(20) DEFAULT NULL,
  `Fk_Id_prod` varchar(20) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL,
  `Fk_Id_comp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pais`
--

CREATE TABLE `tbl_pais` (
  `Id_pais` varchar(15) NOT NULL,
  `Nom_pais` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perf`
--

CREATE TABLE `tbl_perf` (
  `Id_perf` varchar(3) NOT NULL,
  `Nom_perf` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pers`
--

CREATE TABLE `tbl_pers` (
  `Id_pers` varchar(13) NOT NULL,
  `Pri_nom` varchar(15) NOT NULL,
  `Seg_nom` varchar(15) DEFAULT NULL,
  `Pri_ape` varchar(15) NOT NULL,
  `Seg_ape` varchar(15) DEFAULT NULL,
  `Fech_nac` date NOT NULL,
  `Fk_Id_perf` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prod`
--

CREATE TABLE `tbl_prod` (
  `Id_prod` varchar(20) NOT NULL,
  `Nom_producto` varchar(20) NOT NULL,
  `Precio_Venta` int(11) NOT NULL,
  `Precio_compra` int(11) NOT NULL,
  `Fk_Id_sub_cate` varchar(15) NOT NULL,
  `Fk_Id_inve` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sali_inve`
--

CREATE TABLE `tbl_sali_inve` (
  `Id_sali` varchar(255) NOT NULL,
  `Fech_salida` datetime NOT NULL,
  `Fk_Id_inve` varchar(255) NOT NULL,
  `Fk_Id_pers` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sub_cate`
--

CREATE TABLE `tbl_sub_cate` (
  `Id_sub_cate` varchar(15) NOT NULL,
  `Nom_sub_cate` varchar(15) NOT NULL,
  `Fk_Id_cate` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_adi_pers`
--
ALTER TABLE `tbl_adi_pers`
  ADD PRIMARY KEY (`Id_adi_pers`),
  ADD KEY `Fk_adidata_pers` (`Fk_Id_pers`);

--
-- Indices de la tabla `tbl_barr`
--
ALTER TABLE `tbl_barr`
  ADD PRIMARY KEY (`Id_barr`),
  ADD KEY `Fk_locc_barr` (`Fk_Id_locc`);

--
-- Indices de la tabla `tbl_cate`
--
ALTER TABLE `tbl_cate`
  ADD PRIMARY KEY (`Id_cate`);

--
-- Indices de la tabla `tbl_ciud`
--
ALTER TABLE `tbl_ciud`
  ADD PRIMARY KEY (`Id_ciud`),
  ADD KEY `Fk_pais_ciud` (`Fk_Id_pais`);

--
-- Indices de la tabla `tbl_comp`
--
ALTER TABLE `tbl_comp`
  ADD PRIMARY KEY (`Id_comp`),
  ADD KEY `Fk_comp_inve` (`Fk_Id_inve`),
  ADD KEY `Fk_comp_prod` (`Fk_Id_prod`),
  ADD KEY `Fk_pers_comp` (`Fk_Id_pers`);

--
-- Indices de la tabla `tbl_comprob_pag`
--
ALTER TABLE `tbl_comprob_pag`
  ADD PRIMARY KEY (`Id_comprob_pag`),
  ADD KEY `Fk_Comprob_met_pag` (`Fk_Id_met_pag`),
  ADD KEY `Fk_comprob_comp_pag` (`Fk_Id_comp`);

--
-- Indices de la tabla `tbl_envi`
--
ALTER TABLE `tbl_envi`
  ADD PRIMARY KEY (`Id_envi`),
  ADD KEY `Fk_envi_adi_pers` (`Fk_Id_adic_pers`),
  ADD KEY `Fk_envi_barr` (`Fk_Id_barrio`),
  ADD KEY `Fk_envi_comp` (`Fk_Id_comp`),
  ADD KEY `Fk_envi_comprob_pag` (`Fk_Id_comprob_pag`),
  ADD KEY `Fk_envi_inve` (`Fk_Id_inve`),
  ADD KEY `Fk_envi_met_pag` (`Fk_Id_met_pag`),
  ADD KEY `Fk_envi_pers` (`Fk_Id_pers`),
  ADD KEY `Fk_envi_prod` (`Fk_Id_producto`),
  ADD KEY `Fk_envi_sali_inve` (`Fk_Id_sali_inve`);

--
-- Indices de la tabla `tbl_fact`
--
ALTER TABLE `tbl_fact`
  ADD PRIMARY KEY (`Id_fact`),
  ADD KEY `Fk_fact_comp` (`Fk_Id_comp`),
  ADD KEY `Fk_fact_comprob_pag` (`Fk_Id_comprob_pag`),
  ADD KEY `Fk_fact_inve` (`Fk_Id_inve`),
  ADD KEY `Fk_fact_met_pag` (`Fk_Id_met_pag`),
  ADD KEY `Fk_fact_prod` (`Fk_Id_prod`);

--
-- Indices de la tabla `tbl_inve`
--
ALTER TABLE `tbl_inve`
  ADD PRIMARY KEY (`Id_inve`);

--
-- Indices de la tabla `tbl_locc`
--
ALTER TABLE `tbl_locc`
  ADD PRIMARY KEY (`Id_locc`),
  ADD KEY `Fk_locc_ciud` (`Fk_Id_ciud`);

--
-- Indices de la tabla `tbl_met_pag`
--
ALTER TABLE `tbl_met_pag`
  ADD PRIMARY KEY (`Id_met_pag`),
  ADD KEY `Fk_met_pag_prod` (`Fk_Id_prod`),
  ADD KEY `Fk_met_pag_pers` (`Fk_Id_pers`),
  ADD KEY `Fk_met_pag_comp` (`Fk_Id_comp`);

--
-- Indices de la tabla `tbl_pais`
--
ALTER TABLE `tbl_pais`
  ADD PRIMARY KEY (`Id_pais`);

--
-- Indices de la tabla `tbl_perf`
--
ALTER TABLE `tbl_perf`
  ADD PRIMARY KEY (`Id_perf`);

--
-- Indices de la tabla `tbl_pers`
--
ALTER TABLE `tbl_pers`
  ADD PRIMARY KEY (`Id_pers`),
  ADD KEY `Fk_perf_pers` (`Fk_Id_perf`);

--
-- Indices de la tabla `tbl_prod`
--
ALTER TABLE `tbl_prod`
  ADD PRIMARY KEY (`Id_prod`),
  ADD KEY `Fk_prod_sub_cate` (`Fk_Id_sub_cate`),
  ADD KEY `Fk_prod_inve` (`Fk_Id_inve`);

--
-- Indices de la tabla `tbl_sali_inve`
--
ALTER TABLE `tbl_sali_inve`
  ADD PRIMARY KEY (`Id_sali`),
  ADD KEY `Fk_Ingr_sali_inve` (`Fk_Id_inve`),
  ADD KEY `Fk_pers_sali_inve` (`Fk_Id_pers`);

--
-- Indices de la tabla `tbl_sub_cate`
--
ALTER TABLE `tbl_sub_cate`
  ADD PRIMARY KEY (`Id_sub_cate`),
  ADD KEY `Fk_Categoria` (`Fk_Id_cate`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_adi_pers`
--
ALTER TABLE `tbl_adi_pers`
  ADD CONSTRAINT `Fk_adidata_pers` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_pers` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_barr`
--
ALTER TABLE `tbl_barr`
  ADD CONSTRAINT `Fk_locc_barr` FOREIGN KEY (`Fk_Id_locc`) REFERENCES `tbl_locc` (`Id_locc`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_ciud`
--
ALTER TABLE `tbl_ciud`
  ADD CONSTRAINT `Fk_pais_ciud` FOREIGN KEY (`Fk_Id_pais`) REFERENCES `tbl_pais` (`Id_pais`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_comp`
--
ALTER TABLE `tbl_comp`
  ADD CONSTRAINT `Fk_comp_inve` FOREIGN KEY (`Fk_Id_inve`) REFERENCES `tbl_inve` (`Id_inve`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_comp_prod` FOREIGN KEY (`Fk_Id_prod`) REFERENCES `tbl_prod` (`Id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_pers_comp` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_pers` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_comprob_pag`
--
ALTER TABLE `tbl_comprob_pag`
  ADD CONSTRAINT `Fk_Comprob_met_pag` FOREIGN KEY (`Fk_Id_met_pag`) REFERENCES `tbl_met_pag` (`Id_met_pag`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_comprob_comp_pag` FOREIGN KEY (`Fk_Id_comp`) REFERENCES `tbl_comp` (`Id_comp`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_envi`
--
ALTER TABLE `tbl_envi`
  ADD CONSTRAINT `Fk_envi_adi_pers` FOREIGN KEY (`Fk_Id_adic_pers`) REFERENCES `tbl_adi_pers` (`Id_adi_pers`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_barr` FOREIGN KEY (`Fk_Id_barrio`) REFERENCES `tbl_barr` (`Id_barr`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_comp` FOREIGN KEY (`Fk_Id_comp`) REFERENCES `tbl_comp` (`Id_comp`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_comprob_pag` FOREIGN KEY (`Fk_Id_comprob_pag`) REFERENCES `tbl_comprob_pag` (`Id_comprob_pag`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_inve` FOREIGN KEY (`Fk_Id_inve`) REFERENCES `tbl_inve` (`Id_inve`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_met_pag` FOREIGN KEY (`Fk_Id_met_pag`) REFERENCES `tbl_met_pag` (`Id_met_pag`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_pers` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_pers` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_prod` FOREIGN KEY (`Fk_Id_producto`) REFERENCES `tbl_prod` (`Id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_envi_sali_inve` FOREIGN KEY (`Fk_Id_sali_inve`) REFERENCES `tbl_sali_inve` (`Id_sali`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_fact`
--
ALTER TABLE `tbl_fact`
  ADD CONSTRAINT `Fk_fact_comp` FOREIGN KEY (`Fk_Id_comp`) REFERENCES `tbl_comp` (`Id_comp`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_fact_comprob_pag` FOREIGN KEY (`Fk_Id_comprob_pag`) REFERENCES `tbl_comprob_pag` (`Id_comprob_pag`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_fact_inve` FOREIGN KEY (`Fk_Id_inve`) REFERENCES `tbl_inve` (`Id_inve`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_fact_met_pag` FOREIGN KEY (`Fk_Id_met_pag`) REFERENCES `tbl_met_pag` (`Id_met_pag`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_fact_prod` FOREIGN KEY (`Fk_Id_prod`) REFERENCES `tbl_prod` (`Id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_locc`
--
ALTER TABLE `tbl_locc`
  ADD CONSTRAINT `Fk_locc_ciud` FOREIGN KEY (`Fk_Id_ciud`) REFERENCES `tbl_ciud` (`Id_ciud`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_met_pag`
--
ALTER TABLE `tbl_met_pag`
  ADD CONSTRAINT `Fk_met_pag_comp` FOREIGN KEY (`Fk_Id_comp`) REFERENCES `tbl_comp` (`Id_comp`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_met_pag_pers` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_pers` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_met_pag_prod` FOREIGN KEY (`Fk_Id_prod`) REFERENCES `tbl_prod` (`Id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_pers`
--
ALTER TABLE `tbl_pers`
  ADD CONSTRAINT `Fk_perf_pers` FOREIGN KEY (`Fk_Id_perf`) REFERENCES `tbl_perf` (`Id_perf`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_prod`
--
ALTER TABLE `tbl_prod`
  ADD CONSTRAINT `Fk_prod_inve` FOREIGN KEY (`Fk_Id_inve`) REFERENCES `tbl_inve` (`Id_inve`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_prod_sub_cate` FOREIGN KEY (`Fk_Id_sub_cate`) REFERENCES `tbl_sub_cate` (`Id_sub_cate`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_sali_inve`
--
ALTER TABLE `tbl_sali_inve`
  ADD CONSTRAINT `Fk_Ingr_sali_inve` FOREIGN KEY (`Fk_Id_inve`) REFERENCES `tbl_inve` (`Id_inve`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_pers_sali_inve` FOREIGN KEY (`Fk_Id_pers`) REFERENCES `tbl_pers` (`Id_pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_sub_cate`
--
ALTER TABLE `tbl_sub_cate`
  ADD CONSTRAINT `Fk_Categoria` FOREIGN KEY (`Fk_Id_cate`) REFERENCES `tbl_cate` (`Id_cate`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
