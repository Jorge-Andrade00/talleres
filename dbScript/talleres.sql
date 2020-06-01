-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2020 a las 16:39:38
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `talleres`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_inscripcion` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `fk_id_taller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_inscripcion`, `fk_id_usuario`, `fk_id_taller`) VALUES
(19, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('4PsGEZBj8ju0QErmfb4ccF-KiqBPdUa5', 1590967191, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('97SvKknoT6R5vxygWKaDSWG_BMLCq-CZ', 1591022173, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('aaAGZSFQ8TkpucFqOqw0GSf-ysCZ7_b2', 1590958673, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller`
--

CREATE TABLE `taller` (
  `id_taller` int(11) NOT NULL,
  `img` varchar(155) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `publicacion` date NOT NULL,
  `inicio` date NOT NULL,
  `organizador` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `descrpcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `taller`
--

INSERT INTO `taller` (`id_taller`, `img`, `nombre`, `publicacion`, `inicio`, `organizador`, `direccion`, `descrpcion`) VALUES
(1, 'nn', 'Taller de Java Script', '2020-05-30', '2020-06-08', 'Empresa de mentira 123', 'no ruta 45', 'El mejor taller de Js moderno del mundo. No te lo podes perder'),
(2, 'nn', 'Taller de Liderazgo ', '2020-05-30', '2020-06-15', 'Nadie xd', 'tic tac toe 56', 'Este taller no existe jaja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `fullname`, `pass`) VALUES
(1, 'newdb@mail.com', 'nueva bd', '$2a$10$eOr/u3zF1SZLIUcwzphHmOdz6rcdNftkN5sTWnhsWZGwB41.Cf8iC'),
(2, 'dragon@mail.com', 'new test 2', '$2a$10$ODYcixysdnihIomb8DeQHO3paF2xQfgYNIt/jm.5mrnzJjgpEpjQ2'),
(3, 'dragon2@gmail.com', 'new test 3', '$2a$10$qpMXtlRXAku7bLTQpoSwMOEPHuibCDgLsM7gynhxRoh/4Kro.94cu'),
(4, 'xiki@mail.com', 'xiki', '$2a$10$h/78faPcnB6tq8LijI5oN.MsN0BS0i4k3u9JouG272fcXyZBjJCTG'),
(5, 'jofasandrade@gmail.com', 'jofas', '$2a$10$Tem/g4bAp5Ze/rJslPwDUuIddzlFP.m9Y0.mZxWcMghNk5hjVZEBi'),
(6, 'pancho@mail.com', 'pancho', '$2a$10$4VqHolDHjAxyrFvHUtEN5eWVbLVrvIQ8pqG7PbBsNMSegOy0IWTOe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `inscripcion_fk_1` (`fk_id_usuario`),
  ADD KEY `inscripcion_fk_2` (`fk_id_taller`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `taller`
--
ALTER TABLE `taller`
  ADD PRIMARY KEY (`id_taller`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `taller`
--
ALTER TABLE `taller`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_fk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inscripcion_fk_2` FOREIGN KEY (`fk_id_taller`) REFERENCES `taller` (`id_taller`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
