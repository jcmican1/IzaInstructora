-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-08-2023 a las 22:09:27
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutorial_canciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `medio` enum('DISCO','CASETE','CD') DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`id`, `titulo`, `anio`, `descripcion`, `medio`, `usuario`) VALUES
(1, 'Prueba', 1999, 'texto', 'CD', NULL),
(2, 'Prueba', 1999, 'texto', 'CD', NULL),
(3, 'Álbum 1', 2000, 'Descripción Álbum 1', 'CD', 1),
(5, 'Álbum 3', 2022, 'Descripción Álbum 3', 'CD', 3),
(6, 'Prueba', 1999, 'texto', 'CD', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album_cancion`
--

CREATE TABLE `album_cancion` (
  `album_id` int(11) DEFAULT NULL,
  `cancion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `album_cancion`
--

INSERT INTO `album_cancion` (`album_id`, `cancion_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion`
--

CREATE TABLE `cancion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `minutos` int(11) DEFAULT NULL,
  `segundos` int(11) DEFAULT NULL,
  `interprete` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cancion`
--

INSERT INTO `cancion` (`id`, `titulo`, `minutos`, `segundos`, `interprete`) VALUES
(1, 'Canción 1', 3, 30, 'Artista 1'),
(2, 'Canción 2', 4, 15, 'Artista 2'),
(3, 'Canción 3', 2, 50, 'Artista 3'),
(4, 'Canción de Prueba', 3, 30, 'Artista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `tablename` varchar(128) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `contrasena` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `tablename`, `nombre`, `contrasena`) VALUES
(1, 'user1', 'Usuario 1', 'contrasena1'),
(3, 'user3', 'Usuario 3', 'contrasena3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo_unico_album` (`usuario`,`titulo`);

--
-- Indices de la tabla `album_cancion`
--
ALTER TABLE `album_cancion`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `cancion_id` (`cancion_id`);

--
-- Indices de la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cancion`
--
ALTER TABLE `cancion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `album_cancion`
--
ALTER TABLE `album_cancion`
  ADD CONSTRAINT `album_cancion_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `album_cancion_ibfk_2` FOREIGN KEY (`cancion_id`) REFERENCES `cancion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
