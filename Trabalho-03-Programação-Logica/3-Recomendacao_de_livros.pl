% Base de dados de livros categorizados por g�nero e interesses

% Livros e suas categorias
livro('1984', 'ficcao', 'politica', 'Um romance dist�pico de George Orwell que descreve um mundo totalit�rio dominado pela vigil�ncia e controle social.').
livro('Sapiens', 'historia', 'ciencia', 'Uma an�lise da hist�ria da humanidade, desde os primeiros Homo sapiens at� os dias atuais, escrita por Yuval Noah Harari.').
livro('O Poder do H�bito', 'autoajuda', 'comportamento', 'Explora a ci�ncia dos h�bitos e como eles moldam nossa vida pessoal e profissional, escrito por Charles Duhigg.').
livro('O Gene', 'ciencia', 'biologia', 'Uma introdu��o ao mundo dos genes e � gen�tica, explorando a hist�ria da gen�tica e suas implica��es para a medicina, escrita por Siddhartha Mukherjee.').
livro('O Alquimista', 'ficcao', 'filosofia', 'A jornada de Santiago, um jovem pastor que busca seu destino pessoal em busca de um tesouro escondido, escrito por Paulo Coelho.').

% Regras de recomenda��o com base no g�nero e interesse do usu�rio
recomendar(Livro) :-
    genero(Genero),
    interesse(Interesse),
    livro(Livro, Genero, Interesse, _).

% Perguntar ao usu�rio sobre seus interesses
perguntar_genero :-
    nl, write('### Escolha seus g�neros de interesse ###'), nl,
    write('Quais g�neros voc� prefere? (ficcao, ciencia, historia, autoajuda): '), read(Genero),
    assert(genero(Genero)).

perguntar_interesse :-
    nl, write('### Escolha seus interesses ###'), nl,
    write('Quais s�o seus interesses? (politica, comportamento, ciencia, filosofia): '), read(Interesse),
    assert(interesse(Interesse)).

% Exibir as recomenda��es de livros
mostrar_recomendacoes :-
    nl, write('### Recomenda��es de Livros ###'), nl,
    (   recomendar(Livro) ->
        livro(Livro, Genero, Interesse, Sinopse),
        write('Livro: '), write(Livro), nl,
        write('G�nero: '), write(Genero), nl,
        write('Interesse: '), write(Interesse), nl,
        write('Sinopse: '), write(Sinopse), nl, nl ;
        write('Nenhuma recomenda��o encontrada com base nas suas prefer�ncias.'), nl
    ).

% Fun��o principal que inicia o processo de recomenda��o
iniciar_recomendacao :-
    retractall(genero(_)), retractall(interesse(_)), % Limpa os fatos anteriores
    perguntar_genero,
    perguntar_interesse,
    mostrar_recomendacoes.
