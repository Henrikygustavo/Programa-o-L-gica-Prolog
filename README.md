# Programação Lógica

**Desenvolvido por**: [@GustavoVerdi](https://github.com/GustavoVerdi/) e [@Henrikygustavo](https://github.com/Henrikygustavo/)

Este repositório contém uma série de sistemas desenvolvidos utilizando a linguagem de programação Prolog. Cada sistema é projetado para resolver problemas específicos com base em um conjunto de regras de inferência, permitindo fazer diagnósticos e recomendações em diferentes áreas, como saúde, veículos, livros, treinos de academia e investigação criminal.

## 1. Diagnóstico Médico ##
O sistema especialista em diagnóstico médico tem como objetivo sugerir diagnósticos médicos com base em sintomas fornecidos pelo usuário. Ao responder a perguntas sobre sintomas como febre, dor de cabeça, tosse e outros, o sistema é capaz de sugerir doenças possíveis com base nas regras pré-definidas.

**Funcionalidades:**

Base de dados de sintomas e doenças. <br>
Regras que associam sintomas a doenças. <br>
Perguntas interativas ao usuário para coletar os sintomas. <br>
Sugestão de possíveis diagnósticos com base nas respostas do usuário. <br>
Exemplos de regras:

```prolog
doenca(gripe) :- febre, tosse, cansaço.
doenca(infeccao_viral) :- febre, dor_de_garganta, dor_muscular.
```

## 2. Análise de Problemas de Veículos ##
Este sistema especialista ajuda a diagnosticar problemas comuns em veículos com base em sintomas e comportamentos relatados pelos usuários. O usuário pode informar se o motor não liga, se há barulho estranho ao frear, ou se há vazamento de óleo, e o sistema sugerirá possíveis soluções e recomendações.

Funcionalidades:
Base de dados de problemas e sintomas relacionados a veículos.
Regras para associar sintomas a problemas específicos no veículo.
Perguntas sobre os sintomas e situações relatadas pelo usuário.
Sugestões de ações corretivas, como verificar a bateria ou os freios.
Exemplos de regras:

```prolog
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
```

## 3. Recomendações de Livros ##
O sistema especialista de recomendações de livros sugere livros com base nos gêneros e interesses fornecidos pelo usuário. O usuário pode escolher múltiplos gêneros e interesses, e o sistema retorna uma lista de livros recomendados, incluindo título, gênero e uma breve sinopse.

Funcionalidades:
Base de dados de livros categorizados por gênero e interesses.
Regras para recomendar livros com base nas preferências do usuário.
Permite ao usuário selecionar múltiplos gêneros e interesses.
Exibe detalhes dos livros recomendados, como título, gênero e sinopse.
Exemplos de regras:

```prolog
recomendar('1984') :- genero(ficcao), interesse(politica).
recomendar('Sapiens') :- genero(historia), interesse(ciencia).
```

## 4. Recomendação de Treinos de Academia ##
Este sistema sugere planos de treino para a academia baseados nos objetivos do usuário, como perder peso, ganhar massa muscular ou melhorar o condicionamento físico. O usuário também informa seu nível de experiência na academia e a disponibilidade de tempo para treinar.

Funcionalidades:
Base de dados com tipos de treino para diferentes objetivos.
Regras que associam os objetivos do usuário a planos de treino.
Perguntas sobre o objetivo do usuário, sua experiência e tempo disponível.
Recomendações detalhadas de treino, incluindo séries, repetições e instruções.
Exemplos de regras:

```prolog
treino(hipertrofia) :- objetivo(ganhar_massa), experiencia(intermediario).
treino(perda_de_peso) :- objetivo(emagrecer), disponibilidade(tempo_limitado).
```

## 5. Análise de Investigação Criminal ##
O sistema especialista para análise de investigação criminal auxilia na análise de casos criminais, sugerindo suspeitos ou teorias do crime com base nas evidências e testemunhos fornecidos pelo usuário. Ele também recomenda investigar suspeitos ou verificar álibis, dependendo das evidências disponíveis.

Funcionalidades:
Base de dados com evidências e testemunhos, como impressões digitais, motivo e testemunhas oculares.
Regras que associam as evidências a possíveis suspeitos ou teorias do crime.
Perguntas sobre as evidências e testemunhos para analisar o caso.
Sugestões sobre quais suspeitos investigar ou quais álibis verificar.
Exemplos de regras:

```prolog
suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).
```

*Como Usar*

Clone este repositório:

```bash
git clone https://github.com/seu-usuario/nome-do-repositorio.git
Abra o arquivo desejado no ambiente de desenvolvimento SWI-Prolog.
```

Execute o código usando o comando:

prolog

?- iniciar_analise.
ou para cada sistema, utilize o nome da função de inicialização apropriada, como iniciar_recomendacao, iniciar_reparacao, entre outras.

Siga as instruções interativas fornecidas pelo sistema.

