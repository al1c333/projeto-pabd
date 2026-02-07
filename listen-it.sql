CREATE TABLE `tb_album` (
  `id_album` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `ano_lancamento` year(4) NOT NULL,
  `id_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_album`
--

INSERT INTO `tb_album` (`id_album`, `titulo`, `ano_lancamento`, `id_artista`) VALUES
(1, 'Immunity', '2020', 1),
(2, 'The Rise and Fall of a Midwest Princess', '2025', 2),
(3, 'INVU - The 3rd Album', '2022', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_artista`
--

CREATE TABLE `tb_artista` (
  `id_artista` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `pais_origem` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_artista`
--

INSERT INTO `tb_artista` (`id_artista`, `nome`, `pais_origem`) VALUES
(1, 'Clairo', 'Estados Unidos'),
(2, 'Chappell Roan', 'Estados Unidos'),
(3, 'TAEYEON', 'Coreia do Sul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_musica`
--

CREATE TABLE `tb_musica` (
  `id_musica` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `duracao` time NOT NULL,
  `id_album` int(11) NOT NULL,
  `id_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_musica`
--

INSERT INTO `tb_musica` (`id_musica`, `titulo`, `duracao`, `id_album`, `id_artista`) VALUES
(1, 'Sofia', '00:03:45', 1, 1),
(2, 'Casual', '00:03:45', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_playlist`
--

CREATE TABLE `tb_playlist` (
  `id_playlist` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_criacao` date NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_playlist`
--

INSERT INTO `tb_playlist` (`id_playlist`, `nome`, `data_criacao`, `id_usuario`) VALUES
(1, 'Minhas Favoritas', '2025-01-27', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_playlist_musica`
--

CREATE TABLE `tb_playlist_musica` (
  `id_playlist` int(11) NOT NULL,
  `id_musica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_playlist_musica`
--

INSERT INTO `tb_playlist_musica` (`id_playlist`, `id_musica`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_album_musica`
--

CREATE TABLE `tb_album_musica` (
  `id_album` int(11) NOT NULL,
  `id_musica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_album_musica`
--

INSERT INTO `tb_album_musica` (`id_album`, `id_musica`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_cadastro` date NOT NULL,
  `plano_ass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome`, `email`, `senha`, `data_cadastro`, `plano_ass`) VALUES
(1, 'Anderson', 'anderson@email.com', '123456', '2025-01-27', 'Premium');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_album`
--
ALTER TABLE `tb_album`
  ADD PRIMARY KEY (`id_album`),
  ADD KEY `fk_album_artista` (`id_artista`);

--
-- Índices de tabela `tb_artista`
--
ALTER TABLE `tb_artista`
  ADD PRIMARY KEY (`id_artista`);

--
-- Índices de tabela `tb_musica`
--
ALTER TABLE `tb_musica`
  ADD PRIMARY KEY (`id_musica`),
  ADD KEY `fk_musica_album` (`id_album`),
  ADD KEY `fk_musica_artista` (`id_artista`);

--
-- Índices de tabela `tb_playlist`
--
ALTER TABLE `tb_playlist`
  ADD PRIMARY KEY (`id_playlist`),
  ADD KEY `fk_playlist_usuario` (`id_usuario`);

--
-- Índices de tabela `tb_playlist_musica`
--
ALTER TABLE `tb_playlist_musica`
  ADD PRIMARY KEY (`id_playlist`,`id_musica`),
  ADD KEY `fk_pm_musica` (`id_musica`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_album`
--
ALTER TABLE `tb_album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_artista`
--
ALTER TABLE `tb_artista`
  MODIFY `id_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_musica`
--
ALTER TABLE `tb_musica`
  MODIFY `id_musica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_playlist`
--
ALTER TABLE `tb_playlist`
  MODIFY `id_playlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_album`
--
ALTER TABLE `tb_album`
  ADD CONSTRAINT `fk_album_artista` FOREIGN KEY (`id_artista`) REFERENCES `tb_artista` (`id_artista`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_musica`
--
ALTER TABLE `tb_musica`
  ADD CONSTRAINT `fk_musica_album` FOREIGN KEY (`id_album`) REFERENCES `tb_album` (`id_album`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_musica_artista` FOREIGN KEY (`id_artista`) REFERENCES `tb_artista` (`id_artista`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_playlist`
--
ALTER TABLE `tb_playlist`
  ADD CONSTRAINT `fk_playlist_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tb_playlist_musica`
--
ALTER TABLE `tb_playlist_musica`
  ADD CONSTRAINT `fk_pm_musica` FOREIGN KEY (`id_musica`) REFERENCES `tb_musica` (`id_musica`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pm_playlist` FOREIGN KEY (`id_playlist`) REFERENCES `tb_playlist` (`id_playlist`) ON DELETE CASCADE;
COMMIT;
