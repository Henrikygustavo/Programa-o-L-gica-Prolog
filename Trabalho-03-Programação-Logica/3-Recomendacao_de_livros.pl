% Base de dados de livros categorizados por gênero e interesses

% Livros e suas categorias
livro('1984', 'ficcao', 'politica', 'Um romance distópico de George Orwell que descreve um mundo totalitário dominado pela vigilância e controle social.').
livro('Sapiens', 'historia', 'ciencia', 'Uma análise da história da humanidade, desde os primeiros Homo sapiens até os dias atuais, escrita por Yuval Noah Harari.').
livro('O Poder do Hábito', 'autoajuda', 'comportamento', 'Explora a ciência dos hábitos e como eles moldam nossa vida pessoal e profissional, escrito por Charles Duhigg.').
livro('O Gene', 'ciencia', 'biologia', 'Uma introdução ao mundo dos genes e à genética, explorando a história da genética e suas implicações para a medicina, escrita por Siddhartha Mukherjee.').
livro('O Alquimista', 'ficcao', 'filosofia', 'A jornada de Santiago, um jovem pastor que busca seu destino pessoal em busca de um tesouro escondido, escrito por Paulo Coelho.').

% Regras de recomendação com base no gênero e interesse do usuário
recomendar(Livro) :-
    genero(Genero),
    interesse(Interesse),
    livro(Livro, Genero, Interesse, _).

% Perguntar ao usuário sobre seus interesses
perguntar_genero :-
    nl, write('### Escolha seus gêneros de interesse ###'), nl,
    write('Quais gêneros você prefere? (ficcao, ciencia, historia, autoajuda): '), read(Genero),
    assert(genero(Genero)).

perguntar_interesse :-
    nl, write('### Escolha seus interesses ###'), nl,
    write('Quais são seus interesses? (politica, comportamento, ciencia, filosofia): '), read(Interesse),
    assert(interesse(Interesse)).

% Exibir as recomendações de livros
mostrar_recomendacoes :-
    nl, write('### Recomendações de Livros ###'), nl,
    (   recomendar(Livro) ->
        livro(Livro, Genero, Interesse, Sinopse),
        write('Livro: '), write(Livro), nl,
        write('Gênero: '), write(Genero), nl,
        write('Interesse: '), write(Interesse), nl,
        write('Sinopse: '), write(Sinopse), nl, nl ;
        write('Nenhuma recomendação encontrada com base nas suas preferências.'), nl
    ).

% Função principal que inicia o processo de recomendação
iniciar_recomendacao :-
    retractall(genero(_)), retractall(interesse(_)), % Limpa os fatos anteriores
    perguntar_genero,
    perguntar_interesse,
    mostrar_recomendacoes.
