
CREATE TABLE tb_usuario (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL,
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
plano_ass VARCHAR(50)
);

CREATE TABLE tb_artista (
id_artista INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,       
pais_origem VARCHAR(100) NOT NULL
);

CREATE TABLE tb_album (
id_album INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
ano_lancamento YEAR NOT NULL,
id_artista INT NOT NULL,
);

CONSTRAINT fk_album_artista
FOREIGN KEY (id_artista)
REFERENCES tb_artista(id_artista)
ON DELETE CASCADE
);

INSERT INTO tb_artista (nome, pais_origem)
VALUES ('Clairo', 'Estados Unidos');
INSERT INTO tb_album (titulo, ano_lancamento, id_artista)
VALUES ('Immunity', 2020, 1);

INSERT INTO tb_artista (nome, pais_origem)
VALUES ('Chappel Roan', 'Estados Unidos');
INSERT INTO tb_album (titulo, ano_lancamento, id_artista)
VALUES ('The Rise and Fall of a Midwest Princess', 2025, 2);

INSERT INTO tb_artista (nome, pais_origem)
VALUES ('TAEYEON', 'Coreia do Sul');
INSERT INTO tb_album (titulo, ano_lancamento, id_artista)
VALUES ('INVU - The 3rd Album', 2022, 3);

SELECT a.id_album,
a.titulo AS album,
a.ano_lancamento,
ar.nome AS artista,
ar.pais_origem
FROM tb_album a
INNER JOIN tb_artista ar
ON a.id_artista = ar.id_artista;

CREATE TABLE tb_musica (
id_musica INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
duracao TIME NOT NULL,
id_artista INT NOT NULL,
id_album INT NOT NULL,

CONSTRAINT fk_musica_album
FOREIGN KEY (id_album)
REFERENCES tb_album(id_album)
ON DELETE CASCADE

  CONSTRAINT fk_musica_album
FOREIGN KEY (id_album)
REFERENCES tb_album(id_album)
ON DELETE CASCADE
);

INSERT INTO tb_musica (titulo, duracao, id_album)
VALUES ('Sofia', '00:03:45', 1);

INSERT INTO tb_musica (titulo, duracao, id_album)
VALUES ('Casual', '00:03:45', 2);

CREATE TABLE playlist_musica (
id_playlist_musica INT AUTO_INCREMENT PRIMARY KEY,
id_playlist INT NOT NULL,
id_musica INT NOT NULL,
ordem INT,
    
FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
FOREIGN KEY (id_musica) REFERENCES musica(id)
);
