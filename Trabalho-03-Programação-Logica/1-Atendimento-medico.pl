sintoma(febre).
sintoma(tosse).
sintoma(cansaco).
sintoma(dor_de_garganta).
sintoma(dor_muscular).
sintoma(dor_de_cabeca).
sintoma(nausea).
sintoma(vomito).

doenca(gripe) :- sintoma_usuario(febre), sintoma_usuario(tosse), sintoma_usuario(cansaco).
doenca(infeccao_viral) :- sintoma_usuario(febre), sintoma_usuario(dor_de_garganta), sintoma_usuario(dor_muscular).
doenca(enxaqueca) :- sintoma_usuario(dor_de_cabeca), sintoma_usuario(nausea), sintoma_usuario(vomito).
doenca(resfriado) :- sintoma_usuario(tosse), sintoma_usuario(dor_de_garganta).

diagnosticar :-
    write('Bem-vindo ao sistema de diagnóstico médico!'), nl,
    write('Por favor, responda às perguntas sobre os sintomas.'), nl,
    perguntar_sintomas,
    (   doenca(Doenca) -> 
        format('Baseado nos seus sintomas, você pode estar com: ~w.', [Doenca]), nl
    ;   
        write('Desculpe, não foi possível identificar uma condição específica. Por favor, consulte um médico.'), nl
    ).

perguntar_sintomas :-
    findall(Sintoma, sintoma(Sintoma), ListaSintomas),
    perguntar_sintomas(ListaSintomas).
    
perguntar_sintomas([]).
perguntar_sintomas([Sintoma | Restante]) :-
    format('Você está com ~w? (sim/nao) ', [Sintoma]),
    read(Resposta),
    (   Resposta == sim -> 
        assertz(sintoma_usuario(Sintoma))
    ;   true
    ),
    perguntar_sintomas(Restante).
% Desenvolvido por: Gustavo H. F. Bernardes & Gustavo Verdi.
