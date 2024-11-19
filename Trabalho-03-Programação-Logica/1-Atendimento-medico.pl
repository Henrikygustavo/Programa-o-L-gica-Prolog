% Fatos: sintomas conhecidos
sintoma(febre).
sintoma(tosse).
sintoma(cansaco).
sintoma(dor_de_garganta).
sintoma(dor_muscular).
sintoma(dor_de_cabeca).
sintoma(nausea).
sintoma(vomito).

% Regras de diagn�stico
doenca(gripe) :- sintoma_usuario(febre), sintoma_usuario(tosse), sintoma_usuario(cansaco).
doenca(infeccao_viral) :- sintoma_usuario(febre), sintoma_usuario(dor_de_garganta), sintoma_usuario(dor_muscular).
doenca(enxaqueca) :- sintoma_usuario(dor_de_cabeca), sintoma_usuario(nausea), sintoma_usuario(vomito).
doenca(resfriado) :- sintoma_usuario(tosse), sintoma_usuario(dor_de_garganta).

% Intera��o principal
diagnosticar :-
    write('Bem-vindo ao sistema de diagn�stico m�dico!'), nl,
    write('Por favor, responda �s perguntas sobre os sintomas.'), nl,
    perguntar_sintomas,
    (   doenca(Doenca) -> 
        format('Baseado nos seus sintomas, voc� pode estar com: ~w.', [Doenca]), nl
    ;   
        write('Desculpe, n�o foi poss�vel identificar uma condi��o espec�fica. Por favor, consulte um m�dico.'), nl
    ).

% Pergunta cada sintoma ao usu�rio
perguntar_sintomas :-
    findall(Sintoma, sintoma(Sintoma), ListaSintomas),
    perguntar_sintomas(ListaSintomas).

% Itera sobre a lista de sintomas e coleta respostas
perguntar_sintomas([]).
perguntar_sintomas([Sintoma | Restante]) :-
    format('Voc� est� com ~w? (sim/nao) ', [Sintoma]),
    read(Resposta),
    (   Resposta == sim -> 
        assertz(sintoma_usuario(Sintoma))
    ;   true
    ),
    perguntar_sintomas(Restante).
