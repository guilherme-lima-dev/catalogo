-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Mar-2020 às 11:57
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catalago`
--
CREATE DATABASE IF NOT EXISTS `db_catalago` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_catalago`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL,
  `nome_emp` varchar(100) DEFAULT NULL,
  `cnpj_cpf` varchar(45) DEFAULT NULL,
  `razao_social` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status_emp` varchar(45) DEFAULT NULL,
  `data_cadastro_emp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`idempresa`, `nome_emp`, `cnpj_cpf`, `razao_social`, `email`, `status_emp`, `data_cadastro_emp`) VALUES
(1, 'Empresa Tal', '4432434324324', 'ssgf', 'efrw@gff.hyt', 'Ativo', '2020-03-13 03:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `nome_prod` varchar(45) DEFAULT NULL,
  `quantidade_prod` int(11) DEFAULT NULL,
  `foto_prod` varchar(256) DEFAULT NULL,
  `valor_prod` float DEFAULT NULL,
  `status_prod` varchar(45) DEFAULT NULL,
  `data_cadastro_prod` timestamp NULL DEFAULT NULL,
  `empresa_idempresa` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `descricao_prod` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idproduto`, `nome_prod`, `quantidade_prod`, `foto_prod`, `valor_prod`, `status_prod`, `data_cadastro_prod`, `empresa_idempresa`, `usuario_idusuario`, `descricao_prod`) VALUES
(3, 'Notebook', 12, 'https://d3emhpm0gj0nik.cloudfront.net/media/catalog/product/cache/2/image/700x700/9df78eab33525d08d6e5fb8d27136e95/a/s/asus_vivobook_15_x512fa_br569t_ag_1_4_1005700_9986_236_13048_1_20190827114745.png', 1212, 'Ativo', '2020-03-13 03:00:00', 1, 1, 'fdsdsfds fds fds fds fdsfdsds sdfsdfds'),
(4, 'Smart Telefone', 123, 'https://www.itforum365.com.br/wp-content/uploads/2016/11/eletronicos-1379888371-690x450.jpg', 2324, 'Ativo', '2020-03-13 03:00:00', 1, 1, 'f sd fdsf dsf ds4t43 ttds gf dfg df d fd'),
(17, 'Macbook', 10, 'https://www.lucasnaves.com.br/wp-content/uploads/2019/08/esgotado-300x238.png', 0.5, 'Ativo', NULL, 1, 1, 'Um mac dos top'),
(18, 'celu lar', 2, 'https://www.lucasnaves.com.br/wp-content/uploads/2019/08/esgotado-300x238.png', 0.1, 'Ativo', NULL, 1, 1, 'chique'),
(19, 'Fone', 2, 'https://www.lucasnaves.com.br/wp-content/uploads/2019/08/esgotado-300x238.png', 0.1233, 'Ativo', NULL, 1, 1, 'que eu nÃ£o vou poder ir');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome_user` varchar(45) DEFAULT NULL,
  `email_user` varchar(45) DEFAULT NULL,
  `senha_user` varchar(45) DEFAULT NULL,
  `nivel_user` varchar(45) DEFAULT NULL,
  `status_user` varchar(45) DEFAULT NULL,
  `data_cadastro_user` timestamp NULL DEFAULT NULL,
  `empresa_idempresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome_user`, `email_user`, `senha_user`, `nivel_user`, `status_user`, `data_cadastro_user`, `empresa_idempresa`) VALUES
(1, 'Guilhermão do Berrante', 'ggg@gmail.com', '123456', '1', 'Ativo', '2020-03-13 03:00:00', 1),
(2, 'Joao', 'jjj@gmail.com', '123456', '2', 'Ativo', '2020-03-13 03:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idempresa`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `fk_produto_empresa1_idx` (`empresa_idempresa`),
  ADD KEY `fk_produto_usuario1_idx` (`usuario_idusuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_empresa_idx` (`empresa_idempresa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idempresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_empresa1` FOREIGN KEY (`empresa_idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_empresa` FOREIGN KEY (`empresa_idempresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
