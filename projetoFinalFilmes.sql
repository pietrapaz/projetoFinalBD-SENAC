CREATE DATABASE projetoFinalFilmes;
USE projetoFinalFilmes;
SHOW TABLES;
-- DROP DATABASE projetoFinalFilmes;

CREATE TABLE tb_login(
	email varchar(100) not null,
    senha varchar(100) not null,
    primary key (email)
);

CREATE TABLE tb_conta(
    email varchar(100) not null,
    nome varchar(100),
	usuario varchar(100) not null,
    dt_nasc_conta date not null,
    primary key (email),
    foreign key (email) references tb_login (email)
);

-- id pais vai ate 300
CREATE TABLE tb_pais(
	id_pais int not null,
    nome_pais varchar(100) not null,
    sigla_pais varchar(5),
    primary key (id_pais)
);

-- id é a data de nascimento por 'YYYY-MM-DD' e um numero depois caso alguem tenha a mesma data
CREATE TABLE tb_diretor(
	id_diretor int not null,
    nome_diretor varchar(100) not null,
    primary key (id_diretor)
);

-- id do filme comeca em 100001
CREATE TABLE tb_filme(
	id_filme int not null,
    id_diretor int not null,
    titulo_original varchar(100) not null,
    duracao_filme varchar(10),
    sinopse_filme text,
    situacao_filme enum('Em produção', 'Lançado') not null,
    classificacao_filme enum('L', '10', '12', '14', '16', '+18', 'null') not null,
    lancamento_filme year,
    avaliacao int,
    poster text,
    trailer text,
    primary key (id_filme),
    foreign key (id_diretor) references tb_diretor (id_diretor)
);

-- id elenco sao as iniciais do nome + dt nasc
CREATE TABLE tb_elenco(
	id_elenco varchar(20) not null,
    id_pais int not null,
    nome_elenco varchar(100),
    genero enum('F', 'M', 'NB', 'Outros'),
    dt_nasc_elenco date,
    falecimento date,
    biografia text,
    foto text,
    primary key (id_elenco),
    foreign key (id_pais) references tb_pais (id_pais)
);

-- id idioma sao as iniciais do idioma
CREATE TABLE tb_idioma(
	id_idioma varchar(5) not null,
    nome_idioma varchar(80) not null,
    primary key (id_idioma)
);

-- id genero é do 400 pra cima
CREATE TABLE tb_genero(
	id_genero int not null,
    nome_genero varchar(80) not null,
    primary key (id_genero)
);

-- id é nome de usuario + numero em ordem crescente
CREATE TABLE tb_forum(
	id_forum varchar(100) not null,
    email varchar(100) not null,
    id_filme int not null,
    comentario text not null,
    data_comentario date not null,
    primary key (id_forum),
    foreign key (email) references tb_login (email),
    foreign key (id_filme) references tb_filme (id_filme)
);

CREATE TABLE tb_assistidos(
	email varchar(100) not null,
    id_filme int not null,
    primary key (email, id_filme),
    foreign key (email) references tb_login (email),
    foreign key (id_filme) references tb_filme (id_filme)
);

CREATE TABLE tb_assistir_depois(
	email varchar(100) not null,
    id_filme int not null,
    primary key (email, id_filme),
    foreign key (email) references tb_login (email),
    foreign key (id_filme) references tb_filme (id_filme)
);

CREATE TABLE tb_favoritos(
	email varchar(100) not null,
    id_filme int not null,
    primary key (email, id_filme),
    foreign key (email) references tb_login (email),
    foreign key (id_filme) references tb_filme (id_filme)
);

CREATE TABLE rl_filme_pais(
	id_filme int not null,
    id_pais int not null,
    primary key (id_filme, id_pais),
    foreign key (id_filme) references tb_filme (id_filme),
	foreign key (id_pais) references tb_pais (id_pais)
);

CREATE TABLE rl_filme_idioma(
	id_filme int not null,
    id_idioma varchar(5) not null,
    primary key (id_filme, id_idioma),
    foreign key (id_filme) references tb_filme (id_filme),
    foreign key (id_idioma) references tb_idioma (id_idioma)
);

CREATE TABLE rl_filme_genero(
	id_filme int not null,
    id_genero int not null,
    primary key (id_filme, id_genero),
    foreign key (id_filme) references tb_filme (id_filme),
    foreign key (id_genero) references tb_genero (id_genero)
);

CREATE TABLE tb_atuacao(
	id_filme int not null,
    id_elenco varchar(20) not null,
    nome_personagem varchar(100) not null,
    primary key (id_filme, id_elenco),
    foreign key (id_filme) references tb_filme (id_filme),
    foreign key (id_elenco) references tb_elenco (id_elenco)
);

CREATE TABLE log_conta(
	data_criacao date not null,
    ocorrencia varchar(50),
	email varchar(100) not null,
    nome varchar(100),
	usuario varchar(100) not null,
    dt_nasc_conta date not null
);

CREATE TABLE log_login(
	data_mudanca date not null,
    ocorrencia varchar(50),
	email varchar(100) not null,
    senha varchar(100) not null
);

SHOW TABLES;

INSERT INTO tb_idioma (id_idioma, nome_idioma) VALUES 
('afr', 'Africâner'),
('amh', 'Amárico'),
('ara', 'Árabe'),
('aze', 'Azerbaijano'),
('bel', 'Bielorrusso'),
('ben', 'Bengali'),
('bis', 'Bislama'),
('bos', 'Bósnio'),
('bul', 'Búlgaro'),
('cat', 'Catalão'),
('ces', 'Tcheco'),
('crp', 'Crioulo'),
('dan', 'Dinamarquês'),
('deu', 'Alemão'),
('div', 'Dhivehi'),
('dzo', 'Zoncá'),
('ell', 'Grego'),
('eng', 'Inglês'),
('est', 'Estoniano'),
('fas', 'Persa'),
('fij', 'Fijano'),
('fil', 'Filipino'),
('fin', 'Finlandês'),
('fra', 'Francês'),
('gil', 'Ikiribati'),
('gle', 'Irlandês'),
('heb', 'Hebraico'),
('hin', 'Hindi'),
('hrv', 'Croata'),
('hun', 'Húngaro'),
('hye', 'Armênio'),
('ind', 'Indonésio'),
('isl', 'Islandês'),
('ita', 'Italiano'),
('jpn', 'Japonês'),
('kat', 'Georgiano'),
('kaz', 'Cazaque'),
('khm', 'Khmer'),
('kir', 'Quirguiz'),
('kor', 'Coreano'),
('lao', 'Laosiano'),
('lav', 'Letão'),
('lit', 'Lituano'),
('ltz', 'Luxembureguês'),
('mkd', 'Macedônio'),
('mlt', 'Maltês'),
('mon', 'Mongol'),
('msa', 'Malaio'),
('mya', 'Birmanês'),
('nau', 'Nauruano'),
('nep', 'Nepali'),
('nld', 'Holandês'),
('nor', 'Norueguês'),
('pol', 'Polonês'),
('por', 'Português'),
('pus', 'Pachto'),
('ron', 'Romeno'),
('rus', 'Russo'),
('sin', 'Sinhala'),
('slk', 'Eslovaco'),
('slv', 'Esloveno'),
('smo', 'Samoano'),
('spa', 'Espanhol'),
('sqi', 'Albanês'),
('srp', 'Sérvio'),
('swa', 'Suaíle'),
('swe', 'Sueco'),
('tgk', 'Tadjique'),
('ton', 'Tonganês'),
('tur', 'Turco'),
('ukr', 'Ucraniano'),
('urd', 'Urdu'),
('uzb', 'Uzbeque'),
('vie', 'Vietnamita'),
('zho', 'Mandarim');
SELECT * FROM tb_idioma;

INSERT INTO tb_pais (id_pais, nome_pais, sigla_pais) VALUES
(1, 'Brasil', 'BR'),
(2, 'Afeganistão', 'AF'),
(3, 'Republica da Albânia', 'AL'),
(4, 'Argélia', 'DZ'),
(5, 'Samoa Americana', 'AS'),
(6, 'Andorra', 'AD'),
(7, 'Angola', 'AO'),
(8, 'Anguilla', 'AI'),
(9, 'Antártida', 'AQ'),
(10, 'Antigua e Barbuda', 'AG'),
(11, 'Argentina', 'AR'),
(12, 'Republica da Armênia', 'AM'),
(13, 'Aruba', 'AW'),
(14, 'Austrália', 'AU'),
(15, 'Áustria', 'AT'),
(16, 'Republica do Azerbaijão', 'AZ'),
(17, 'Ilhas Bahamas', 'BS'),
(18, 'Ilhas Bahrein', 'BH'),
(19, 'Bangladesh', 'BD'),
(20, 'Barbados', 'BB'),
(21, 'Republica da Belarus', 'BY'),
(22, 'Bélgica', 'BE'),
(23, 'Belize', 'BZ'),
(24, 'Benin', 'BJ'),
(25, 'Bermudas', 'BM'),
(26, 'Butão', 'BT'),
(27, 'Bolívia', 'BO'),
(28, 'Republica da Bósnia-herzegovina', 'BA'),
(29, 'Botsuana', 'BW'),
(30, 'Ilha Bouvet', 'BV'),
(31, 'Território Britânico do Oceano Indico', 'IO'),
(32, 'Brunei', 'BN'),
(33, 'Republica da Bulgária', 'BG'),
(34, 'Burkina Faso', 'BF'),
(35, 'Burundi', 'BI'),
(36, 'Camboja', 'KH'),
(37, 'Camarões', 'CM'),
(38, 'Canada', 'CA'),
(39, 'Republica de Cabo Verde', 'CV'),
(40, 'Ilhas Cayman', 'KY'),
(41, 'Republica Centro-Africana', 'CF'),
(42, 'Chade', 'TD'),
(43, 'Chile', 'CL'),
(44, 'Republica Popular China', 'CN'),
(45, 'Ilha Christmas(Navidad)', 'CX'),
(46, 'Ilhas Cocos (Keeling)', 'CC'),
(47, 'Colômbia', 'CO'),
(48, 'Ilhas Comores', 'KM'),
(49, 'Congo', 'CG'),
(50, 'Republica Democrática do Congo', 'CD'),
(51, 'Ilhas Cook', 'CK'),
(52, 'Costa Rica', 'CR'),
(53, 'Costa do Marfim', 'CI'),
(54, 'Republica da Croácia', 'HR'),
(55, 'Cuba', 'CU'),
(56, 'Chipre', 'CY'),
(57, 'Republica Tcheca', 'CZ'),
(58, 'Dinamarca', 'DK'),
(59, 'Djibuti', 'DJ'),
(60, 'Ilha Dominica', 'DM'),
(61, 'Republica Dominicana', 'DO'),
(62, 'Timor Leste', 'TL'),
(63, 'Equador', 'EC'),
(64, 'Egito', 'EG'),
(65, 'El Salvador', 'SV'),
(66, 'Guine-Equatorial', 'GQ'),
(67, 'Eritreia', 'ER'),
(68, 'Republica da Estônia', 'EE'),
(69, 'Etiópia', 'ET'),
(70, 'Falkland (Ilhas Malvinas)', 'FK'),
(71, 'Ilhas Feroe', 'FO'),
(72, 'Fiji', 'FJ'),
(73, 'Finlândia', 'FI'),
(74, 'Franca', 'FR'),
(76, 'Guiana francesa', 'GF'),
(77, 'Polinésia Francesa', 'PF'),
(78, 'Terras Austrais e Antárticas Francesas', 'TF'),
(79, 'Gabão', 'GA'),
(80, 'Gambia', 'GM'),
(81, 'Republica da Georgia', 'GE'),
(82, 'Alemanha', 'DE'),
(83, 'Gana', 'GH'),
(84, 'Gibraltar', 'GI'),
(85, 'Grécia', 'GR'),
(86, 'Groenlândia', 'GL'),
(87, 'Granada', 'GD'),
(88, 'Guadalupe', 'GP'),
(89, 'Guam', 'GU'),
(90, 'Guatemala', 'GT'),
(91, 'Guine', 'GN'),
(92, 'Guine-Bissau', 'GW'),
(93, 'Guiana', 'GY'),
(94, 'Haiti', 'HT'),
(95, 'Ilha Heard e Ilhas McDonald', 'HM'),
(96, 'Estado da Cidade do Vaticano', 'VA'),
(97, 'Honduras', 'HN'),
(98, 'Hong Kong', 'HK'),
(99, 'Republica da Hungria', 'HU'),
(100, 'Islândia', 'IS'),
(101, 'Índia', 'IN'),
(102, 'Indonésia', 'ID'),
(103, 'Republica Islâmica do Ira', 'IR'),
(104, 'Iraque', 'IQ'),
(105, 'Irlanda', 'IE'),
(106, 'Israel', 'IL'),
(107, 'Itália', 'IT'),
(108, 'Jamaica', 'JM'),
(109, 'Japão', 'JP'),
(110, 'Jordânia', 'JO'),
(111, 'Republica do Cazaquistão', 'KZ'),
(112, 'Quênia', 'KE'),
(113, 'Kiribati', 'KI'),
(114, 'Republica Popular Democrática da Coreia', 'KP'),
(115, 'Republica da Coreia', 'KR'),
(116, 'Kuwait', 'KW'),
(117, 'Republica Quirguiz', 'KG'),
(118, 'Republica Popular Democrática do Laos', 'LA'),
(119, 'Republica da Letônia', 'LV'),
(120, 'Líbano', 'LB'),
(121, 'Lesoto', 'LS'),
(122, 'Libéria', 'LR'),
(123, 'Líbia', 'LY'),
(124, 'Liechtenstein', 'LI'),
(125, 'Republica da Lituânia', 'LT'),
(126, 'Luxemburgo', 'LU'),
(127, 'Macau', 'MO'),
(128, 'Macedônia do Norte', 'MK'),
(129, 'Madagascar', 'MG'),
(130, 'Malavi', 'MW'),
(131, 'Malásia', 'MY'),
(132, 'Maldivas', 'MV'),
(133, 'Mali', 'ML'),
(134, 'Malta', 'MT'),
(135, 'Ilhas Marshall', 'MH'),
(136, 'Martinica', 'MQ'),
(137, 'Mauritânia', 'MR'),
(138, 'Mauricio', 'MU'),
(139, 'Mayotte (Ilhas Francesas)', 'YT'),
(140, 'México', 'MX'),
(141, 'Micronesia', 'FM'),
(142, 'Republica da Moldávia', 'MD'),
(143, 'Mônaco', 'MC'),
(144, 'Mongólia', 'MN'),
(145, 'Ilhas Montserrat', 'MS'),
(146, 'Marrocos', 'MA'),
(147, 'Moçambique', 'MZ'),
(148, 'Mianmar (Birmânia)', 'MM'),
(149, 'Namíbia', 'NA'),
(150, 'Nauru', 'NR'),
(151, 'Nepal', 'NP'),
(152, 'Países Baixos (Holanda)', 'NL'),
(154, 'Nova Caledonia', 'NC'),
(155, 'Nova Zelândia', 'NZ'),
(156, 'Nicarágua', 'NI'),
(157, 'Níger', 'NE'),
(158, 'Nigéria', 'NG'),
(159, 'Ilha Niue', 'NU'),
(160, 'Ilha Norfolk', 'NF'),
(161, 'Marianas do Norte', 'MP'),
(162, 'Noruega', 'NO'),
(163, 'Oma', 'OM'),
(164, 'Paquistão', 'PK'),
(165, 'Palau', 'PW'),
(166, 'Panamá', 'PA'),
(167, 'Papua Nova Guine', 'PG'),
(168, 'Paraguai', 'PY'),
(169, 'Peru', 'PE'),
(170, 'Filipinas', 'PH'),
(171, 'Ilha Pitcairn', 'PN'),
(172, 'Republica da Polônia', 'PL'),
(173, 'Portugal', 'PT'),
(174, 'Porto Rico', 'PR'),
(175, 'Catar', 'QA'),
(176, 'Ilha Reunião', 'RE'),
(177, 'Romênia', 'RO'),
(178, 'Federação da Rússia', 'RU'),
(179, 'Ruanda', 'RW'),
(180, 'Ilhas São Cristovão e Neves', 'KN'),
(181, 'Santa Lucia', 'LC'),
(182, 'São Vicente e Granadinas', 'VC'),
(183, 'Samoa', 'WS'),
(184, 'San Marino', 'SM'),
(185, 'Ilhas São Tome e Príncipe', 'ST'),
(186, 'Arábia Saudita', 'SA'),
(187, 'Senegal', 'SN'),
(188, 'Seychelles', 'SC'),
(189, 'Serra Leoa', 'SL'),
(190, 'Cingapura', 'SG'),
(191, 'Republica Eslovaca', 'SK'),
(192, 'Republica da Eslovênia', 'SI'),
(193, 'Ilhas Salomão', 'SB'),
(194, 'Somalia', 'SO'),
(195, 'África do Sul', 'ZA'),
(196, 'Ilhas Geórgia do Sul e Sandwich do Sul', 'GS'),
(197, 'Espanha', 'ES'),
(198, 'Sri Lanka', 'LK'),
(199, 'Santa Helena', 'SH'),
(200, 'São Pedro e Miquelon', 'PM'),
(201, 'Sudão', 'SD'),
(202, 'Suriname', 'SR'),
(203, 'Svalbard e Jan Mayen', 'SJ'),
(204, 'Eswatini', 'SZ'),
(205, 'Suécia', 'SE'),
(206, 'Suíça', 'CH'),
(207, 'Republica Árabe da Síria', 'SY'),
(208, 'Taiwan', 'TW'),
(209, 'Republica do Tadjiquistao', 'TJ'),
(210, 'Republica Unida da Tanzânia', 'TZ'),
(211, 'Tailândia', 'TH'),
(212, 'Togo', 'TG'),
(213, 'Ilhas Toquelau', 'TK'),
(214, 'Tonga', 'TO'),
(215, 'Trinidad e Tobago', 'TT'),
(216, 'Tunísia', 'TN'),
(217, 'Turquia', 'TR'),
(218, 'Republica do Turcomenistão', 'TM'),
(219, 'Ilhas Turcas e Caicos', 'TC'),
(220, 'Tuvalu', 'TV'),
(221, 'Uganda', 'UG'),
(222, 'Ucrânia', 'UA'),
(223, 'Emirados Árabes Unidos', 'AE'),
(224, 'Reino Unido', 'GB'),
(225, 'Estados Unidos', 'US'),
(226, 'Ilhas Menores Distantes dos Estados Unidos', 'UM'),
(227, 'Uruguai', 'UY'),
(228, 'Republica do Uzbequistão', 'UZ'),
(229, 'Vanuatu', 'VU'),
(230, 'Venezuela', 'VE'),
(231, 'Vietnã', 'VN'),
(232, 'Ilhas Virgens(Britânicas)', 'VG'),
(233, 'Ilhas Virgens(E.U.A.)', 'VI'),
(234, 'Ilhas Wallis e Futuna', 'WF'),
(235, 'Saara Ocidental', 'EH'),
(236, 'Iémen', 'YE'),
(237, 'República Fed. da Iugoslávia', 'YU'),
(238, 'Zâmbia', 'ZM'),
(239, 'Zimbabue', 'ZW'),
(240, 'Ilha do Canal Guernsey(Inclui Alderney e Sark)', 'GG'),
(241, 'Ilha do Canal Jersey', 'JE'),
(243, 'Ilha de Man', 'IM'),
(246, 'Montenegro', 'ME'),
(247, 'Sérvia', 'RS'),
(248, 'Sudao do Sul', 'SS'),
(252, 'Palestina', 'PS'),
(253, 'Aland, Ilhas', 'AX'),
(255, 'Curaçao', 'CW'),
(256, 'Ilha de São Martinho(Parte Holandesa)', 'SM'),
(258, 'Bonaire', 'AN'),
(259, 'Antartica', 'AQ'),
(260, 'Ilha Herad e Ilhas Macdonald', 'AU'),
(261, 'São Bartolomeu', 'FR'),
(262, 'Ilha de São Martinho(Parte Francesa)', 'SM'),
(263, 'Terras Austrais e Antárcticas Francesas', 'TF');
SELECT * FROM tb_pais;

INSERT INTO tb_genero (id_genero, nome_genero) VALUES (401, 'Ação');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (402, 'Crime');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (403, 'Misterio');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (404, 'Fantasia');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (405, 'Aventura');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (406, 'Terror');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (407, 'Suspense');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (408, 'Romance');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (409, 'Drama');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (410, 'Comédia');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (411, 'Comédia romântica');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (412, 'Ficção científica');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (413, 'Musical');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (414, 'Histórico');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (415, 'Documentário');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (416, 'Animação');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (417, 'Anime');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (418, 'Culinária');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (419, 'Esporte');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (420, 'Guerra');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (421, 'Policial');
INSERT INTO tb_genero (id_genero, nome_genero) VALUES (422, 'Super-herói');
SELECT * FROM tb_genero;
-- id genero é do 400 pra cima

INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('196303271', 'Quentin Jerome Tarantino');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('196111281', 'Alfonso Cuarón Orozco');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('196308151', 'Alejandro González Iñárritu');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('196910221', 'Spike Jonze');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('198307101', 'Charles Malcolm McDowell');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('195411071', 'Gil Junger');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('197012201', 'Todd Phillips');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('194311301', 'Terrence Malick');
INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('197911191', 'Barry Jenkins');
SELECT * FROM tb_diretor;
/* -- id é a data de nascimento por 'YYYY-MM-DD' e um numero depois caso alguem tenha a mesma data
	INSERT INTO tb_diretor (id_diretor, nome_diretor) VALUES ('', ''); */

INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100001, 196303271, 'Kill Bill: Volume 1', '1h51m', 
'A ex-assassina conhecida apenas como "A Noiva" acorda de um coma de quatro anos decidida a se vingar de Bill, seu ex-amante e chefe, que tentou matá-la no dia do casamento. Ela está motivada a acertar as contas com cada uma das pessoas envolvidas com a perda da filha, da festa de casamento e dos quatro anos da sua vida. Na jornada, "A Noiva" é submetida a dores físicas agoniantes ao enfrentar a inescrupulosa gangue de Bill, o Esquadrão Assassino de Víboras Mortais.',
'Lançado', '+18', '2004', null, 'https://upload.wikimedia.org/wikipedia/pt/6/6d/Kill_Bill_poster.jpg', 
'https://www.youtube.com/watch?v=7kSuas6mRpk');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100002, 196111281, 'Children Of Men', '1h49m', 
'No ano de 2027, a infertilidade é uma ameaça real para a civilização, e o último humano a nascer em anos acaba de morrer. Frente a um cenário pessimista sobre o futuro, um burocrata desiludido se torna o herói improvável que pode salvar a humanidade. Para isso, ele enfrenta seus próprios demônios e tenta proteger a última esperança do planeta: uma jovem mulher milagrosamente grávida, descoberta pela ativista inteligente com quem fora casado.',
'Lançado', '16', '2006', null, 'https://pics.filmaffinity.com/Children_of_Men-423341707-large.jpg', 
'https://www.youtube.com/watch?v=2VT2apoX90o');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100003, 196308151, 'Birdman or (The Unexpected Virtue of Ignorance)', '1h59m', 
'No passado, Riggan Thomson (Michael Keaton) fez muito sucesso interpretando o Birdman, um super-herói que se tornou um ícone cultural. Entretanto, desde que se recusou a estrelar o quarto filme com a personagem, sua carreira começou a decair. Em busca da fama perdida e também do reconhecimento como ator, ele decide dirigir, roteirizar e estrelar a adaptação de um texto consagrado para a Broadway. Entretanto, em meio aos ensaios com o elenco formado por Mike Shiner (Edward Norton), Lesley (Naomi Watts) e Laura (Andrea Riseborough), Riggan precisa lidar com seu agente Brandon (Zach Galifianakis) e seu relacionamento conturbado com sua ex-esposa (Amy Ryan) e com sua filha (Emma Stone). No meio dessa tensão da pré-estreia, ele começa a ser atormentado por uma estranha voz que insiste em permanecer em sua mente.',
'Lançado', '16', '2015', null, 'https://m.media-amazon.com/images/M/MV5BODAzNDMxMzAxOV5BMl5BanBnXkFtZTgwMDMxMjA4MjE@._V1_.jpg', 
'https://www.youtube.com/watch?v=uJfLoE6hanc');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100004, 196910221, 'Her', '2h6m', 
'Em um futuro próximo, um escritor solitário desenvolve um relacionamento improvável com um sistema operacional projetado para atender todas as suas necessidades.',
'Lançado', '14', '2014', null, 'https://m.media-amazon.com/images/M/MV5BMjA1Nzk0OTM2OF5BMl5BanBnXkFtZTgwNjU2NjEwMDE@._V1_.jpg', 
'https://www.youtube.com/watch?v=dJTU48_yghs');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100005, 198307101, 'The Discovery', '1h42m', 
'Um ano após a existência da vida após a morte ser comprovada cientificamente, milhões de pessoas recorrem ao suicídio para chegar lá. Um homem e uma mulher se apaixonam nesse cenário nada propício ao amor enquanto tentam aceitar as suas próprias tragédias pessoais e descobrir a verdadeira natureza do pós-vida.',
'Lançado', '16', '2017', null, 'https://br.web.img2.acsta.net/pictures/17/02/22/18/17/527496.jpg', 
'https://www.youtube.com/watch?v=z9j6WcdU-ts');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100006, 195411071, '10 Things I Hate About You', '1h37m', 
'Em seu primeiro dia na nova escola, Cameron se apaixona por Bianca. Mas ela só poderá sair com rapazes até que Kat, sua irmã mais velha, arrume um namorado. O problema é que ela é insuportável. Cameron, então, negocia com o único garoto que talvez consiga sair com Kat – um misterioso bad-boy com uma péssima reputação.',
'Lançado', '12', '1999', null, 'https://images.justwatch.com/poster/244110817/s718/10-coisas-que-eu-odeio-em-voce.%7Bformat%7D', 
'https://www.youtube.com/watch?v=tD76OqlJRwQ');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100007, 197012201, 'Joker', '2h2m', 
'Isolado, intimidado e desconsiderado pela sociedade, o fracassado comediante Arthur Fleck inicia seu caminho como uma mente criminosa após assassinar três homens em pleno metrô. Sua ação inicia um movimento popular contra a elite de Gotham City, da qual Thomas Wayne é seu maior representante.',
'Lançado', '16', '2019', null, 'https://upload.wikimedia.org/wikipedia/pt/6/63/Joker_%282019%29.jpg', 
'https://www.youtube.com/watch?v=jfVTJm9NilA');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100008, 197012201, 'Joker: Folie à Deux', null, 
null,
'Em produção', 'null', '2024', null, null, 
null);
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100009, 197911191, 'Moonlight', '1h51m', 
'Uma história de ligações humanas e auto-descoberta, o relato da vida de um jovem afro-americano desde a sua infância até à idade adulta, acompanhando a sua luta por encontrar um lugar no mundo à medida que cresce num bairro empobrecido de Miami. O filme é um retrato vital da vida contemporânea da comunidade afro-americana ao mesmo tempo que é uma meditação intensamente pessoal sobre identidade e uma obra revolucionária que reflecte com grande compaixão e verdades universais.',
'Lançado', '16', '2017', null, 'https://upload.wikimedia.org/wikipedia/pt/thumb/f/f3/Moonlight_%28filme%29.png/200px-Moonlight_%28filme%29.png', 
'https://www.youtube.com/watch?v=9NJj12tJzqc');
INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100010, 194311301, 'The Tree of Life', '2h19m', 
'Conta a história que aproxima o foco na relação entre pai e filho de uma família comum, e expande a ótica desta rica relação, ao longo dos séculos, desde o Big Bang até o fim dos tempos, em uma fabulosa viagem pela história da vida e seus mistérios, que culmina na busca pelo amor altruísta e o perdão.',
'Lançado', '10', '2011', null, 'https://moviesense.files.wordpress.com/2012/02/thetreeoflife4.jpg', 
'https://www.youtube.com/watch?v=RrAz1YLh8nY');
desc tb_filme;
SELECT * FROM tb_filme;
-- id do filme comeca em 100001
/* INSERT INTO tb_filme (id_filme, id_diretor, titulo_original, duracao_filme, 
sinopse_filme, situacao_filme, classificacao_filme, lancamento_filme, avaliacao, poster, trailer) VALUES
(100000, , '', '', 
'',
'', '', '', null, '', 
''); */

desc rl_filme_genero;
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100001, 401);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100001, 405);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100001, 402);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100002, 401);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100002, 407);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100002, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100002, 412);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100003, 410);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100003, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100004, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100004, 408);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100004, 412);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100004, 410);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100005, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100005, 408);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100005, 412);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100005, 407);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100005, 403);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100006, 408);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100006, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100006, 410);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100007, 407);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100007, 402);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100007, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100008, 407);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100008, 402);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100008, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100008, 413);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100009, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100010, 409);
INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100010, 404);
SELECT * FROM rl_filme_genero;
SELECT * FROM tb_genero;
select * from tb_genero where nome_genero like '%ani%';
/* INSERT INTO rl_filme_genero (id_filme, id_genero) VALUES (100000,); */

desc rl_filme_pais;
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100001, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100002, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100002, 109);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100002, 224);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100003, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100004, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100005, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100005, 224);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100006, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100007, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100007, 38);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100008, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100009, 225);
INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100010, 225);
SELECT * FROM rl_filme_pais;
/* INSERT INTO rl_filme_pais (id_filme, id_pais) VALUES (100000, ); */

desc rl_filme_idioma;
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100001, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100001, 'jpn');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100002, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100003, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100004, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100005, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100006, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100006, 'fra');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100007, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100008, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100009, 'eng');
INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (100010, 'eng');
SELECT * FROM rl_filme_idioma;
/* INSERT INTO rl_filme_idioma (id_filme, id_idioma) VALUES (,); */

INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ukt19700429', 225, 'Uma Karuna Thurman', 'F', '1970-04-29', null, 'Uma Karuna Thurman (Boston, 29 de abril de 1970) é uma atriz norte-americana vencedora de um Globo de Ouro e indicada ao Oscar. Ela ficou famosa por fazer papéis destacados nos filmes do diretor-escritor Quentin Tarantino, como Pulp Fiction, e, na sequência, as duas partes de Kill Bill. Thurman também atuou em filmes elogiados pela crítica como Dangerous Liaisons e Gattaca. Uma cresceu em Nova Iorque, sendo descrita como uma jovem estranha e introvertida. Seu nome budista não era respeitado em sua escola; referiam-se a ela como "Uma Karen".', 
'https://m.media-amazon.com/images/M/MV5BMjMxNzk1MTQyMl5BMl5BanBnXkFtZTgwMDIzMDEyMTE@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('lal19681202', 225, 'Lucy Alexis Liu', 'F', '1968-12-02', null, 'Lucy Alexis Liu é uma atriz norte-americana, filha de imigrantes chineses. É filha de Tom Liu, engenheiro civil, e Cecília Liu, bioquímica. Lucy é a segunda filha do casal, tendo como irmão John Liu. Apesar da origem chinesa, Lucy Liu cresceu num bairro italiano e diz que sofreu alienação cultural, por ter uma aparência asiática. A atriz completou a escola secundária em 1986, na Stuyvesant H.S. e estudou na Universidade de Nova Iorque por um ano, mas acabou desistindo dessa universidade e foi estudar na Universidade de Michigan, onde se formou em Línguas e Culturas Asiáticas, enquanto estudava representação, dança e técnicas vocais. As práticas orientais de Liu vai muito além da sua formação na Universidade, ela é fluente em Chinês Mandarim e pratica artes marciais indonésias, inclusive Kali Eskrima Silat (K.E.S.A), que é uma luta rude com facas e varas.', 
'https://st.depositphotos.com/1814084/1612/i/600/depositphotos_16126915-stock-photo-lucy-liu.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jac19360812', 225, 'John Arthur Carradine', 'M', '1936-12-08', '2009-06-03', 'David, nascido John Arthur Carradine, era filho do ator John Carradine, irmão de Bruce Carradine e meio-irmão de Keith Carradine e Robert Carradine. David Carradine é mais conhecido por seu personagem "Kwai Chang Caine", na série de televisão Kung Fu, produzida a partir dos anos 1970, na qual interpretava um monge Shaolin, mestre em Wushu, no Velho Oeste dos Estados Unidos. Uma cena famosa da série (que deveria ter sido estrelada por Bruce Lee, mas os produtores, ao final, não quiseram um chinês "autêntico", optando por "puxar os olhos" de Carradine) é quando Kwai Chang tatua sua pele com ferro quente. Em 2003, Carradine ganhou nova audiência quando interpretou o personagem "Bill" nos dois filmes da série Kill Bill, de Quentin Tarantino, nos quais contracena com Uma Thurman. David Carradine foi encontrado morto em 4 de junho de 2009, em um hotel de luxo em Bangkok, onde participava das filmagens de Stretch.', 
'https://prod-images.tcm.com/Master-Profile-Images/DavidCarradine.29484.2.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('dch19601203', 225, 'Daryl Christine Hannah', 'F', '1960-12-03', null, 'Daryl Christine Hannah (Chicago, 3 de dezembro de 1960) é uma atriz norte-americana de origem sueca. Após sua estreia no cinema em 1978, Hannah participou de vários filmes em Hollywood na década de 1980, entre eles Blade Runner, Splash, Wall Street, Roxanne e em 2003 apareceu em Kill Bill.[1] Em 2003, teve importante participação no vídeo "Feel" do Mega popstar da Inglaterra Robbie Williams, onde interpreta sua namorada.', 
'https://m.media-amazon.com/images/M/MV5BMjE0MjUyMzMxOF5BMl5BanBnXkFtZTcwNjEzNjI5Ng@@._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('msm19570925', 225, 'Michael Soren Madsen', 'M', '1957-09-25', null, 'Michael Soren Madsen (Chicago, 25 de Setembro de 1957) é um ator estadunidense, filho de uma poetisa, Elaine, e de um bombeiro, Cal Madsen. É irmão de Cheri e da atriz Virginia Madsen. Fez filmes importantes, como Cães de Aluguel e Kill Bill. Ele também atuou como um personagem do modo Zombies do jogo Call of Duty: Black Ops 2 no mapa Mob of the Dead.', 
'https://m.media-amazon.com/images/M/MV5BMTI4ODA5NzY2N15BMl5BanBnXkFtZTYwNjc3NTI1._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('vaf19640730', 225, 'Vivica Anjanetta Fox', 'F', '1964-07-30', null, 'Vivica Anjanetta Fox (Indianapolis, Indiana, 30 de Julho de 1964) é uma atriz, produtora e apresentadora de televisão norte-americana.Fox nasceu em South Bend, Indiana, é filha de Everlyena, uma farmacêutica, e William Fox, um administrador de escola particular. Ela é descendente de Afro-americanos e Nativos americanos. Seus pais se mudaram para os Indianapolis, Indiana, logo após seu nascimento.Vivica Fox é foi graduada na Arlington High School em Indianapolis, Indiana, e Golden West College em Huntington Beach, Califórnia, com um grau de arte associado em Ciências Sociais.', 
'https://m.media-amazon.com/images/M/MV5BMjFlYzhlYjEtYjM0ZC00ZTJmLWEwYjctMTI1ZGZjMDY3MWU4XkEyXkFqcGdeQXVyMjM2NTQxNDU@._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('sc19390123', 109, 'Shinichi Chiba', 'M', '1939-01-23', '2021-08-19', 'Shinichi Chiba, também conhecido como Sonny Chiba (Fukuoka, 23 de janeiro de 1939 − Kimitsu, 19 de agosto de 2021), foi um ator e artista marcial japonês. Foi um dos primeiros atores a atingir o estrelado devido às suas habilidades nas artes marciais, inicialmente no Japão e, posteriormente, internacionalmente.', 
'https://upload.wikimedia.org/wikipedia/commons/9/9b/Sonny_Chiba_Photo_Op_GalaxyCon_Raleigh_2019.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('xj19510822', 44, 'Xian Jinxi', 'M', '1951-08-22', null, 'Gordon Liu, nascido Xian Jinxi (Guangdong, 22 de agosto de 1951) é um ator e artista marcial chinês. Ele se tornou famoso por interpretar o papel do monge San Te no filme A 36ª Câmara de Shaolin . Também interpretou mestre de Kung Fu Pai Mei em Kill Bill: Volume 2 (2004), e Johnny Mo em Kill Bill: Volume 1 (2003), o chefe do exército pessoal de O-Ren Ishii interpretada pela atriz Lucy Liu.', 
'https://m.media-amazon.com/images/M/MV5BNjM0NzY3MDg5MF5BMl5BanBnXkFtZTcwNjkxNzAyMg@@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jd19660124', 74, 'Julie Dreyfus', 'F', '1966-01-24', null, 'Julie Dreyfus (Paris, França. 24 de Janeiro de 1966) é uma atriz francesa. É filha do empresário e produtor musical francês Francis Dreyfus com a atriz Pascale Audret. Ficou bastante conhecida para o público por suas aparições nos filmes de Quentin Tarantino, Kill Bill: Vol. 1 e Bastardos inglórios, nos quais ela interpreta Sofie Fatale e Francesca Mondino, respectivamente.', 
'https://m.media-amazon.com/images/M/MV5BMTc0ODg5MTUwMF5BMl5BanBnXkFtZTYwOTc5MDU1._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ck19841010', 109, 'Chiaki Kuriyama', 'F', '1984-10-10', null, 'Chiaki Kuriyama (栗山千明 くりやま ちあき (Kuriyama Chiaki?) (nascida em 10 de outubro de 1984),[1] é uma atriz, cantora e modelo japonesa, uma das estrelas do filme de Quentin Tarantino, Kill Bill. O rosto forte de Kuriyama também já apareceu em várias revistas conhecidas, como a norte-americana "Nylon" e a britânica e recém-extinta "The Face".', 
'https://m.media-amazon.com/images/M/MV5BMTQ4MzgwMTg5NF5BMl5BanBnXkFtZTgwMDc4MTU0MDE@._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('mp19400424', 225, 'Michael Parks', 'M', '1940-04-24', '2017-05-09', 'Michael Parks (Corona, Califórnia, 24 de abril de 1940 - Los Angeles, 9 de maio de 2017) foi um ator e cantor norte-americano que ficou famoso por interpretar o xerife Earl McGraw nos filmes de Kill Bill - A Vingança (Kill Bill: Vol. 1) (2003), À Prova de Morte (Death Proof) (2007) e Planeta Terror (Planet Terror) (2007) juntamente com o seu filho James Parks que ficou famoso por interpretar o também xerife Edgar McGraw. Em 2004, Michael Parks substitui Ricardo Montalbán no papel de Esteban Vihaio no filme: Kill Bill - A Vingança - Vol. 2 (Kill Bill: Vol. 2) (2004).', 
'https://m.media-amazon.com/images/M/MV5BNTlmM2YzYjAtOTY3Mi00NGRjLTgxZTAtZTg4MzUwNmZhODQwXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('mb19530621', 225, 'Michael Bowen', 'M', '1953-06-21', null, 'Michael Bowen (Gladewater, 21 de junho de 1957) é um ator estadunidense. Filmes em que ele apareceu, incluem Jackie Brown, Magnólia e Less than Zero. Bowen também teve um papel recorrente como Danny Pickett na série de televisão Lost.', 
'https://m.media-amazon.com/images/M/MV5BNTk0MTA2MjI3OF5BMl5BanBnXkFtZTcwNDAyMDYzOA@@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jk19551116', 109, 'Jun Kunimura', 'M', '1955-11-16', null, 'Jun Kunimura (國村 隼, Kunimura Jun, nascido Yoshihiro Yonemura (米村 喜洋, Yonemura Yoshihiro); 15 de novembro de 1955) é um ator japonês que atuou no Japão, Hollywood e Hong Kong. Ganhou Melhor Ator Coadjuvante e Popular Star Award no 37th Blue Dragon Film Awards pela sua performance no filme de terror sul-coreano The Wailing, dirijido por Na Hong-jin.', 
'https://asianwiki.com/images/a/a1/Jun_Kunimura-p1.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('co19641003', 224, 'Clive Owen', 'M', '1964-10-03', null, 'Clive Owen (Coventry, 3 de outubro de 1964) é um ator britânico, nomeado ao Oscar de Melhor Ator (coadjuvante/secundário) em 2005 pelo filme Closer. É casado desde março de 1995 com Sarah-Jane Fenton. O casal tem duas filhas, Hannah e Eve.', 
'https://m.media-amazon.com/images/M/MV5BMjA4MzAyOTc5Ml5BMl5BanBnXkFtZTcwOTQ5NzEzMg@@._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jas19601203', 225, 'Julie Anne Smith', 'F', '1960-12-03', null, 'Julianne Moore, nome artístico de Julie Anne Smith (Fayeteville, 3 de dezembro de 1960) é uma escritora e atriz norte-americana prolífica no cinema desde o início da década de 1990. É particularmente conhecida por seus retratos de mulheres emocionalmente perturbadas, e já recebeu diversos prêmios, incluindo o Óscar de Melhor Atriz por seu trabalho no filme Still Alice (2014).', 
'https://m.media-amazon.com/images/M/MV5BMTM5NDI1MjE2Ml5BMl5BanBnXkFtZTgwNDE0Nzk0MDE@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('mjm19330314', 224, 'Maurice Joseph Micklewhite', 'M', '1933-03-14', null, 'Sir Michael Caine, nascido Maurice Joseph Micklewhite (Londres, 14 de março de 1933), é um ator e produtor de cinema britânico, duas vezes vencedor do Oscar da Academia para Melhor Ator Coadjuvante (por suas atuações em Hannah and Her Sisters e The Cider House Rules) e famoso por interpretar Alfred Pennyworth, o mordomo de Bruce Wayne/Batman na trilogia de filmes de Cristopher Nolan (batman).', 
'https://m.media-amazon.com/images/M/MV5BMjAwNzIwNTQ4Ml5BMl5BanBnXkFtZTYwMzE1MTUz._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('cha19870212', 224, 'Clare-Hope Ashitey', 'F', '1987-02-12', null, 'Clare-Hope Naa K. Ashitey é uma atriz inglesa. Ela frequentou a Central Theatre Performing Arts School em Southgate enquanto continuava sua educação na Latymer School, localizada na área de Edmonton, em Londres, por sete anos. Ela fez uma pausa entre a escola e a faculdade para trabalhar no filme Children of Men. Em 2018, ela estrelou o drama policial Netflix Original, Seven Seconds.', 
'https://www.unitedagents.co.uk/sites/default/files/thumbnails/image/clarehopeslatepr44229bw.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('cue19770710', 224, 'Chiwetel Umeadi Ejiofor', 'M', '1977-07-10', null, 'Chiwetel Umeadi Ejiofor, CBE (Londres, 10 de Julho de 1977) é um ator britânico, filho de pais nigerianos, cujos antepassados eram ibos. Em 2006 recebeu duas indicações ao prêmio Golden Globe por Melhor performance. Em 2013, interpretou Solomon Northup em 12 Anos de Escravidão, pelo qual recebeu indicações ao Óscar, Globo de Ouro e Screen Actors Guild, juntamente com o BAFTA Award de Melhor Ator.', 
'https://m.media-amazon.com/images/M/MV5BNzA5MDEyMTY3Nl5BMl5BanBnXkFtZTgwODQ0MjcxMDE@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('pef19480511', 82, 'Pamela E. Ferris', 'F', '1948-05-11', null, 'Pamela E. "Pam" Ferris (Hanôver, 11 de maio de 1948) é uma atriz britânica. Nasceu na Alemanha, enquanto seu pai servia na Força Aérea Britânica naquele país. Fez a personagem Tia Guida no filme Harry Potter and the Prisoner of Azkaban. Conhecida principalmente por ter interpretado a terrível vilã Ágatha Trunchbull, no filme Matilda.', 
'https://m.media-amazon.com/images/M/MV5BMTkyOTYzMDA0OF5BMl5BanBnXkFtZTcwMjg4NTc5OA@@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('pm19591102', 224, 'Peter Mullan', 'M', '1959-11-02', null, 'Peter Mullan (2 de Novembro de 1959) é um ator e diretor escocês, conhecido por seus papéis como em "My Name Is Joe", "Braveheart" e "Trainspotting"', 
'https://m.media-amazon.com/images/M/MV5BMTA2NDUxMjIzNzVeQTJeQWpwZ15BbWU2MDU0MTk3NA@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('cmh19800410', 224, 'Charles Matthew Hunnam', 'M', '1980-04-10', null, 'Charles Matthew "Charlie" Hunnam (Newcastle, 10 de abril de 1980) é um ator, roteirista e produtor britânico. Indicado duas vezes ao Critics Choice Awards de Melhor Ator em Série Dramática por seu trabalho como Jackson "Jax" Teller na série de televisão Sons of Anarchy.', 
'https://br.web.img3.acsta.net/c_310_420/pictures/19/03/14/22/49/1143042.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('dsh19620514', 107, 'Daniel Sallis Huston', 'M', '1962-05-14', null, 'Daniel Sallis Huston (Roma, 14 de maio de 1962), mais conhecido como Danny Huston, é um ator e diretor americano.', 
'https://m.media-amazon.com/images/M/MV5BMTA1MTk4NDA0NjZeQTJeQWpwZ15BbWU3MDQ5NzIzNTk@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('mjd19510905', 225, 'Michael John Douglas', 'M', '1951-09-05', null, 'Michael Keaton, nome artístico de Michael John Douglas (Coraopolis, 5 de setembro de 1951), é um ator americano, célebre por seu papel em Beetlejuice (1988) e como Bruce Wayne / Batman em Batman (1989) e Batman Returns (1992), ambos sucessos de Tim Burton. Keaton também é conhecido pelo filme Mr. Mom (1983) e por seus trabalhos como dublador em Cars (2006) e Toy Story 3 (2010), ambas animações da Pixar. Ele interpretou o vilão Adrian Toomes / Abutre em Homem-Aranha: De Volta ao Lar (2017) e Morbius (2022).', 
'https://m.media-amazon.com/images/M/MV5BZmNiZmMzN2MtOTNkMy00YjA1LTg4NzktMWI4Njg1NzI3ODAyXkEyXkFqcGdeQXVyNzg5MzIyOA@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ehn19690818', 225, 'Edward Harrison Norton', 'M', '1969-08-18', null, 'Edward Harrison Norton (Boston, 18 de agosto de 1969) é um ator, produtor e cineasta norte-americano. Conseguiu o estrelato ao atuar em Primal Fear (1996). Norton já foi três vezes indicado ao Óscar de Melhor Ator e Melhor Ator Coadjuvante por Primal Fear, American History X e Birdman or (The Unexpected Virtue of Ignorance).', 
'https://m.media-amazon.com/images/M/MV5BMTYwNjQ5MTI1NF5BMl5BanBnXkFtZTcwMzU5MTI2Mw@@._V1_FMjpg_UX1000_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ejs19881106', 225, 'Emily Jean Stone', 'F', '1988-11-06', null, 'Emily Jean Stone (Scottsdale, 6 de novembro de 1988), conhecida como Emma Stone, é uma atriz norte-americana. Começou sua carreira como atriz-mirim, atuando em peças teatrais como The Wind in the Willows. Quando adolescente, mudou-se com sua mãe a Los Angeles e fez sua estreia na televisão em The Partridge Family (2004), um reality show que produziu apenas um episódio piloto não comercializado. Depois de pequenos papéis na televisão, a atriz debutou no cinema em Superbad (2007) e recebeu atenção positiva da mídia por seu papel em Zombieland (2009). A comédia adolescente Easy A (2010) foi o seu primeiro papel principal, pelo qual recebeu indicações ao prêmio BAFTA de Melhor Atriz em Ascensão e ao Globo de Ouro de Melhor Atriz em Comédia ou Musical.', 
'https://m.media-amazon.com/images/M/MV5BMjI4NjM1NDkyN15BMl5BanBnXkFtZTgwODgyNTY1MjE@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('new19680928', 224, 'Naomi Ellen Watts', 'F', '1968-09-28', null, 'Naomi Ellen Watts (Shoreham, 28 de setembro de 1968) é uma atriz anglo-australiana. Começou sua carreira na televisão australiana, onde apareceu em séries como Hey Dad..! (1990), Brides of Christ (1991 ), E Street (1991) e Home and Away (1991).', 
'https://m.media-amazon.com/images/M/MV5BMjIzMjY1NTA4OF5BMl5BanBnXkFtZTcwNjk3MDYwOQ@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('zkg19691001', 225, 'Zacharius Knight "Zach" Galifianakis', 'M', '1969-10-01', null, 'Zacharius Knight "Zach" Galifianakis (Wilkesboro, 1 de outubro de 1969), é um comediante e ator norte-americano, conhecido por filmes e apresentações na televisão de seu país, incluindo segmento próprio de stand-up no programa Comedy Central Presents do canal Comedy Central. Ele também é pianista. Ganhou notoriedade internacional com seu papel de Alan Garner na comédia The Hangover, o qual repetiu na sequência (The Hangover Part II), ambas dirigidas por Todd Phillips. Com esse diretor co-protagonizou Due Date (2010).', 
'https://m.media-amazon.com/images/M/MV5BMTQwNzI3NjIwMV5BMl5BanBnXkFtZTcwMzA1OTIwMw@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('alr19811120', 224, 'Andrea Louise Riseborough', 'F', '1981-11-20', null, 'Andrea Louise Riseborough (Newcastle, 20 de novembro de 1981) é uma atriz britânica. Ela é mais conhecida pelos seus papéis como Victoria Olsen em Oblivion, Svetlana Alliluyeva em A Morte de Stalin, Marilyn Barnett em A Guerra dos Sexos, recentemente Detetive Muldoon em O Grito e Leslie Rowlands em To Leslie. Por sua performance em To Leslie, recebeu aclamação da crítica especializada e foi indicada ao Oscar 2023 de Melhor Atriz.', 
'https://upload.wikimedia.org/wikipedia/commons/f/f9/Andrea_Riseborough_2012.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('abd19680503', 225, 'Amy Beth Dziewiontkowski', 'F', '1968-05-03', null, 'Amy Beth Dziewiontkowski (Queens, Nova Iorque, 3 de maio de 1969), mais conhecida como Amy Ryan, é uma atriz norte-americana. Foi indicada ao Oscar de Melhor Atriz (coadjuvante/secundária) em 2008 por seu trabalho em Medo da Verdade, trabalho que lhe recebeu diversos prêmios da crítica.[3] Também atua no teatro e na televisão.', 
'https://m.media-amazon.com/images/M/MV5BMTY0MTcwMzM0Nl5BMl5BanBnXkFtZTcwODIyMjM3NA@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('lvd19501107', 224, 'Lindsay Vere Duncan', 'F', '1950-11-07', null, 'Lindsay Vere Duncan (Edimburgo, 7 de novembro de 1950) é uma atriz escocesa conhecida por seus diversos trabalhos na televisão. A atriz já foi também agraciada com o Tony Award por seu desempenho na peça Private Lives.', 
'https://m.media-amazon.com/images/M/MV5BMTYwNTkxOTQzMV5BMl5BanBnXkFtZTcwODQ3ODIyOA@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('mcw19800811', 225, 'Merritt Carmen Wever', 'F', '1980-08-11', null, 'Merritt Carmen Wever (Nova Iorque, 11 de agosto de 1980) é uma atriz norte-americana. Ela é mais conhecida por seu papel como a jovem enfermeira Zoey Barkow em Nurse Jackie, pelo qual ela ganhou o Emmy Awards de Melhor Atriz Coadjuvante em Série de Comédia, em 2013. Também ficou conhecida por seu papel como Denise Cloyd em The Walking Dead, da AMC. Em 2018, ganhou seu segundo Emmy Awards, na categoria de Melhor Atriz Coadjuvante em Minissérie ou Telefilme, por Godless.', 
'https://m.media-amazon.com/images/M/MV5BMjIyMTY1OTAwMF5BMl5BanBnXkFtZTcwNTI5OTM0NA@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jrb19741028', 174, 'Joaquin Rafael Bottom', 'M', '1974-10-28', null, 'Joaquin Rafael Phoenix, nascido Joaquin Rafael Bottom (San Juan, 28 de outubro de 1974) é um ator, produtor e ativista norte-americano. Por seu trabalho como ator, Phoenix recebeu um Grammy, dois Globo de Ouro e quatro indicações ao Óscar, vencendo como melhor ator na cerimônia de 2020 por sua atuação em Joker (2019).', 
'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Joaquin_Phoenix_in_2018.jpg/1200px-Joaquin_Phoenix_in_2018.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('sij19841122', 225, 'Scarlett Ingrid Johansson', 'F', '1984-11-22', null, 'Scarlett Ingrid Johansson (Nova Iorque, 22 de novembro de 1984) é uma atriz e cantora norte-americana. Foi uma das atrizes mais bem pagas de 2014 a 2016, com múltiplas aparições na revista Forbes Celebrity 100 e tem uma estrela na Calçada da Fama. Nascida e criada em Manhattan, Nova Iorque, ela desejava ser atriz desde criança e apareceu pela primeira vez em um palco de um teatro em uma peça Off-Broadway. Johansson fez o seu filme de estreia na comédia North (1994) e foi indicada ao Independent Spirit Awards por Manny & Lo (1996). Ela ganhou muito reconhecimento pelos seus trabalhos em O Encantador de Cavalos (1998) e Ghost World (2001).', 
'https://upload.wikimedia.org/wikipedia/commons/6/60/Scarlett_Johansson_by_Gage_Skidmore_2_%28cropped%29.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ala19740820', 107, 'Amy Lou Adams', 'F', '1974-08-20', null, 'Amy Lou Adams (Vicenza, 20 de agosto de 1974) é uma atriz e cantora estadunidense, nascida na Itália. Começou sua carreira no palco em teatros antes de fazer sua estreia no cinema em 1999 no filme de comédia de humor negro Drop Dead Gorgeous. Conhecida por papéis cômicos e dramáticos, ela apareceu três vezes no ranking anual das atrizes mais bem pagas do mundo. Seus elogios incluem dois Golden Globe Awards, além de indicações para seis oscars e sete BAFTAS.', 
'https://upload.wikimedia.org/wikipedia/commons/1/12/Amy_Adams_UK_Nocturnal_Animals_Premiere_%28cropped%29.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('prm19850417', 225, 'Patricia Rooney Mara', 'F', '1985-04-17', null, 'Patricia Rooney Mara (Bedford, 17 de abril de 1985) é atriz norte-americana de cinema e televisão indicada duas vezes para o Oscares e para os Globos de Ouro. Mara fez sua estreia no cinema em 2005 e passou por filmes e séries de TV, incluindo o remake do filme de terror A Nightmare on Elm Street (1984) e The Social Network (2010). Mara interpretou Lisbeth Salander, o personagem-título na versão 2011 do filme The Girl with the Dragon Tattoo, o primeiro dos três filmes da Sony Pictures baseado nos livros Millennium, de Stieg Larsson. Ela recebeu a aclamação da crítica e ganhou sua primeira nomeação ao Oscar de Melhor Atriz e um Globo de Ouro de Melhor Atriz em Filme - Drama. Em 2015, venceu o prêmio de Melhor Atriz no Festival de Cannes e também foi indicada novamente, em 2016, ao Oscar, Globo de Ouro, SAG Awards e Bafta por seu desempenho em Carol.', 
'https://images.mubicdn.net/images/cast_member/63707/cache-398701-1601455915/image-w856.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('cmp19790621', 225, 'Christopher Michael Pratt', 'M', '1979-06-21', null, 'Christopher Michael Pratt (Virginia, Minnesota, 21 de junho de 1979) é um ator norte-americano. É mais conhecido por interpretar Peter Quill na franquia Guardians of the Galaxy, e Owen Grady no filme Jurassic World. Em 2015 foi considerado um dos 100 modelos mais influentes do mundo pela revista Time.', 
'https://m.media-amazon.com/images/M/MV5BZjdkYjg1NzMtOTY2YS00ZWI1LWEwZWYtOTU1YTM2ODA2ZWY5XkEyXkFqcGdeQXVyMTM1MjAxMDc3._V1_FMjpg_UX1000_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ojc19840310', 225, 'Olivia Jane Cockburn', 'F', '1984-03-10', null, 'Olivia Jane Cockburn (Nova Iorque, 10 de março de 1984), conhecida como Olivia Wilde, é atriz, modelo, produtora, diretora e ativista norte-americana com origem irlandesa.', 
'https://upload.wikimedia.org/wikipedia/commons/e/e0/Olivia_Wilde_crop.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ml19700626', 225, 'Matthew Letscher', 'M', '1970-06-26', null, 'Matthew Letscher (Grosse Pointe, 26 de junho de 1970) é um ator e dramaturgo americano, conhecido por interpretar Eobard Thawne (Flash Reverso) nas séries The Flash e Legends of Tomorrow.', 
'https://m.media-amazon.com/images/M/MV5BMjMzMzkyMDUzMl5BMl5BanBnXkFtZTgwNTc0MTEyMDE@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ly19750818', 225, 'Luka Yovetich', 'M', '1975-08-18', null, 'Luka Yovetich (18 de Agosto, 1975), mais conhecido como Luka Jones, é um ator e comediante norte-americano, reconhecido pelos seus papeis nas sitcoms da NBC, Best Friends Forever e Up All Night.', 
'https://www.themoviedb.org/t/p/w500/x2C6I1GJDwI7NV43XySiKgL4JaO.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('pd19880622', 225, 'Portia Doubleday', 'F', '1988-06-22', null, 'Portia Doubleday (Los Angeles, 22 de junho de 1988) é uma atriz norte-americana, mais conhecida pela sua participação nos filmes Youth in Revolt (2009) como Sheeni Saunders, em Big Mommas: Like Father, Like Son (2011) como Jasmine Lee e atualmente como Angela Moss na série Mr. Robot.', 
'https://m.media-amazon.com/images/M/MV5BMTM4OTI2MTEwOV5BMl5BanBnXkFtZTcwMDc1MDc0Mw@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jjs19800118', 225, 'Jason Jordan Segel', 'M', '1980-01-18', null, 'Jason Jordan Segel (Los Angeles, 18 de janeiro de 1980) é um ator, roteirista (argumentista) e músico norte-americano. Conhecido pelo seu trabalho em How I Met Your Mother como Marshall Eriksen e em sua parceria com o produtor Judd Apatow na curta série de televisão Freaks and Geeks e em Undeclared, e pelos filmes Forgetting Sarah Marshall, Knocked Up, e I Love You, Man.', 
'https://m.media-amazon.com/images/M/MV5BMTUwNzcxNzM1Nl5BMl5BanBnXkFtZTgwNzA5NzU4MjE@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('crrj19360818', 225, 'Charles Robert Redford Jr.', 'M', '1936-08-18', null, 'Charles Robert Redford Jr. (Santa Mônica, 18 de agosto de 1936) é um ator, cineasta e produtor estadunidense, atuante principalmente nas décadas de 1960 e 1970, quando era considerado um dos maiores sex symbols masculinos do cinema americano.', 
'https://m.media-amazon.com/images/M/MV5BMTk1Nzc5MzQyMV5BMl5BanBnXkFtZTcwNjQ5OTA0Mg@@._V1_UY1200_CR117,0,630,1200_AL_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jlp19880402', 225, 'Jesse Lon Plemons', 'M', '1988-04-02', null, 'Jesse Lon Plemons (Dallas, 2 de abril de 1988) é um ator americano. Ele é conhecido por interpretar Todd em Breaking Bad e Landry Clarke em Friday Night Lights.', 
'https://flxt.tmsimg.com/assets/256802_v9_bb.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('rec19490503', 225, 'Ronald Ellis Canada', 'M', '1949-05-03', null, 'Ronald Ellis Canada (3 de Maio de 1949) é um ator norte-americano especializado em atuar como juízes e detetives. Mais conhecido por suas atuaçõs em One on One (2001–2004), The Shield (2003–2004), e Lone Star (1996).', 
'https://upload.wikimedia.org/wikipedia/commons/e/eb/Ron_Canada.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('drk19890529', 225, 'Danielle Riley Keough', 'F', '1989-05-29', null, 'Danielle Riley Keough (nascida em 29 de maio de 1989) é uma atriz, modelo, produtora e diretora americana, conhecida principalmente por ser a protagonista da série Daisy Jones & The Six, além de suas aparições em filmes independentes. Nasceu em Santa Monica, Califórnia, filha dos músicos Lisa Marie Presley e Danny Keough. Keough foi criada principalmente por seu pai no Havaí e em Los Angeles e, adicionalmente, passou um tempo morando com sua mãe na Califórnia e no Tennessee. Aos 15 anos, ela começou a modelar, incluindo aparições em desfiles de moda da Dolce & Gabbana e Christian Dior, bem como aparecendo na capa da Vogue.', 
'https://upload.wikimedia.org/wikipedia/commons/9/94/Riley_Keough_Cannes_2016_%282%29.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jos19810328', 225, 'Julia OHara Stiles', 'F', '1981-03-28', null, 'Julia OHara Stiles (Nova Iorque, 28 de março de 1981) é uma atriz americana que alcançou a fama ao protagonizar os filmes adolescentes 10 Things I Hate About You (1999), Down to You (2000) e Save the Last Dance (2001). Outros trabalhos mais notáveis são The Business of Strangers (2001), a série Bourne (2002–16), O Sorriso de Mona Lisa (2003), The Prince and Me (2004) e The Omen (2006). Em 2010, teve um papel recorrente na quinta temporada de Dexter. De 2012 a 2014, protagonizou a websérie Blue, também transmitida pela televisão.', 
'https://m.media-amazon.com/images/M/MV5BMTgxNjUxNDk3MF5BMl5BanBnXkFtZTcwMzM0NjA0NA@@._V1_FMjpg_UX1000_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('hal19790404', 14, 'Heathcliff Andrew Ledger', 'M', '1979-04-04', '2008-01-22', 'Heathcliff Andrew "Heath" Ledger (Perth, 4 de abril de 1979 — Nova Iorque, 22 de janeiro de 2008) foi um ator australiano. Venceu o Oscar de Melhor Ator Secundário pela sua atuação como Coringa, em O Cavaleiro Das Trevas, de Christopher Nolan.', 
'https://m.media-amazon.com/images/M/MV5BMTI2NTY0NzA4MF5BMl5BanBnXkFtZTYwMjE1MDE0._V1_FMjpg_UX1000_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('lro19810607', 225, 'Larisa Romanovna Oleynik', 'F', '1981-06-07', null, 'Larisa Romanovna Oleynik (Condado de Santa Clara, 7 de junho de 1981) é uma atriz estadunidense. Ela é conhecida por estrelar o papel-título da série de televisão infantil [O Mundo Secreto de Alex Mack] em meados dos anos 90. Ela também apareceu em filmes teatrais, incluindo The Baby-Sitters Club e 10 coisas que eu odeio sobre você. Durante seu período como ídolo teen, ela foi descrita como "uma das crianças de 15 anos favoritas da América", e "o proverbial girl next door".', 
'https://m.media-amazon.com/images/M/MV5BZDAzODRlMGQtZGE1Mi00NDVmLWJhOGMtOWI0MWMxNDg5NDE3XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jlgl19810217', 225, 'Joseph Leonard Gordon-Levitt', 'M', '1981-02-17', null, 'Joseph Leonard Gordon-Levitt (Los Angeles, 17 de fevereiro de 1981) é um ator, diretor, produtor e roteirista norte-americano. Ele recebeu vários elogios, incluindo indicações ao Globo de Ouro de Melhor Ator em Filme Musical ou Comédia por suas atuações principais em (500) Dias com Ela (2009) e 50% (2011). Ele é o fundador da plataforma de mídia online HitRecord, cujos projetos como HitRecord on TV (2014–15) e Create Together (2020) lhe renderam dois Prêmios Emmy do Primetime na categoria de Melhor Programa Interativo.', 
'https://m.media-amazon.com/images/M/MV5BMTY3NTk0NDI3Ml5BMl5BanBnXkFtZTgwNDA3NjY0MjE@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('dk19780515', 225, 'David Krumholtz', 'M', '1978-05-15', null, 'David Krumholtz (Nova York, 15 de maio de 1978) é um ator americano conhecido por interpretar o professor Charlie Eppes na série de televisão Numb3rs e Seth Goldstein no filme Harold & Kumar Go to White Castle e suas duas continuações, Harold & Kumar Escape from Guantanamo Bay e A Very Harold & Kumar 3D Christmas. Também se destacou como Bernard the Arch-Elf em The Santa Clause e sua continuação The Santa Clause 2, além de "Mr. Universo" no filme Serenity e Michael em 10 Things I Hate About You.', 
'https://m.media-amazon.com/images/M/MV5BYjk4MGExMjktYjg2OS00NjYzLWExYmEtZTZjOWQyZTUxMWU2XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ljlm19531015', 225, 'Lawrence John "Larry" Miller', 'M', '1953-10-15', null, 'Lawrence John "Larry" Miller (15 de outubro de 1953) é um ator, comediante, dublador, escritor, podcaster e colunista americano. Conhecido por papéis coadjuvantes, interpretou muitos tipos arrogantes, gananciosos e bajuladores.', 
'https://m.media-amazon.com/images/M/MV5BMTg4NzQxOTMwOF5BMl5BanBnXkFtZTcwNDc3NDIzMQ@@._V1_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('smp19740208', 225, 'Susan May Pratt', 'F', '1974-02-08', null, 'Susan May Pratt (8 de Fevereiro de 1974) é uma atriz norte-americana. Atuou em 10 Things I Hate About You, Drive Me Crazy e Center Stage.', 
'https://m.media-amazon.com/images/M/MV5BMTE5OTQzNTAxMl5BMl5BanBnXkFtZTYwNzUyNzcy._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('gmu19721029', 225, 'Gabrielle Monique Union', 'F', '1972-10-29', null, 'Gabrielle Union começou sua carreira na década de 1990 em papéis menores. Seu primeiro teste foi para "Saved by the Bell".Outros papéis anteriores incluem os filmes adolescentes como 10 Things I Hate About You, Shes All That, e Love & Basketball.  Em 1997, Union apareceu no episódio da sexta temporada de Star Trek: Deep Space Nine como Klingon NGaren. Ela também atuou na serie Sister, Sister como Vanessa, em Smart Guy como Denise, e em cinco episódios de 7th Heaven como Keesha Hamilton.', 
'https://m.media-amazon.com/images/M/MV5BMTkwNjUzMDM2Nl5BMl5BanBnXkFtZTcwNDgyMDY4Mg@@._V1_FMjpg_UX1000_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('akh19790129', 225, 'Andrew Keegan Heying', 'M', '1979-01-29', null, 'Andrew Keegan Heying (Los Angeles, 29 de janeiro, 1979) é um ator e produtor estadunidense. Ele é mais conhecido por seu papel de Joey Donner no filme 10 Things I Hate About You.', 
'https://m.media-amazon.com/images/M/MV5BMjJlMTRhMzYtNmE3OC00YjZmLTg2NmMtMjhjOTc2NTE0MjUzXkEyXkFqcGdeQXVyMTY5ODc2OTU@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('wbp19631218', 225, 'William Bradley Pitt', 'M', '1963-12-18', null, 'William Bradley Pitt (Shawnee, 18 de dezembro de 1963) mais conhecido como Brad Pitt, é um ator e produtor americano. É vencedor de diversos prêmios, dentre os quais um Oscar, dois Globos de Ouro, dois Screen Actors Guild e um BAFTA por atuação, e um Oscar, um BAFTA e um Emmy como produtor; é citado um dos mais bem pagos atores de Hollywood.', 
'https://images.mubicdn.net/images/cast_member/2552/cache-207-1524922850/image-w856.jpg?size=800x'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('sjp19600817', 225, 'Sean Justin Penn', 'M', '1960-08-17', null, 'Sean Justin Penn (Santa Mônica, 17 de agosto de 1960) é um ator, produtor, diretor de cinema e roteirista norte-americano, duas vezes vencedor do Oscar de Melhor Ator.', 
'https://m.media-amazon.com/images/M/MV5BMTc1NjMzMjY3NF5BMl5BanBnXkFtZTcwMzkxNjQzMg@@._V1_FMjpg_UX1000_.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jmc19770324', 225, 'Jessica Michelle Chastain', 'F', '1977-03-24', null, 'Jessica Michelle Chastain (Sacramento, 24 de março de 1977) é uma atriz, profissional de dublagem e produtora norte-americana. Chastain nasceu e cresceu no norte da Califórnia, desenvolvendo desde cedo um interesse pela atuação. Ela estreou profissionalmente no teatro em 1998 como Julieta em uma produção de Romeu e Julieta. Estudou atuação na Escola Juilliard e depois disso assinou um contrato com o produtor televisivo John Wells. Chastain fez aparições coadjuvantes em diversas séries de televisão, incluindo ER e Law & Order: Trial by Jury. Ela também participou de produções teatrais de O Jardim das Cerejeiras e Salomé.', 
'https://m.media-amazon.com/images/M/MV5BMTU1MDM5NjczOF5BMl5BanBnXkFtZTcwOTY2MDE4OA@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('hm00000001', 225, 'Hunter McCracken', 'M', null, null, 'Hunter McCracken é conhecido pelo seu trabalho em A Árvore da Vida (2011) e Exploring The Tree of Life (2011).', 
'https://m.media-amazon.com/images/M/MV5BYzYyMjUyZjUtM2M3MS00ZWI4LThiZWQtYjUxZmFkOTY5M2U3XkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('le00000001', 225, 'Laramie Eppler', 'M', null, null, null, 
'https://images.mubicdn.net/images/cast_member/311206/cache-207836-1489468587/image-w856.jpg?size=800x'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('tks19961111', 225, 'Tye Kayle Sheridan', 'M', '1996-11-11', null, 'Tye Kayle Sheridan (Elkhart, 11 de novembro de 1996) é um ator americano mais conhecido por interpretar Steve no filme A Árvore da Vida, Ciclope em X-Men: Apocalipse e Wade Watts em Ready Player One.', 
'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Tye_Sheridan_by_Gage_Skidmore_3.jpg/640px-Tye_Sheridan_by_Gage_Skidmore_3.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('tr19900210', 225, 'Trevante Rhodes', 'M', '1990-02-10', null, 'Trevante Rhodes (Ponchatoula, 10 de fevereiro de 1990) é um ator e atleta estado-unidense.', 
'https://m.media-amazon.com/images/M/MV5BMzAwNDEyNTc3MV5BMl5BanBnXkFtZTgwNTEzMzc1MTI@._V1_FMjpg_UX1000_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ah1979-12-28', 225, 'André Holland', 'M', '1979-12-28', null, 'André Holland (Bessemer, 28 de dezembro de 1979) é um ator americano. Ele venceu o Satellite Award de melhor elenco por The Knick em 2014.', 
'https://upload.wikimedia.org/wikipedia/commons/4/4f/Andre_Holland_in_2019_%28cropped%29.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jmr19851201', 225, 'Janelle Monáe Robinson', 'NB', '1985-12-01', null, 'Janelle Monáe Robinson (Kansas, 1 de Dezembro de 1985) é uma cantora, compositora, bailarina e atriz estadunidense. Monaé tem oito indicações ao Grammy.', 
'https://hips.hearstapps.com/hmg-prod/images/gettyimages-1388313387.jpg');
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('as19951024', 225, 'Ashton Sanders', 'M', '1995-10-24', null, 'Ashton Sanders (Carson, 24 de outubro de 1995), é um ator estadunidense. Tornou-se mais conhecido por atuar nos filmes The Retrieval e Moonlight.', 
'https://m.media-amazon.com/images/M/MV5BMTcxNTExNDIwOF5BMl5BanBnXkFtZTgwNTU2NzYwMTI@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jj19971009', 225, 'Jharrel Jerome', 'M', '1997-10-09', null, 'Jharrel Jerome (Bronx, 9 de outubro de 1997) é um ator norte-americano, conhecido por interpretar Kevin no filme Moonlight (2016), de Barry Jenkins, e Korey Wise, na série When They See Us (2019), da Netflix.', 
'https://m.media-amazon.com/images/M/MV5BMTYwMTc0MjM5M15BMl5BanBnXkFtZTgwNDA0OTc4MzI@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('arh20040704', 225, 'Alex R. Hibbert', 'M', '2004-07-04', null, 'Alex R. Hibbert é um ator americano conhecido por Moonlight (2016), Black Panther (2018) e The Chi (2018).', 
'https://flxt.tmsimg.com/assets/992868_v9_bb.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('jp20040928', 225, 'Jaden Piner', 'M', '2004-09-28', null, 'Jaden Piner é conhecido pelo seu trabalho em Moonlight: Sob a Luz do Luar (2016), Brincadeira Mortal (2018) e Feral State (2020).', 
'https://m.media-amazon.com/images/M/MV5BZGFkODE1NGQtYTZmNC00NDllLWExZjgtOWU5M2IyYjVjNWEyXkEyXkFqcGdeQXVyNTkwNDUyODc@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('nmh19760906', 224, 'Naomie Melanie Harris', 'F', '1976-09-06', null, 'Naomie Melanie Harris (Londres, 6 de setembro de 1976) é uma atriz britânica, indicada ao Oscar de Melhor Atriz Coadjuvante pelo aclamado papel de Paula no filme Moonlight. É mais conhecida pelo filme 28 Days Later, pela personagem Tia Dalma em Pirates of the Caribbean: Dead Mans Chest e At Worlds End, e como Miss Moneypenny da franquia do espião britânico James Bond desde 2012.', 
'https://flxt.tmsimg.com/assets/265396_v9_bb.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('mg19740216', 225, 'Mahershalalhashbaz Gilmore', 'M', '1974-02-16', null, 'Mahershala Ali (nascido Mahershalalhashbaz Gilmore; Oakland, 16 de fevereiro de 1974) é um ator, produtor e rapper norte-americano.', 
'https://m.media-amazon.com/images/M/MV5BZThiZjJjNWYtNGRlYS00NDdkLTk0MTMtYjEwYzM1MDExNTYwXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('ranj19430817', 225, 'Robert Anthony De Niro Jr.', 'M', '1943-08-17', null, 'Robert Anthony De Niro Jr. (Nova Iorque, 17 de agosto de 1943) é um ator, produtor e cineasta ítalo-americano. Conhecido por suas parcerias com o cineasta Martin Scorsese, ele já recebeu diversos prêmios, incluindo dois Oscars, um Globo de Ouro, o Prêmio Cecil B. DeMille e um prêmio Screen Actors Guild Life Achievement. Em 2009, De Niro recebeu o Prêmio Kennedy e ganhou a Medalha Presidencial da Liberdade do ex-presidente Barack Obama em 2016.', 
'https://cdn.britannica.com/00/213300-050-ADF31CD9/American-actor-Robert-De-Niro-2019.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('zob19910601', 82, 'Zazie Olivia Beetz', 'F', '1991-06-01', null, 'Zazie Olivia Beetz (Berlim, 1 de junho de 1991) é uma atriz teuto-americana, mais conhecida por seu papel como Vanessa "Van" Keefer no FX série de comédia dramática Atlanta, que a rendeu uma indicação para o Primetime Emmy Award de Melhor Atriz Coadjuvante em série de comédia. Ela também esteve no elenco de Easy, série da Netflix. No cinema, Beetz estrelou como Dana no filme de ação Geostorm (2017) e como a personagem Dominó no filme Deadpool 2 (2018), da Marvel.', 
'https://upload.wikimedia.org/wikipedia/commons/6/66/Zazie_Beetz_by_Gage_Skidmore_%28cropped%29.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('flc19530315', 225, 'Frances Lilianne Conroy', 'F', '1953-03-15', null, 'Frances Hardman Conroy (Monroe, 13 de novembro de 1953) é uma atriz estadunidense.', 
'https://m.media-amazon.com/images/M/MV5BMTM4OTIzMTg5MF5BMl5BanBnXkFtZTYwNjA5OTIz._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('pbc19560826', 225, 'Peter Brett Cullen', 'M', '1956-08-26', null, 'Peter Brett Cullen (nascido a 26 de agosto de 1956) é um ator norte-americano que aparece em numerosos filmes e séries de televisão.', 
'https://m.media-amazon.com/images/M/MV5BMTI0NzI0MzU1M15BMl5BanBnXkFtZTcwMjM0Mjg3MQ@@._V1_.jpg'); 
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('sjag19860328', 225, 'Stefani Joanne Angelina Germanotta', 'F', '1986-03-28', null, 'Stefani Joanne Angelina Germanotta (Nova Iorque, 28 de março de 1986), mais conhecida pelo nome artístico Lady Gaga, é uma cantora, compositora, instrumentista, atriz, produtora musical e empresária estadunidense.', 
'https://br.web.img2.acsta.net/pictures/18/09/12/19/42/5521101.jpg'); 
SELECT * FROM tb_elenco;
select * from tb_pais where nome_pais like '%ja%'; 
-- delete from tb_elenco where id_elenco = '1960-08-17';
/* -- id elenco sao as iniciais do nome + dt nasc 'YYYY-MM-DD'
-- se nao houver dt nasc = iniciais00000001
INSERT INTO tb_elenco (id_elenco, id_pais, nome_elenco, genero, dt_nasc_elenco, falecimento, biografia, foto) VALUES 
('', , '', 'FM', '', null, '', 
''); 
*/

INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'ukt19700429', 'Beatrix Kiddo / Mamba Negra/ A Noiva');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'lal19681202', 'O-Ren Ishii / Boca de Algodão');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'jac19360812', 'Bill / Encantador de Cobras');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'dch19601203', 'Elle Driver / Cobra Californiana');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'msm19570925', 'Budd / Cascavel');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'vaf19640730', 'Vernita Green / Cabeça de Cobre / Jeannie Bell');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'sc19390123', 'Hattori Hanzō');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'xj19510822', 'Johnny Mo / Pai Mei');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'jd19660124', 'Sofie Fatale');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'ck19841010', 'Gogo Yubari');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'mp19400424', 'Earl McGraw / Esteban Vihaio');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'mb19530621', 'Buck');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100001, 'jk19551116', 'Boss Tanaka');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'co19641003', 'Thelonius "Theo" Faron');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'jas19601203', 'Julian Taylor');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'mjm19330314', 'Jasper Palmer');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'cha19870212', 'Kee');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'cue19770710', 'Luke');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'pef19480511', 'Miriam');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'pm19591102', 'Syd');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'cmh19800410', 'Patric');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100002, 'dsh19620514', 'Nigel');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'mjd19510905', 'Riggan Thomson');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'ehn19690818', 'Mike Shiner');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'ejs19881106', 'Sam Thomson');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'new19680928', 'Lesley');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'zkg19691001', 'Jake');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'alr19811120', 'Laura');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'abd19680503', 'Sylvia Thomson');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'lvd19501107', 'Tabitha Dickinson');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100003, 'mcw19800811', 'Annie');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'jrb19741028', 'Theodore Twombly');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'ala19740820', 'Amy');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'prm19850417', 'Catherine');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'ojc19840310', 'Blind Date');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'sij19841122', 'Samantha (voz)');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'cmp19790621', 'Paul');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'ml19700626', 'Charles');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'ly19750818', 'Mark Lewman');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100004, 'pd19880622', 'Surrogate Date Isabella');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100005, 'prm19850417', 'Isla');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100005, 'jjs19800118', 'Will Harbor');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100005, 'jlp19880402', 'Toby Harbor');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100005, 'drk19890529', 'Lacey');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100005, 'crrj19360818', 'Thomas Harbor');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100005, 'rec19490503', 'Cooper');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'hal19790404', 'Patrick Verona');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'jos19810328', 'Kat Stratford');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'lro19810607', 'Bianca Stratford');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'jlgl19810217', 'Cameron James');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'dk19780515', 'Michael Willians');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'ljlm19531015', 'Walter Stratford');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'smp19740208', 'Mandella Johsonn');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'gmu19721029', 'Chastity Thexas');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100006, 'akh19790129', 'Joey Donner');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100007, 'jrb19741028', 'Arthur Fleck/Coringa');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100007, 'ranj19430817', 'Murray Franklin');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100007, 'zob19910601', 'Sophie Dumond');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100007, 'flc19530315', 'Penny Fleck');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100007, 'pbc19560826', 'Thomas Wayne');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100008, 'jrb19741028', 'Arthur Fleck/Coringa');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100008, 'zob19910601', 'Sophie Dumond');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100008, 'sjag19860328', 'Harleen Quinzel/Harley Quinn');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'tr19900210', 'Chiron / "Black"');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'as19951024', 'Chiron (adolescente)');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'arh20040704', 'Chiron / "Little" (criança)');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'ah1979-12-28', 'Kevin');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'jj19971009', 'Kevin (adolescente)');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'jp20040928', 'Kevin (criança)');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'jmr19851201', 'Teresa');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'nmh19760906', 'Paula');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100009, 'mg19740216', 'Juan');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100010, 'wbp19631218', 'Sr. OBrien');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100010, 'sjp19600817', 'Jack');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100010, 'jmc19770324', 'Sra. OBrian');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100010, 'hm00000001', 'jovem Jack');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100010, 'le00000001', 'R.L.');
INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (100010, 'tks19961111', 'Steve');
SELECT * FROM tb_atuacao;
/* INSERT INTO tb_atuacao (id_filme, id_elenco, nome_personagem) VALUES (, '', ''); */

desc tb_login;
INSERT INTO tb_login (email, senha) VALUES ('isaura_brady@gmail.com', '9d8aak1g');
INSERT INTO tb_login (email, senha) VALUES ('dharma2496@gmail.com', '4erlfqdq');
INSERT INTO tb_login (email, senha) VALUES ('dennis9481@gmail.com', '90c37dw4');
INSERT INTO tb_login (email, senha) VALUES ('isahh008@gmail.com', '9dytmsb7');
INSERT INTO tb_login (email, senha) VALUES ('rochdi3742@gmail.com', '3x6vlsww');
SELECT * FROM tb_login;
-- delete from tb_login where email = 'dmitrij9151@gmail.com';
/* INSERT INTO tb_login (email, senha) VALUES ('@gmail.com', ''); */

desc tb_conta;
INSERT INTO tb_conta (email, nome, usuario, dt_nasc_conta) VALUES ('isaura_brady@gmail.com', 'Isaura Brady', 'isaura_brady', '1998-02-14');
INSERT INTO tb_conta (email, nome, usuario, dt_nasc_conta) VALUES ('dharma2496@gmail.com', 'Keith Dharma', 'dharma', '2002-01-27');
INSERT INTO tb_conta (email, nome, usuario, dt_nasc_conta) VALUES ('dennis9481@gmail.com', 'Dennis Figueiredo', 'dennis007', '2007-12-07');
INSERT INTO tb_conta (email, nome, usuario, dt_nasc_conta) VALUES ('isahh008@gmail.com', 'Isabela Holanda', 'isabel724', '1992-07-24');
INSERT INTO tb_conta (email, nome, usuario, dt_nasc_conta) VALUES ('rochdi3742@gmail.com', 'Diana Roch', 'rochdi', '1998-09-18');
SELECT * FROM tb_conta;
/* INSERT INTO tb_conta (email, nome, usuario, dt_nasc_conta) VALUES ('@gmail.com', '', '', '1998-09-18'); */ 

show tables;
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('isaura_brady@gmail.com', '100002');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('isaura_brady@gmail.com', '100004');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('isaura_brady@gmail.com', '100007');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('dharma2496@gmail.com', '100002');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('dharma2496@gmail.com', '100004');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('dharma2496@gmail.com', '100005');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('dharma2496@gmail.com', '100007');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('dharma2496@gmail.com', '100008');
INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('rochdi3742@gmail.com', '100003');
SELECT * FROM tb_assistir_depois;
/* INSERT INTO tb_assistir_depois (email, id_filme) VALUES ('@gmail.com', '100000'); */ 

INSERT INTO tb_assistidos (email, id_filme) VALUES ('isahh008@gmail.com', '100001');
INSERT INTO tb_assistidos (email, id_filme) VALUES ('isahh008@gmail.com', '100002');
INSERT INTO tb_assistidos (email, id_filme) VALUES ('isahh008@gmail.com', '100003');
INSERT INTO tb_assistidos (email, id_filme) VALUES ('isahh008@gmail.com', '100004');
INSERT INTO tb_assistidos (email, id_filme) VALUES ('rochdi3742@gmail.com', '100006');
INSERT INTO tb_assistidos (email, id_filme) VALUES ('dharma2496@gmail.com', '100002');
/* INSERT INTO tb_assistidos (email, id_filme) VALUES ('@gmail.com', '100000'); */
SELECT * FROM tb_assistidos;

INSERT INTO tb_favoritos (email, id_filme) VALUES ('rochdi3742@gmail.com', '100006');
INSERT INTO tb_favoritos (email, id_filme) VALUES ('isahh008@gmail.com', '100003');
/* INSERT INTO tb_favoritos (email, id_filme) VALUES ('@gmail.com', '100000'); */
SELECT * FROM tb_favoritos;

desc tb_forum; 
INSERT INTO tb_forum (id_forum, email, id_filme, comentario, data_comentario) 
VALUES ('dharma1', 'dharma2496@gmail.com', '100002', 'Filme incrível! Roteiro e direção impecáveis. Recomendado.', now());
INSERT INTO tb_forum (id_forum, email, id_filme, comentario, data_comentario) VALUES ('isabel7241', 'isahh008@gmail.com', '100003', 
'TOP 1 melhores filmes que já assisti. Uma das maiores obras, mas super incompreendível :(', '2022-09-12');
select * from tb_conta;
-- nome de usuario + numero em ordem crescente
/* INSERT INTO tb_forum (id_forum, email, id_filme, comentario, data_comentario) VALUES ('', '', '', '', ''); */
SELECT * FROM tb_forum;
select * from tb_filme;

-- SELECTS COUNT, SUM, MAX, MIN, AVG 
	-- generos dos filmes
-- mostrar a pessoa com maior idade no banco
-- mostrar a pessoa com menos idade no banco
-- mostrar filmes de 2022 no banco
-- mostrar filme mais antigo no banco
-- nome do filme/ator/personagem (talvez diretor
-- filmes que uma pessoa participou e nome do personagem
-- filme e idioma 
-- SE O FILME ESTIVER EM PRODUCAO, NAO COLOCAR NA TABELA ASSISTIDOS E FAVORITOS/DEIXAR VALORES NULL
-- ver os filmes salvos de um usuario somente

-- SELECTS
-- elenco todo de um filme com nome dos personagens
SELECT f.titulo_original, e.nome_elenco, a.nome_personagem
FROM tb_atuacao      as a
INNER JOIN tb_filme  as f on a.id_filme = f.id_filme
INNER JOIN tb_elenco as e on a.id_elenco = e.id_elenco
WHERE f.titulo_original like '%moonlight%';

-- todos os filmes com todos os personagens/elenco
SELECT f.titulo_original, e.nome_elenco, a.nome_personagem
FROM tb_atuacao      as a
INNER JOIN tb_filme  as f on a.id_filme = f.id_filme
INNER JOIN tb_elenco as e on a.id_elenco = e.id_elenco;

-- filme e pais de origem
SELECT titulo_original as filme, nome_pais as pais
FROM rl_filme_pais as rl
INNER JOIN tb_filme as f on rl.id_filme = f.id_filme
INNER JOIN tb_pais as p on rl.id_pais = p.id_pais;

-- filmes que um ator participou
select e.id_elenco, e.nome_elenco as 'ator/atriz', a.nome_personagem as personagem, f.titulo_original as filme
from tb_atuacao      as a
inner join tb_elenco as e on a.id_elenco = e.id_elenco
inner join tb_filme  as f on a.id_filme = f.id_filme
where nome_elenco like '%joa%';

-- filmes de classificacao 16, etc
SELECT titulo_original, classificacao_filme
FROM tb_filme
WHERE classificacao_filme = '16';

-- filmes em producao
SELECT titulo_original, lancamento_filme, situacao_filme
FROM tb_filme
WHERE situacao_filme = 'Em produção';

-- filmes lancados antes de 2000
SELECT titulo_original as filme, lancamento_filme as ano
FROM tb_filme
WHERE lancamento_filme < 2000;

-- filmes lancados depois de 2000
SELECT titulo_original as filme, lancamento_filme as ano
FROM tb_filme
WHERE lancamento_filme > 2020;
select * from tb_filme;


SELECT count(nome_elenco) as 'qtd de atores registrados'
FROM tb_elenco;

SELECT count(usuario) as 'qtd de usuarios registrados'
FROM tb_conta;

SELECT count(titulo_original) as 'qtd de filmes registrados'
FROM tb_filme;

-- todos os filmes de um mesmo diretor
SELECT f.titulo_original as filme, d.nome_diretor as diretor
FROM tb_diretor as d
INNER JOIN tb_filme as f on d.id_diretor = f.id_diretor
WHERE d.nome_diretor like '%todd%';

-- filmes com todos os seus generos
SELECT f.titulo_original as 'filmes', group_concat(' ', g.nome_genero) as generos
FROM rl_filme_genero as rl
inner join tb_filme as f on rl.id_filme = f.id_filme
inner join tb_genero as g on rl.id_genero = g.id_genero
group by f.titulo_original
order by f.titulo_original;

-- assistir depois
SELECT  l.email, c.usuario, c.nome, group_concat(' ', titulo_original) as 'filmes - assistir depois'
from tb_login            as l
inner join tb_conta      as c on l.email = c.email
inner join tb_assistir_depois as ad on l.email = ad.email
inner join tb_filme      as f on ad.id_filme = f.id_filme
group by l.email
order by l.email;
select * from tb_assistir_depois;

-- assistidos
SELECT  l.email, c.usuario, c.nome, group_concat(' ', titulo_original) as 'filmes - assistidos'
from tb_login              as l
inner join tb_conta        as c on l.email = c.email
inner join tb_assistidos   as a on l.email = a.email
inner join tb_filme        as f on a.id_filme = f.id_filme
group by l.email
order by l.email;
select * from tb_assistidos;

-- favoritos
SELECT  l.email, c.usuario, c.nome, group_concat(' ', titulo_original) as 'filmes - favoritos'
from tb_login            as l
inner join tb_conta      as c on l.email = c.email
inner join tb_favoritos  as fav on l.email = fav.email
inner join tb_filme      as f on fav.id_filme = f.id_filme
group by l.email
order by l.email;
select * from tb_favoritos;

-- filmes e seus diretores
SELECT d.id_diretor, d.nome_diretor as diretor, group_concat(' ', f.titulo_original) as filmes
FROM tb_diretor as d
INNER JOIN tb_filme as f on d.id_diretor = f.id_diretor
GROUP BY d.id_diretor;
desc tb_diretor;

--                         idade dos atores vivos
SELECT nome_elenco, date_format(dt_nasc_elenco, '%d/%m/%Y') as data_nascimento,
       timestampdiff(YEAR, dt_nasc_elenco, curdate()) as idade
FROM tb_elenco
WHERE falecimento is null;

--                               QUANTIDADE DE FILMES DE CADA GENERO
SELECT filme401 as 'qtd filmes ação', filme402 as 'qtd filmes crime', filme403 as 'qtd filmes mistério', 
filme404 as 'qtd filmes fantasia', filme405 as 'qtd filmes aventura'
FROM(SELECT 1 as x, count(id_genero) as filme401
from rl_filme_genero WHERE id_genero = 401) a
INNER JOIN (SELECT 1 as x, count(id_genero) as filme402
from rl_filme_genero WHERE id_genero = 402) b
INNER JOIN (SELECT 1 as x, count(id_genero) as filme403
from rl_filme_genero WHERE id_genero = 403) c
INNER JOIN (SELECT 1 as x, count(id_genero) as filme404
from rl_filme_genero WHERE id_genero = 404) d
INNER JOIN (SELECT 1 as x, count(id_genero) as filme405
from rl_filme_genero WHERE id_genero = 405) e
ON a.x = b.x = c.x = d.x = e.x;
select * from tb_genero;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- VIEWS:
-- 1. filmes que contenham comedia no genero
CREATE VIEW  filmes_comedia as
SELECT f.titulo_original as 'filmes de comedia', 
       group_concat(g.nome_genero) as genero
FROM rl_filme_genero as rl
inner join tb_filme as f on rl.id_filme = f.id_filme
inner join tb_genero as g on rl.id_genero = g.id_genero
 WHERE rl.id_genero =  410
 OR    f.id_filme in  
( SELECT rl.id_filme
FROM rl_filme_genero as rl
inner join tb_filme as f on rl.id_filme = f.id_filme
inner join tb_genero as g on rl.id_genero = g.id_genero
 WHERE rl.id_genero =  410)
 group by f.titulo_original;
 
select * from filmes_comedia;

-- 2. artistas registrados que faleceram e a idade que tinham
CREATE VIEW artistas_falecidos as
SELECT nome_elenco as 'artistas que faleceram', falecimento, dt_nasc_elenco as data_nascimento,
       timestampdiff(YEAR, dt_nasc_elenco, falecimento) as idade
FROM tb_elenco
WHERE falecimento is not null;

select * from artistas_falecidos;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- FUNCTION
-- 1. mostrar qtd de filmes de um genero especifico
delimiter %%
	drop function if exists qtd_genero_filme %%
    create function qtd_genero_filme(id_genero int) returns int
    deterministic
    begin
		declare qtd int;
		SELECT count(rl.id_genero) into qtd
			FROM rl_filme_genero as rl
			INNER JOIN tb_filme  as f on rl.id_filme = f.id_filme
			INNER JOIN tb_genero as g on rl.id_genero = g.id_genero
			WHERE rl.id_genero = id_genero;
        RETURN qtd;    
    end %%
delimiter ;

select nome_genero , qtd_genero_filme(id_genero) as quantidade
 from tb_genero;

-- 2. qtd de artistas registrados (elenco e diretores)
delimiter $$
	drop function if exists qtd_artistas_registrados $$
    create function qtd_artistas_registrados() returns int
    deterministic
    begin
		declare qtd1 int;
        declare qtd2 int;
        select count(nome_elenco) into qtd1
        from tb_elenco;
        select count(nome_diretor) into qtd2
		from tb_diretor;
        return qtd1 + qtd2;
    end $$
delimiter ;

select qtd_artistas_registrados() as 'pessoas registradas';

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- TRIGGER
-- 1. log de registro de contas criadas; toda vez que der insert em tb_conta, colocar o log em outra tabela (criar tabela)
delimiter $$
  drop trigger if exists tr_conta $$  
  create trigger tr_conta after insert on tb_conta
  for each row
  begin
     insert into log_conta (data_criacao, ocorrencia, email, nome, usuario, dt_nasc_conta)
     values (now(), 'criação de conta', new.email, new.nome, new.usuario, new.dt_nasc_conta);
  end $$
delimiter ;

insert into tb_login (email, senha) values ('josealmeida@gmail.com', '2::@*!!1');
insert into tb_login (email, senha) values ('marcelaalencar@gmail.com', '092^_51');
insert into tb_login (email, senha) values ('isabelamedeiros@gmail.com', '8(+|7<]=');

insert into tb_conta (email, nome, usuario, dt_nasc_conta) values ('josealmeida@gmail.com', 'Jose Almeida', 'jose.a', '1989-09-27');
insert into tb_conta (email, nome, usuario, dt_nasc_conta) values ('marcelaalencar@gmail.com', 'Marcela Alencar', 'marlencar', '2003-04-15');
insert into tb_conta (email, nome, usuario, dt_nasc_conta) values ('isabelamedeiros@gmail.com', 'isabela medeiros', 'isaaxzh', '2012-01-31');

select * from tb_conta;
select * from log_conta;
desc tb_conta;

-- 2. adicionar em log_login toda vez que der update na senha da tabela tb_login
delimiter $$
  drop trigger if exists tr_senha $$  
  create trigger tr_senha after update on tb_login
  for each row
  begin
     insert into log_login (data_mudanca, ocorrencia, email, senha) values 
        (now(), 'update dados antigos', old.email, old.senha),     
        (now(), 'insert nova senha', new.email, new.senha);
  end $$
delimiter ;  

 update tb_login
 set senha = '1;?9}5^%'
 where email = 'dennis9481@gmail.com';

select * from tb_login;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- PROCEDURE:
-- 1. inserir dados na tabela tb_assistidos
delimiter $$ 
drop procedure if exists add_assistidos $$
create procedure add_assistidos (pessoa varchar(100), id int)
begin
	set autocommit = false;
	start transaction;
		insert into tb_assistidos (email, id_filme) values (pessoa, id);
        commit;
	set autocommit = true;
end $$
delimiter ;

call add_assistidos('marcelaalencar@gmail.com', '100003');
call add_assistidos('marcelaalencar@gmail.com', '100005');
call add_assistidos('marcelaalencar@gmail.com', '100009');
select * from tb_conta;
select * from tb_filme;
select * from tb_assistidos;

-- 2. deletar registro da tb_assistir_depois
delimiter @
drop procedure if exists del_assistir @
create procedure del_assistir(pessoa varchar(100), id int)
begin
	set autocommit = false;
    start transaction;
		delete from tb_assistir_depois where pessoa = email and id = id_filme;
    commit;
    set autocommit = true;
end @
delimiter ;
call del_assistir('dharma2496@gmail.com', '100007');

select * from tb_assistir_depois;