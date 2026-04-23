create database faithforge;
use faithforge;

create table usuarios (
	id int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(255) unique not null,
    senha varchar(255) not null,
    avatar_url varchar(100) default 'avatar_padrao.png',
    data_cadastro timestamp default current_timestamp,
    streak int default 0,
    ultima_atividade date
);

create table questoes (
	id int primary key auto_increment,
    titulo varchar(100),
    categoria varchar(50),
    dificuldade varchar(50),
    resumo varchar(255),
    resposta text,
    escritura varchar(255)
);

create table tags (
	id int primary key auto_increment,
    nome varchar(50) unique not null
);

create table questoes_tags (
	questao_id int,
    tag_id int,
    primary key (questao_id, tag_id),
    constraint fk_questoes_tags_questoes foreign key (questao_id) references questoes (id) on delete cascade,
    constraint fk_questoes_tags_tags foreign key (tag_id) references tags (id) on delete cascade
);

create table estudos (
	id int primary key auto_increment,
    nota_conviccao decimal(3,1),
    data_estudo timestamp default current_timestamp,
    usuario_id int,
    questao_id int,
    constraint fk_estudos_usuarios foreign key (usuario_id) references usuarios (id) on delete cascade,
    constraint fk_estudos_questoes foreign key (questao_id) references questoes (id) on delete cascade
);

insert into usuarios (nome, email, senha, data_cadastro, streak, ultima_atividade) values
('Dev Teste', 'teste@faithforge.com', 'senha_123', '2026-01-15 10:00:00', 12, '2026-04-20');

insert into questoes (titulo, categoria, dificuldade, resumo, resposta, escritura) values
('O Problema do Mal', 'Filosofia', 'Avançado', 'Como um Deus todo-bom e todo-poderoso pode permitir que o sofrimento e o mal existam no mundo?', null, 'Romanos 8:18 — '),
('Jesus ressuscitou dos mortos?', 'História', 'Intermediário', 'Quais são as evidências históricas da ressurreição corporal de Jesus Cristo?', null, '1 Coríntios 15:3-4 — '),
('A ciência pode refutar a existência de Deus?', 'Ciência', 'Intermediário', 'A ciência e a fé estão em conflito, ou apontam para a mesma realidade última?', null, 'Salmo 19:1 — '),
('A Bíblia é historicamente confiável?', 'História', 'Fundação', 'Podemos confiar no Antigo e no Novo Testamento como documentos históricos precisos?', null, '2 Timótio 3:16 — '''''),
('Deus existe? O Argumento Cosmológico', 'Filosofia', 'Avançado', 'O Argumento Cosmológico de Kalam apresenta uma argumentação lógica a favor da existência de um Criador.', null, 'Gênesis 1:1 — '),
('O Argumento Moral a Favor de Deus', 'Filosofia', 'Avançado', 'Os valores morais objetivos apontam para um legislador moral transcendente, além das convenções humanas.', null, 'Romanos 2:14-15 — '),
('E quanto às outras religiões?', 'Filosofia', 'Intermediário', 'O cristianismo é exclusivista? Como devemos lidar com a afirmação de que todas as religiões conduzem a Deus?', null, 'João 14:6 — '),
('O ajuste fino do universo', 'Ciência', 'Avançado', 'A calibração precisa das constantes cósmicas sugere um projeto intencional, e não o acaso.', null, 'Isaías 45:18 — '),
('A fé se opõe à razão?', 'Filosofia', 'Fundação', 'A fé bíblica não é uma crença cega, mas uma confiança fundamentada, baseada em evidências e na revelação.', null, '1 Pedro 3:15 — '),
('O Argumento da Consciência', 'Filosofia', 'Avançado', 'É extremamente difícil explicar a existência da consciência subjetiva sem recorrer a uma mente divina.', null, 'Gênesis 2:7 — '),
('A violência no Antigo Testamento e o caráter de Deus', 'Escritura', 'Avançado', 'Como conciliamos o Deus do Antigo Testamento com o Deus do amor revelado em Cristo?', null, 'Hebreus 1:1-2 — '),
('O Argumento Ontológico', 'Filosofia', 'Avançado', 'O argumento modal de Anselmo defende que a existência de Deus é logicamente necessária, e não contingente.', null, 'Êxodo 3:14 — ');

insert into tags (nome) values
('teodiceia'),('sofrimento'),('livre arbítrio'),
('ressureição'),('história'),('evidência'),
('ciência'),('fé'),('cosmologia'),
('Bíblia'),('manuscritos'),('arqueologia'),
('Kalam'),('existência de Deus'),
('moralidade'),('ética'),('lei natural'),
('pluralismo'),('exclusivismo'),('verdade'),
('ajuste fino'),('design'),
('razão'),('apologética'),
('consciência'),('mente'),('materialismo'),
('Antigo Testamento'),('hermenêutica'),('natureza de Deus'),
('argumento ontológico'),('Anselmo'),('lógica modal');

insert into questoes_tags (questao_id, tag_id) values
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5), (2, 6),
(3, 7), (3, 8), (3, 9),
(4, 10), (4, 11), (4, 12),
(5, 9), (5, 13), (5, 14),
(6, 15), (6, 16), (6, 17),
(7, 18), (7, 19), (7, 20),
(8, 21), (8, 9), (8, 22),
(9, 8), (9, 23), (9, 24),
(10, 25), (10, 26), (10, 27),
(11, 28), (11, 29), (11, 30),
(12, 31), (12, 32), (12, 33);

insert into estudos (usuario_id, questao_id, nota_conviccao, data_estudo) values
(1, 1, 4.0, '2026-01-20 14:30:00'),
(1, 1, 6.5, '2026-02-15 10:15:00'),
(1, 1, 9.5, '2026-04-18 20:00:00'),
(1, 4, 7.0, '2026-02-10 09:00:00'),
(1, 4, 10.0, '2026-03-05 16:45:00'),
(1, 5, 3.5, '2026-01-25 21:00:00'),
(1, 5, 8.0, '2026-04-20 19:30:00'),
(1, 2, 9.0, '2026-03-12 08:20:00'),
(1, 8, 6.0, '2026-04-10 11:10:00'),
(1, 9, 8.5, '2026-04-19 22:05:00');