-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2021 a las 03:02:11
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tis2_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `busca`
--

CREATE TABLE `busca` (
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_publicacion` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `chat`
--

INSERT INTO `chat` (`id_chat`, `id_publicacion`, `fecha`) VALUES
(16, 16, '2021-07-07 14:48:15'),
(17, 15, '2021-07-07 19:59:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chatea`
--

CREATE TABLE `chatea` (
  `id` int(11) NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_chat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `chatea`
--

INSERT INTO `chatea` (`id`, `correo`, `id_chat`) VALUES
(7, 'av@gmail.com', 16),
(8, 'ara@gmail.com', 16),
(9, 'av@gmail.com', 17),
(10, 'kcarrasco@gmail.com', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `comentario` varchar(500) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_comentario` datetime NOT NULL DEFAULT current_timestamp(),
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `comentario`, `fecha_comentario`, `correo`, `id_publicacion`) VALUES
(2, 'trabaja 10/10', '2021-07-08 01:51:02', 'av@gmail.com', 16),
(3, 'muy buen trabajo', '2021-07-08 01:53:11', 'av@gmail.com', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `codigo_comuna` int(11) NOT NULL,
  `nombre_comuna` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `latitud` int(10) NOT NULL,
  `longitud` int(10) NOT NULL,
  `codigo_provincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`codigo_comuna`, `nombre_comuna`, `latitud`, `longitud`, `codigo_provincia`) VALUES
(1, 'Hualpen', 1, 1, 1),
(2, 'Concepcion', 2, 2, 1),
(3, 'Talcahuano', 3, 3, 1),
(4, 'San Pedro de la Paz', 4, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `correo`, `id_publicacion`) VALUES
(23, 'av@gmail.com', 16),
(24, 'av@gmail.com', 18),
(25, 'av@gmail.com', 17),
(26, 'dlipa@gmail.com', 18),
(27, 'ara@gmail.com', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id_mensaje` int(11) NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `id_chat` int(11) NOT NULL,
  `mensaje` varchar(500) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_mensaje` datetime NOT NULL DEFAULT current_timestamp(),
  `visualizacion` varchar(8) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id_mensaje`, `correo`, `id_chat`, `mensaje`, `fecha_mensaje`, `visualizacion`) VALUES
(3, 'av@gmail.com', 16, 'hola', '2021-07-07 14:48:15', 'No vista'),
(4, 'av@gmail.com', 17, 'hola', '2021-07-07 19:59:20', 'No vista'),
(5, 'kcarrasco@gmail.com', 17, 'hola', '2021-07-25 17:23:18', 'No vista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficio`
--

CREATE TABLE `oficio` (
  `id_oficio` int(11) NOT NULL,
  `nombre_oficio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion_oficio` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `oficio`
--

INSERT INTO `oficio` (`id_oficio`, `nombre_oficio`, `descripcion_oficio`) VALUES
(1, 'Carpintero', 'Oficio de trabajar, cortar y labrar la madera y sus derivados.'),
(2, 'Conserje', 'Es un oficio que consiste principalmente en controlar el acceso a un determinado sitio, atendiendo a las personas que acceden, y velar por un correcto funcionamiento del mismo'),
(3, 'Albañil', 'persona con conocimientos profesionales y experiencia que se dedica como oficio a la construcción, reforma, renovación y reparación de edificaciones en general.'),
(4, 'Conductor', 'La persona encargada de conducir un vehículo de motor para transportar a otras personas'),
(5, 'Empleado domestico', 'Persona que trabaja en el ámbito de una residencia. '),
(6, 'Estilista', 'Profesionales encargados de crear una armonía estética alrededor de un sujeto o escenario.'),
(7, 'Gasfiter', 'Actividad relacionada con la instalación y mantenimiento de redes de tuberías para el abastecimiento de agua potable y evacuación de aguas residuales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(200) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `respuesta` varchar(500) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `respuesta`) VALUES
(1, '¿Cómo elegir a un experto?', 'Para elegir a un experto puedes explorar las publicaciones de la página Catalogo, también puedes utilizar el buscador para encontrar lo que necesites!'),
(2, '¿Cómo publicar un servicio?', 'Para publicar tus servicios, despliega el menú lateral en la esquina superior izquierda de tu dispositivo y selecciona la opción \"Publicar\", luego rellena todos los campos necesarios y podrás realizar tu publicación. Ahora solo debes esperar a que se contacten contigo!'),
(3, '¿Cómo registrarme?', 'Para registrarte y poder utilizar todas las utilidades de la aplicación, despliega el menú lateral en la esquina superior izquierda de tu dispositivo, luego selecciona la opción \"Iniciar Sesión\", se mostrará una ventana donde podrás ingresar o crear una nueva cuenta.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `codigo_provincia` int(11) NOT NULL,
  `nombre_provincia` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `codigo_region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`codigo_provincia`, `nombre_provincia`, `codigo_region`) VALUES
(1, 'Concepcion', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `id_publicacion` int(11) NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `foto` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `certificado_oficio` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `horario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `edad_usuario` int(11) NOT NULL,
  `id_oficio` int(11) NOT NULL,
  `fecha_publicacion` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `visitas` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `publicacion`
--

INSERT INTO `publicacion` (`id_publicacion`, `correo`, `foto`, `certificado_oficio`, `descripcion`, `horario`, `precio`, `edad_usuario`, `id_oficio`, `fecha_publicacion`, `estado`, `visitas`) VALUES
(15, 'kcarrasco@gmail.com', NULL, NULL, 'Ofrezco mis servicios como carpintero 10 años de experiencia', 'disponibilidad lunes a viernes de 11:00 a 17:00', '$20.000 aprox, inbox mas info', 26, 1, '2021-07-05 23:33:29', 'Activa', 44),
(16, 'ara@gmail.com', NULL, NULL, 'Ofrezco mis servicios como estilista, puedo hacer visitas a domicilio, 3 años de experiencia en este oficio, cualquier consulta inbox o comunicarse a mi numero telefonico', 'Miercoles a viernes de 11:00 a 15:00', 'Aprox $25000', 26, 6, '2021-07-05 23:35:42', 'Activa', 44),
(17, 'czenteno@gmail.com', NULL, NULL, 'Realizo trabajos como empleada domestica por el día, incluyendo fines de semana y feriados, cualquier consulta inbox', 'Todos los dias de 9:00 a 18:00', '$40.000 aprox ', 42, 5, '2021-07-05 23:35:42', 'Activa', 16),
(18, 'av@gmail.com', NULL, NULL, 'arreglo canaletas de vio', '24/7', '15000', 40, 7, '2021-07-08 01:52:52', 'Activa', 91);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `id_puntuacion` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estrellas` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `puntuacion`
--

INSERT INTO `puntuacion` (`id_puntuacion`, `id_publicacion`, `correo`, `estrellas`) VALUES
(1, 18, 'av@gmail.com', 1),
(2, 16, 'av@gmail.com', 1),
(5, 17, 'av@gmail.com', 4),
(6, 18, 'dlipa@gmail.com', 3),
(7, 18, 'ara@gmail.com', 3),
(8, 18, 'kcarrasco@gmail.com', 4),
(9, 18, '', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion_pub`
--

CREATE TABLE `puntuacion_pub` (
  `id_puntuacion_pub` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `estrellas_cinco` int(11) NOT NULL,
  `estrellas_cuatro` int(11) NOT NULL,
  `estrellas_tres` int(11) NOT NULL,
  `estrellas_dos` int(11) NOT NULL,
  `estrellas_uno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `puntuacion_pub`
--

INSERT INTO `puntuacion_pub` (`id_puntuacion_pub`, `id_publicacion`, `estrellas_cinco`, `estrellas_cuatro`, `estrellas_tres`, `estrellas_dos`, `estrellas_uno`) VALUES
(1, 18, 1, 1, 2, 0, 1),
(2, 16, 0, 0, 0, 0, 1),
(3, 17, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `codigo_region` int(11) NOT NULL,
  `nombre_region` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`codigo_region`, `nombre_region`) VALUES
(1, 'Bio-Bio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `codigo_comuna` int(11) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`correo`, `nombre`, `apellido`, `contrasena`, `direccion`, `fecha_nacimiento`, `codigo_comuna`, `telefono`) VALUES
('ara@gmail.com', 'aracely', 'zenteno', '123456789', 'edimburgo 1712', '1996-08-26', 1, 961386241),
('av@gmail.com', 'Alejandro', 'Vejar', '123', 'Calle 1', '2021-07-07', 3, 123),
('czenteno@gmail.com', 'carmen', 'zenteno', '12345', 'sadasdsa', '2021-06-21', 4, 987654321),
('dlipa@gmail.com', 'dua', 'lipa', '1111', 'sadsadsa', '2021-06-30', 3, 987654321),
('kcarrasco@gmail.com', 'kevin', 'carrasco', '12345', 'finlandia 1667', '1998-02-23', 1, 942018931);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `busca`
--
ALTER TABLE `busca`
  ADD PRIMARY KEY (`correo`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_publicacion` (`id_publicacion`);

--
-- Indices de la tabla `chatea`
--
ALTER TABLE `chatea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_chat` (`id_chat`),
  ADD KEY `correo` (`correo`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `correo` (`correo`),
  ADD KEY `id_publicacion` (`id_publicacion`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`codigo_comuna`),
  ADD KEY `codigo_provincia` (`codigo_provincia`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD KEY `correo` (`correo`),
  ADD KEY `id_publicacion` (`id_publicacion`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `correo` (`correo`),
  ADD KEY `id_publicacion` (`id_publicacion`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id_mensaje`),
  ADD KEY `id_chat` (`id_chat`),
  ADD KEY `correo` (`correo`);

--
-- Indices de la tabla `oficio`
--
ALTER TABLE `oficio`
  ADD PRIMARY KEY (`id_oficio`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`codigo_provincia`),
  ADD KEY `codigo_region` (`codigo_region`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id_publicacion`),
  ADD KEY `id_oficio` (`id_oficio`),
  ADD KEY `correo` (`correo`);

--
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`id_puntuacion`);

--
-- Indices de la tabla `puntuacion_pub`
--
ALTER TABLE `puntuacion_pub`
  ADD PRIMARY KEY (`id_puntuacion_pub`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`codigo_region`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`correo`),
  ADD KEY `codigo_comuna` (`codigo_comuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `chatea`
--
ALTER TABLE `chatea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `codigo_comuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id_mensaje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `oficio`
--
ALTER TABLE `oficio`
  MODIFY `id_oficio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `codigo_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `id_publicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  MODIFY `id_puntuacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `puntuacion_pub`
--
ALTER TABLE `puntuacion_pub`
  MODIFY `id_puntuacion_pub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `codigo_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `chatea`
--
ALTER TABLE `chatea`
  ADD CONSTRAINT `chatea_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`id_chat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatea_ibfk_2` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`);

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `comuna_ibfk_1` FOREIGN KEY (`codigo_provincia`) REFERENCES `provincia` (`codigo_provincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`id_chat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`codigo_region`) REFERENCES `region` (`codigo_region`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`correo`) REFERENCES `usuario` (`correo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publicacion_ibfk_2` FOREIGN KEY (`id_oficio`) REFERENCES `oficio` (`id_oficio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`codigo_comuna`) REFERENCES `comuna` (`codigo_comuna`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
