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
    escritura varchar(400)
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
    data_estudo date default (current_date),
    usuario_id int,
    questao_id int,
    constraint fk_estudos_usuarios foreign key (usuario_id) references usuarios (id) on delete cascade,
    constraint fk_estudos_questoes foreign key (questao_id) references questoes (id) on delete cascade
);

insert into usuarios (nome, email, senha, data_cadastro, streak, ultima_atividade) values
('Dev Teste', 'teste@faithforge.com', 'senha_123', '2026-01-15 10:00:00', 12, '2026-04-20');

insert into questoes (titulo, categoria, dificuldade, resumo, resposta, escritura) values
('O Problema do Mal', 'Filosofia', 'Avançado', 'Como um Deus todo-bom e todo-poderoso pode permitir que o sofrimento e o mal existam no mundo?', null, 'Romanos 8:18 "Considero que os nossos sofrimentos atuais não podem ser comparados com a glória que em nós será revelada."'),
('Jesus ressuscitou dos mortos?', 'História', 'Intermediário', 'Quais são as evidências históricas da ressurreição corporal de Jesus Cristo?', null, '1 Coríntios 15:3-4 "³ Pois o que primeiramente lhes transmiti foi o que recebi: que Cristo morreu pelos nossos pecados, segundo as Escrituras,
⁴ foi sepultado e ressuscitou ao terceiro dia, segundo as Escrituras,"'),
('A ciência pode refutar a existência de Deus?', 'Ciência', 'Intermediário', 'A ciência e a fé estão em conflito, ou apontam para a mesma realidade última?', null, 'Salmo 19:1 "Os céus declaram a glória de Deus; o firmamento proclama a obra das suas mãos"'),
('A Bíblia é historicamente confiável?', 'História', 'Fundação', 'Podemos confiar no Antigo e no Novo Testamento como documentos históricos precisos?', null, '2 Timótio 3:16 "Toda a Escritura é inspirada por Deus e útil para o ensino, para a repreensão, para a correção e para a instrução na justiça,"'),
('Deus existe? O Argumento Cosmológico', 'Filosofia', 'Avançado', 'O Argumento Cosmológico de Kalam apresenta uma argumentação lógica a favor da existência de um Criador.', null, 'Gênesis 1:1 "No princípio Deus criou os céus e a terra."'),
('O Argumento Moral a Favor de Deus', 'Filosofia', 'Avançado', 'Os valores morais objetivos apontam para um legislador moral transcendente, além das convenções humanas.', null, 'Romanos 2:14-15 "¹⁴ ( De fato, quando os gentios, que não têm a lei, praticam naturalmente o que ela ordena, tornam-se lei para si mesmos, embora não possuam a lei;
¹⁵ pois mostram que as exigências da lei estão gravadas em seus corações. Disso dão testemunho também a consciência e os pensamentos deles, ora acusando-os, ora defendendo-os. )"'),
('E quanto às outras religiões?', 'Filosofia', 'Intermediário', 'O cristianismo é exclusivista? Como devemos lidar com a afirmação de que todas as religiões conduzem a Deus?', null, 'João 14:6 "Respondeu Jesus: "Eu sou o caminho, a verdade e a vida. Ninguém vem ao Pai, a não ser por mim."'),
('O ajuste fino do universo', 'Ciência', 'Avançado', 'A calibração precisa das constantes cósmicas sugere um projeto intencional, e não o acaso.', null, 'Isaías 45:18 "Pois assim diz o Senhor, que criou os céus, ele é Deus; que moldou a terra e a fez, ele a fundou; ele não a criou para estar vazia, mas a formou para ser habitada; ele diz: "Eu sou o Senhor, e não há nenhum outro."'),
('A fé se opõe à razão?', 'Filosofia', 'Fundação', 'A fé bíblica não é uma crença cega, mas uma confiança fundamentada, baseada em evidências e na revelação.', null, '1 Pedro 3:15 "Antes, santifiquem Cristo como Senhor no coração. Estejam sempre preparados para responder a qualquer que lhes pedir a razão da esperança que há em vocês."'),
('O Argumento da Consciência', 'Filosofia', 'Avançado', 'É extremamente difícil explicar a existência da consciência subjetiva sem recorrer a uma mente divina.', null, 'Gênesis 2:7 "Então o Senhor Deus formou o homem do pó da terra e soprou em suas narinas o fôlego de vida, e o homem se tornou um ser vivente."'),
('A violência no Antigo Testamento e o caráter de Deus', 'Escritura', 'Avançado', 'Como conciliamos o Deus do Antigo Testamento com o Deus do amor revelado em Cristo?', null, 'Hebreus 1:1-2 "¹ Há muito tempo Deus falou muitas vezes e de várias maneiras aos nossos antepassados por meio dos profetas,
² mas nestes últimos dias falou-nos por meio do Filho, a quem constituiu herdeiro de todas as coisas e por meio de quem fez o universo."'),
('O Argumento Ontológico', 'Filosofia', 'Avançado', 'O argumento modal de Anselmo defende que a existência de Deus é logicamente necessária, e não contingente.', null, 'Êxodo 3:14 "Disse Deus a Moisés: "Eu Sou o que Sou. É isto que você dirá aos israelitas: Eu Sou me enviou a vocês"."');

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
(1, 1, 4.0, '2026-01-20'),
(1, 1, 6.5, '2026-02-15'),
(1, 1, 9.5, '2026-04-18'),
(1, 4, 7.0, '2026-02-10'),
(1, 4, 10.0, '2026-03-05'),
(1, 5, 3.5, '2026-01-25'),
(1, 5, 8.0, '2026-04-20'),
(1, 2, 9.0, '2026-03-12'),
(1, 8, 6.0, '2026-04-10'),
(1, 8, 7.0, '2026-05-07');

-- Respostas das Questões

UPDATE questoes
SET resposta = 'Uma das críticas mais comuns ao cristianismo é a ideia de que a fé exige abandonar o pensamento racional uma espécie de "salto no escuro" intelectual. Essa imagem, porém, não corresponde à fé cristã bíblica.
 
A palavra grega pistis, traduzida como "fé", carrega o sentido de confiança fundamentada em evidências, e não de crença irracional. O apóstolo Paulo, ao escrever aos cristãos de Roma, afirma que as próprias obras da criação já tornam Deus cognoscível pela razão (Romanos 1:20). Jesus, por sua vez, ao ser questionado sobre os milagres que realizava, apelou repetidamente às evidências: "crede por causa das obras" (João 14:11).
 
A tradição cristã sempre valorizou o diálogo entre fé e razão. Agostinho de Hipona afirmou que devemos crer para compreender, mas também compreender para crer melhor. Tomás de Aquino sistematizou a compatibilidade entre a teologia e a filosofia. João Paulo II, na encíclica Fides et Ratio (1998), declarou que fé e razão são como "duas asas pelas quais o espírito humano se eleva para a contemplação da verdade."
 
A fé cristã não pede que o crente silencie sua mente, mas que a use com honestidade intelectual, reconhecendo os limites do conhecimento humano e permanecendo aberto às evidências que apontam para além do puramente material.
 
Aplicação: Examinar as razões para crer é um ato de amor a Deus "com toda a tua mente" (Mateus 22:37). A busca honesta pela verdade nunca é inimiga da fé genuína.'
WHERE titulo = 'A fé se opõe à razão?';
 
UPDATE questoes
SET resposta = 'O argumento ontológico é uma tentativa de demonstrar a existência de Deus por meio da lógica pura, sem recorrer à observação do mundo físico. Foi formulado no século XI pelo filósofo e teólogo Anselmo de Cantuária e desenvolvido, em versão moderna, pelo filósofo Alvin Plantinga.
 
Anselmo partiu de uma definição: Deus é "aquilo do qual nada maior pode ser concebido." Se Deus existisse apenas como conceito na mente, sem existência real, poderíamos conceber algo ainda maior um ser que, além de ser concebível, também existisse. Portanto, negar a existência real de Deus seria logicamente contraditório com a própria definição do que Ele é.
 
Plantinga reformulou o argumento em termos de "mundos possíveis": se um ser maximamente grandioso onipotente, onisciente e moralmente perfeito é de fato possível (e não há razão lógica para ser impossível), então ele necessariamente existe em todos os mundos possíveis, incluindo o nosso. A lógica modal mostra que necessidade de existência é parte do conceito de um ser verdadeiramente máximo.
 
O argumento não convence a todos, mas sua força está em revelar que o próprio conceito de Deus é único: ao contrário de outras coisas, Deus é o único ser cuja essência implica a existência. Existir não lhe é acidental é constitutivo do que Ele é.
 
Aplicação: Refletir sobre a grandeza infinita de Deus não é apenas exercício filosófico; é um convite à adoração de um ser que, por natureza, nunca poderia não existir.'
WHERE titulo = 'O Argumento Ontológico';
 
UPDATE questoes
SET resposta = 'Por que existe algo em vez de nada? Essa pergunta, simples na forma mas profunda no alcance, está no centro do argumento cosmológico para a existência de Deus.
 
O argumento pode ser formulado assim: tudo o que começa a existir tem uma causa. O universo começou a existir como indica a própria cosmologia moderna com o modelo do Big Bang. Portanto, o universo tem uma causa. Essa causa, para ser suficiente, precisaria ser atemporal, aespacial, imaterial e imensamente poderosa características que correspondem ao que as tradições teístas chamam de Deus.
 
O filósofo árabe Al-Kindi e, mais tarde, Tomás de Aquino desenvolveram versões desse raciocínio. Na forma contemporânea, o filósofo William Lane Craig o popularizou como o "Argumento Cosmológico de Kalam." A lógica é rigorosa: se o universo tem início, ele não pode ser sua própria causa algo eterno e exterior a ele deve tê-lo originado.
 
Objeta-se que essa causa poderia ser eterna sem ser pessoal. Porém, para que um universo temporal surja de uma causa eterna, é preciso uma decisão algo que implica agência e, portanto, personalidade.
 
Aplicação: O universo proclama, pela sua própria existência, que há um Criador. Contemplar o cosmos com gratidão é reconhecer que fomos colocados aqui por uma Causa que também é Presença.'
WHERE titulo = 'Deus existe? O Argumento Cosmológico';
 
UPDATE questoes
SET resposta = 'Imagine ajustar os parâmetros de uma balança com uma precisão tão extrema que qualquer variação de uma parte em um trilhão destruiria o resultado. É isso que os físicos encontraram ao estudar as constantes fundamentais do universo.
 
As leis da física a força gravitacional, a constante cosmológica, a razão entre as massas do elétron e do próton estão calibradas com uma precisão extraordinária. Se qualquer uma dessas constantes fosse minimamente diferente, estrelas não se formariam, carbonos não existiriam, e a vida seria impossível. O astrofísico Fred Hoyle, ele próprio agnóstico, confessou que "o universo parece ter sido preparado por alguém que sabia que estava criando vida."
 
Esse conjunto de evidências é chamado de "ajuste fino" (fine-tuning) e constitui um dos mais poderosos argumentos teológicos no campo da ciência contemporânea. O filósofo Robin Collins argumenta que a probabilidade de essas constantes surgirem por acaso é astronomicamente improvável muito mais convincente é a hipótese de um Projetista inteligente.
 
A alternativa materialista o "multiverso", a ideia de que existem infinitos universos com parâmetros aleatórios é especulativa e não testável. A navalha de Occam sugere que a hipótese mais simples é a de um Criador que agiu com propósito.
 
Aplicação: Cada detalhe do cosmos reflete cuidado intencional. O Deus que calibrou as constantes do universo é o mesmo que conhece o número de cabelos em nossa cabeça (Lucas 12:7).'
WHERE titulo = 'O ajuste fino do universo';
 
UPDATE questoes
SET resposta = 'Toda cultura humana, em qualquer época ou lugar, reconhece distinções morais básicas: crueldade gratuita é errada, sacrifício pelo outro é louvável, trair a confiança de um inocente é uma injustiça. O argumento moral pergunta: de onde vem essa percepção universal?
 
Conforme articulado pelo filósofo William Lane Craig, o argumento tem uma estrutura simples: se Deus não existe, não existem valores morais objetivos apenas preferências subjetivas moldadas pela evolução ou pela cultura. Se valores morais objetivos existem, então Deus existe. E eles existem: torturar crianças por prazer é objetivamente errado, independentemente do que qualquer cultura ou época pense a respeito.
 
Toda vez que argumentamos sobre o certo e o errado, apelamos para uma lei superior da qual todos estão conscientes, à qual aderem e não são livres para mudar arbitrariamente. Se há uma lei moral universal, ela exige um Legislador universal que transcende a humanidade.
 
O ateísmo pode explicar por que sentimos que algo é errado (biologia evolutiva, coesão social), mas não pode explicar por que de fato é errado. Sem um padrão objetivo transcendente, a moralidade se reduz a opinião coletiva e toda atrocidade histórica pode ser relativizada.
 
Aplicação: A indignação moral diante de uma injustiça é, no fundo, um eco da imagem de Deus em nós (Gênesis 1:27). Ouvir essa voz com atenção é um passo em direção ao próprio Deus.'
WHERE titulo = 'O Argumento Moral a Favor de Deus';
 
UPDATE questoes
SET resposta = '"Se Deus existe e é bom, por que há tanto sofrimento?" Essa é, provavelmente, a objeção mais emocional e mais séria dirigida ao teísmo cristão. Ignorá-la seria desonestidade intelectual.
 
O filósofo Alvin Plantinga oferece a resposta mais desenvolvida com a "Defesa do Livre-Arbítrio": para que seres genuinamente capazes de amar existam, eles precisam ser livres e liberdade real inclui a possibilidade de escolher o mal. Um mundo de robôs programados para o bem não seria um mundo de amor. Deus, ao criar seres livres, aceitou o risco do mal moral como condição necessária para a existência do amor genuíno.
 
O mal natural terremotos, doenças, morte também exige resposta. A visão cristã entende que vivemos num mundo afetado pela ruptura original com Deus (Gênesis 3), e que o sofrimento, embora real e doloroso, pode ser redimido. A Bíblia não ignora a dor: o livro de Jó é inteiramente dedicado a ela. E a resposta última de Deus não é uma explicação filosófica, mas uma presença: a encarnação e a cruz de Jesus mostram um Deus que entra no sofrimento humano.
 
Aplicação: A pergunta "por que Deus permite isso?" é legítima e merece ser feita a Ele diretamente, como Jó fez. Deus não tem medo das nossas perguntas e sua resposta é muitas vezes uma presença, não um argumento.'
WHERE titulo = 'O Problema do Mal';
 
UPDATE questoes
SET resposta = 'Por que existe experiência subjetiva? Por que há "algo que é ser" um ser humano um interior, uma perspectiva em primeira pessoa, o vermelho que você vê, a dor que você sente? Esse fenômeno, chamado de "consciência" ou "qualia", é um dos maiores enigmas da filosofia da mente.
 
A visão materialista de que a consciência é apenas o resultado de processos neuroquímicos enfrenta o que o filósofo David Chalmers chamou de "problema difícil da consciência": mesmo que descrevêssemos completamente o funcionamento do cérebro, não teríamos explicado por que há experiência subjetiva. A matéria, por si mesma, não explica a experiência interna.
 
A visão cristã oferece uma resposta coerente: os seres humanos são feitos à imagem de um Deus que é, Ele mesmo, um Ser pessoal e consciente (Gênesis 1:26-27). A consciência não é um subproduto acidental da evolução é o reflexo, em criaturas finitas, da natureza pessoal do Criador.
 
Além disso, a Bíblia fala de uma consciência moral (Romanos 2:15) que atua como voz interior capaz de acusar ou justificar. Essa capacidade de autojulgamento moral aponta para uma origem que transcende a biologia.
 
Aplicação: A vida interior pensamentos, emoções, consciência não é ruído aleatório. É o espaço onde Deus nos convida ao encontro pessoal com Ele.'
WHERE titulo = 'O Argumento da Consciência';
 
UPDATE questoes
SET resposta = 'A ciência é uma das maiores conquistas da humanidade, capaz de descrever o funcionamento do universo com precisão extraordinária. Mas ela pode provar ou refutar a existência de Deus? A resposta honesta é: não.
 
A ciência opera metodologicamente dentro do universo físico mede, testa e descreve fenômenos naturais. A pergunta sobre a existência de Deus, porém, é uma questão metafísica: trata da origem e do fundamento do próprio sistema que a ciência estuda. Usar a ciência para negar Deus seria como usar uma régua para medir a temperatura é o instrumento errado para a pergunta.
 
Alguns argumentam que cada fenômeno antes atribuído a Deus agora tem explicação natural. Mas isso confunde dois níveis de explicação. Saber como o universo funciona não responde por que ele existe. A cosmologia descreve o Big Bang; não explica por que há algo em vez de nada, nem quem estabeleceu as leis que permitiram o Big Bang.
 
Muitos dos maiores cientistas da história Newton, Mendel, Faraday, Francis Collins eram crentes convictos, justamente porque a investigação científica os conduzia à admiração diante de uma ordem que parecia intencional.
 
Aplicação: A ciência e a fé não são inimigas são parceiras na busca pela verdade. O universo que a ciência descreve é o mesmo que a fé proclama ser uma criação.'
WHERE titulo = 'A ciência pode refutar a existência de Deus?';
 
UPDATE questoes
SET resposta = 'A ressurreição de Jesus é o coração do cristianismo. O apóstolo Paulo foi direto: "se Cristo não ressuscitou, vã é a nossa fé" (1 Coríntios 15:14). Mas há razões históricas sólidas para levar esse evento a sério?
 
Os historiadores incluindo os não cristãos em geral aceitam quatro fatos como bem documentados: (1) Jesus morreu por crucificação sob Pôncio Pilatos; (2) o túmulo foi encontrado vazio no terceiro dia; (3) múltiplos indivíduos e grupos afirmaram ter visto Jesus vivo após a morte; (4) os discípulos passaram de fugitivos apavorados a mártires convictos dispostos a morrer por esse testemunho.
 
O historiador Gary Habermas cataloga centenas de estudiosos contemporâneos que analisaram esses dados. Teorias alternativas como o "desmaio" de Jesus na cruz, o roubo do corpo ou as "alucinações coletivas" enfrentam obstáculos históricos e científicos sérios.
 
A melhor explicação para o conjunto dos fatos continua sendo a que os primeiros cristãos apresentaram: Jesus ressuscitou. Esse evento não é apenas um milagre isolado é a validação da identidade de Jesus e a garantia de que a morte não tem a última palavra.
 
Aplicação: A ressurreição não é apenas um artigo de fé do passado é a promessa de que toda dor, perda e morte encontrará, no fim, a resposta de Deus.'
WHERE titulo = 'Jesus ressuscitou dos mortos?';
 
UPDATE questoes
SET resposta = 'Pode-se confiar na Bíblia como documento histórico? Essa pergunta merece uma investigação séria, pois as afirmações bíblicas especialmente sobre Jesus têm implicações profundas.
 
O Novo Testamento é, do ponto de vista documental, o texto mais bem atestado da Antiguidade. Há mais de 5.800 manuscritos gregos do NT, alguns datando de apenas décadas após os originais. Em comparação, a Ilíada de Homero conta com cerca de 2.000 cópias, e obras de Júlio César têm apenas uma dezena ainda assim, ninguém as questiona seriamente.
 
Arqueólogos confirmaram repetidamente detalhes dos Evangelhos: o Pool de Betesda (João 5), o Tribunal de Pilatos, a existência do sumo sacerdote Caifás (confirmada por um ossuário encontrado em 1990), entre outros. O historiador romano Tácito e o historiador judeu Flávio Josefo mencionam Jesus independentemente das fontes cristãs.
 
Os Evangelhos foram escritos por pessoas que viveram na época dos eventos narrados ou entrevistaram testemunhas oculares dentro da janela em que erros factuais seriam corrigidos por contemporâneos.
 
Aplicação: A Bíblia não pede fé cega; ela convida à investigação. Aproximar-se dela como um documento sério é o primeiro passo para descobrir que ela fala com autoridade sobre o que mais importa.'
WHERE titulo = 'A Bíblia é historicamente confiável?';
 
UPDATE questoes
SET resposta = 'Guerras de extermínio, sacrifícios, punições severas o Antigo Testamento contém passagens que desconcertam leitores modernos e são frequentemente usadas como objeção ao caráter de Deus. Como entendê-las?
 
A chave está em dois princípios fundamentais: a pedagogia divina e o papel de Deus como Juiz soberano.
 
A revelação bíblica é progressiva. Deus não entregou um manual jurídico atemporal a um povo primitivo; Ele se revelou gradualmente, educando uma nação dentro das categorias culturais do segundo milênio antes de Cristo. O que parece severo à luz do século XXI era, muitas vezes, um avanço ético significativo em relação às práticas dos povos vizinhos por exemplo, a legislação israelita protegia escravos, viúvas e estrangeiros de maneiras incomuns para a época.
 
Além disso, os juízos mais radicais como a destruição de Canaã envolvem Deus agindo como Juiz soberano sobre nações que haviam atingido um nível extremo de corrupção moral, incluindo o sacrifício de crianças. A Bíblia deixa claro que Israel também seria julgado com igual severidade quando pecasse.
 
O Antigo Testamento prepara o terreno para Cristo, que revela o caráter de Deus em sua plenitude: não a supressão da justiça, mas a reconciliação da justiça com a misericórdia na cruz.
 
Aplicação: Ler o AT com paciência e contexto histórico não diminui a autoridade de Deus revela um Criador que leva o mal a sério enquanto trabalha, pacientemente, para restaurar a humanidade.'
WHERE titulo = 'A violência no Antigo Testamento e o caráter de Deus';
 
UPDATE questoes
SET resposta = '"Por que o cristianismo e não o islamismo, o budismo ou o hinduísmo?" Essa é uma pergunta legítima que merece uma resposta respeitosa e honesta.
 
O ponto de partida cristão não é a afirmação de que todas as outras religiões estão completamente erradas muitas refletem aspirações genuínas da humanidade por transcendência, sentido e moral. C. S. Lewis chamava esses elementos de "raios de luz" que apontam, ainda que imperfeitamente, para a Fonte.
 
O que torna o cristianismo singular é uma afirmação específica e verificável: a encarnação e a ressurreição de Jesus Cristo. Budismo e confucionismo são sistemas éticos sem um Deus pessoal. O islamismo afirma que Jesus era profeta, mas nega a ressurreição. O hinduísmo dissolve a personalidade divina no impessoal. Apenas o cristianismo afirma que Deus entrou pessoalmente na história humana, viveu, morreu e ressuscitou e isso pode ser investigado historicamente.
 
A questão, portanto, não é "qual religião parece mais bonita ou consoladora?" mas "qual afirmação é verdadeira?" E a verdade se verifica por evidências históricas, filosóficas e existenciais um processo que o cristianismo sempre incentivou.
 
Aplicação: Respeitar o sincero buscador de outra tradição não significa relativizar a verdade. O cristão pode dialogar com humildade, confiante de que a verdade sendo de Deus não tem o que temer da investigação honesta.'
WHERE titulo = 'E quanto às outras religiões?';