# Programação Lógica

**Desenvolvido por**: [@Henrikygustavo](https://github.com/Henrikygustavo/) & [@GustavoVerdi](https://github.com/GustavoVerdi/)

Este repositório contém uma série de sistemas desenvolvidos utilizando a linguagem de programação **Prolog.** <br> Cada sistema é projetado para resolver problemas específicos com base em um conjunto de regras de inferência, permitindo fazer diagnósticos e recomendações em diferentes áreas, como saúde, veículos, livros, treinos de academia e investigação criminal.

## Tecnologias Utilizadas ##

<br>

Estaremos utilizando o **[SWI-Prolog](https://drive.google.com/file/d/1KetZAmsPVHPx-6kBvDNN4bUgp2vvT0kq/view)** como ambiente de desinvolvimento.

<hr>

## 1. Diagnóstico Médico ##
O sistema especialista em diagnóstico médico tem como objetivo sugerir diagnósticos médicos com base em sintomas fornecidos pelo usuário. Ao responder a perguntas sobre sintomas como febre, dor de cabeça, tosse e outros, o sistema é capaz de sugerir doenças possíveis com base nas regras pré-definidas.

**Funcionalidades:** <br>
- Base de dados de sintomas e doenças. <br>
- Regras que associam sintomas a doenças. <br>
- Perguntas interativas ao usuário para coletar os sintomas. <br>
- Sugestão de possíveis diagnósticos com base nas respostas do usuário. <br>
<br>

**Exemplos de regras:**

```prolog
doenca(gripe) :- febre, tosse, cansaco.
doenca(infeccao_viral) :- febre, dor_de_garganta, dor_muscular.
```
Para inicializar o programa basta seguir os seguintes passos <br>
**1.** Abrir o compilador ``` SWI - Prolog ```. <br>
**2.** Entrar na aba ```File```. <br>
**3.** Clicar em ```Consult ...``` e selecionar o arquivo ```1-Atendimento-medico```. <br>
**4.** Ao realizar os passos acima basta executar o comando abaixo no console. <br>

```prolog
diagnosticar.
```

### Exemplo de entrada de dado e retorno de procedimentos ###

```bash
?- diagnosticar.
Bem-vindo ao sistema de diagnóstico médico!
Por favor, responda às perguntas sobre os sintomas.
Você está com febre? (sim/nao) 
|: sim.
Você está com tosse? (sim/nao) 
|: sim.
Você está com cansaço? (sim/nao) 
|: sim.
Você está com dor_de_garganta? (sim/nao) 
|: nao.
Você está com dor_muscular? (sim/nao) 
|: nao.
Você está com dor_de_cabeca? (sim/nao) 
|: nao.
Você está com nausea? (sim/nao) 
|: nao.
Você está com vomito? (sim/nao) 
|: nao.
Baseado nos seus sintomas, você pode estar com: gripe.

```
<hr>

## 2. Análise de Problemas de Veículos ##
Este sistema especialista ajuda a diagnosticar problemas comuns em veículos com base em sintomas e comportamentos relatados pelos usuários. O usuário pode informar se o motor não liga, se há barulho estranho ao frear, ou se há vazamento de óleo, e o sistema sugerirá possíveis soluções e recomendações.

**Funcionalidades:** <br>
- Base de dados de problemas e sintomas relacionados a veículos. <br>
- Regras para associar sintomas a problemas específicos no veículo. <br>
- Perguntas sobre os sintomas e situações relatadas pelo usuário. <br>
- Sugestões de ações corretivas, como verificar a bateria ou os freios. <br>
<br>

**Exemplos de regras:**

```prolog
problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.
```
Para inicializar o programa basta seguir os seguintes passos <br>
**1.** Abrir o compilador ``` SWI - Prolog ```.<br>
**2.** Entrar na aba ```File```. <br>
**3.** Clicar em ```Consult ...``` e selecionar o arquivo ```2-Analise_mecanica```. <br>
**4.** Ao realizar os passos acima basta executar o comando abaixo no console. <br>

```prolog
diagnosticar.
```
### Exemplo de entrada de dado e retorno de procedimentos ###

```bash
?- diagnosticar.
Bem-vindo ao sistema de diagnóstico de problemas em veículos!
Por favor, responda às perguntas sobre os sintomas do seu veículo.
O veículo apresenta o seguinte sintoma: motor_nao_liga? (sim/nao) 
|: sim.
O veículo apresenta o seguinte sintoma: luzes_fracas? (sim/nao) 
|: sim.
O veículo apresenta o seguinte sintoma: barulho_ao_frear? (sim/nao) 
|: nao.
O veículo apresenta o seguinte sintoma: pedal_freio_macio? (sim/nao) 
|: nao.
O veículo apresenta o seguinte sintoma: vazamento_oleo? (sim/nao) 
|: nao.
O veículo apresenta o seguinte sintoma: aquecimento_motor? (sim/nao) 
|: nao.
O veículo apresenta o seguinte sintoma: fumaça_excesso? (sim/nao) 
|: nao.
Baseado nos sintomas, o problema pode ser: bateria_fraca.
Solução recomendada: Verifique ou troque a bateria.
Se o problema persistir, consulte um mecânico.
```

<hr>

## 3. Recomendações de Livros ##
O sistema especialista de recomendações de livros sugere livros com base nos gêneros e interesses fornecidos pelo usuário. O usuário pode escolher múltiplos gêneros e interesses, e o sistema retorna uma lista de livros recomendados, incluindo título, gênero e uma breve sinopse.

Funcionalidades: <br>
- Base de dados de livros categorizados por gênero e interesses. <br>
- Regras para recomendar livros com base nas preferências do usuário. <br>
- Permite ao usuário selecionar múltiplos gêneros e interesses. <br>
- Exibe detalhes dos livros recomendados, como título, gênero e sinopse. <br>
<br>

**Exemplos de regras:**

```prolog
recomendar('1984') :- genero(ficcao), interesse(politica).
recomendar('Sapiens') :- genero(historia), interesse(ciencia).
```
Para inicializar o programa basta seguir os seguintes passos <br>
**1.** Abrir o compilador ``` SWI - Prolog ```. <br>
**2.** Entrar na aba ```File```. <br>
**3.** Clicar em ```Consult ...``` e selecionar o arquivo ```3-Recomendacao_de_livros```. <br>
**4.** Ao realizar os passos acima basta executar o comando abaixo no console. <br>

```prolog
iniciar_recomendacao.
```

```bash
?- iniciar_recomendacao.
Quais gêneros você prefere? (ficcao, ciencia, historia, autoajuda):
|: ficcao.
Quais são seus interesses? (politica, comportamento, ciencia, filosofia):
|: politica.
Recomendação:
Livro: 1984
Gênero: ficcao
Interesse: politica
Sinopse: Um romance distópico de George Orwell que descreve um mundo totalitário dominado pela vigilância e controle social.
```


<hr>

## 4. Recomendação de Treinos de Academia ##
Este sistema sugere planos de treino para a academia baseados nos objetivos do usuário, como perder peso, ganhar massa muscular ou melhorar o condicionamento físico. O usuário também informa seu nível de experiência na academia e a disponibilidade de tempo para treinar.

**Funcionalidades:** <br>
- Base de dados com tipos de treino para diferentes objetivos. <br>
- Regras que associam os objetivos do usuário a planos de treino. <br>
- Perguntas sobre o objetivo do usuário, sua experiência e tempo disponível. <br>
- Recomendações detalhadas de treino, incluindo séries, repetições e instruções. <br>
<br>

**Exemplos de regras:**

```prolog
treino(hipertrofia) :- objetivo(ganhar_massa), experiencia(intermediario).
treino(perda_de_peso) :- objetivo(emagrecer), disponibilidade(tempo_limitado).
```
Para inicializar o programa basta seguir os seguintes passos <br>
**1.** Abrir o compilador ``` SWI - Prolog ```. <br>
**2.** Entrar na aba ```File```. <br>
**3.** Clicar em ```Consult ...``` e selecionar o arquivo ```4-Recomendacao_de_treinos```. <br>
**4.** Ao realizar os passos acima basta executar o comando abaixo no console. <br>

```prolog
recomendar_treino.
```

```bash
?- recomendar_treino.
Qual é o seu objetivo? (ganhar_massa, emagrecer, condicionamento):
|:ganhar_massa.
Qual é o seu nível de experiência? (iniciante, intermediario, avancado):
|:intermediario.
Quanto tempo você tem disponível? (tempo_limitado, tempo_disponivel): 
|:tempo_disponivel.
Recomendamos o seguinte plano de treino para você:
- Supino reto: 4 séries de 8 repetições
- Agachamento livre: 4 séries de 8 repetições
- Remada curvada: 3 séries de 10 repetições
```

<hr>

## 5. Análise de Investigação Criminal ##
O sistema especialista para análise de investigação criminal auxilia na análise de casos criminais, sugerindo suspeitos ou teorias do crime com base nas evidências e testemunhos fornecidos pelo usuário. Ele também recomenda investigar suspeitos ou verificar álibis, dependendo das evidências disponíveis.

**Funcionalidades:** <br>
- Base de dados com evidências e testemunhos, como impressões digitais, motivo e testemunhas oculares. <br>
- Regras que associam as evidências a possíveis suspeitos ou teorias do crime. <br>
- Perguntas sobre as evidências e testemunhos para analisar o caso. <br>
- Sugestões sobre quais suspeitos investigar ou quais álibis verificar. <br>
<br>

**Exemplos de regras:**

```prolog
suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).
```
Para inicializar o programa basta seguir os seguintes passos <br>
**1.** Abrir o compilador ``` SWI - Prolog ```. <br>
**2.** Entrar na aba ```File```. <br>
**3.** Clicar em ```Consult ...``` e selecionar o arquivo ```5-Investigação_criminal```. <br>
**4.** Ao realizar os passos acima basta executar o comando abaixo no console. <br>

```prolog
iniciar_analise.
```

<hr>

## Como Usar

Clone este repositório:

```Powershell
git clone https://github.com/Henrikygustavo/Programacao-Logica-Prolog.git
```
Abra o arquivo desejado no ambiente de desenvolvimento **[SWI-Prolog](https://drive.google.com/file/d/1KetZAmsPVHPx-6kBvDNN4bUgp2vvT0kq/view).**
