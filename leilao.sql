-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2024 às 02:08
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `leilao`
--
CREATE DATABASE IF NOT EXISTS `leilao` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `leilao`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `minimo` decimal(10,2) NOT NULL,
  `estado` enum('aberto','encerrado') DEFAULT 'aberto',
  `vencedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`id`, `nome`, `imagem`, `minimo`, `estado`, `vencedor`) VALUES
(1, 'masqueico2', 'uploads/masqueico.jpg', 1.00, 'aberto', NULL),
(3, 'feps', 'uploads/felps.jpg', 100000.00, 'aberto', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `lances`
--

CREATE TABLE `lances` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lances`
--

INSERT INTO `lances` (`id`, `item_id`, `usuario_id`, `valor`) VALUES
(2, 3, 5, 10000000.00),
(3, 3, 6, 2154846.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'guguzin', 'guguzin@emailfd.com', '3925cfb34ed14cb86d7f39dee62126577cf788988f44fe9c3521aff5ac7306bd'),
(2, 'didizote', 'didizindaabundinha@gmail.com', 'aec68712f70486a1cb93c0dc712695f1d24c6c27c218e9ffd8539f506d45e104'),
(3, 'asdglo', 'q46sjh@gmail.com', 'be6a53066e84ce244c80ab9329bda11f2578f26eee2520e469b2f1a444088040'),
(4, 'sel', 'solar@gmail.com', '34d128f5b3dede622e107438fbefabdf0519ebab21ac7b6f2075f974d09ce524'),
(5, 'gugu', '123fsdg@gmail', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
(6, 'diogs', 'email@email', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vencedor` (`vencedor`);

--
-- Índices de tabela `lances`
--
ALTER TABLE `lances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `lances`
--
ALTER TABLE `lances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`vencedor`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `lances`
--
ALTER TABLE `lances`
  ADD CONSTRAINT `lances_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`),
  ADD CONSTRAINT `lances_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
