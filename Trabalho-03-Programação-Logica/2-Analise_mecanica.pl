% Fatos: sintomas conhecidos
sintoma(motor_nao_liga).
sintoma(luzes_fracas).
sintoma(barulho_ao_frear).
sintoma(pedal_freio_macio).
sintoma(vazamento_oleo).
sintoma(aquecimento_motor).
sintoma(fuma�a_excesso).

% Regras: associa��o de problemas a sintomas
problema(bateria_fraca) :- sintoma_usuario(motor_nao_liga), sintoma_usuario(luzes_fracas).
problema(freio_desgastado) :- sintoma_usuario(barulho_ao_frear), sintoma_usuario(pedal_freio_macio).
problema(vazamento_motor) :- sintoma_usuario(vazamento_oleo), sintoma_usuario(aquecimento_motor).
problema(sobreaquecimento) :- sintoma_usuario(aquecimento_motor), sintoma_usuario(fuma�a_excesso).


% Intera��o principal
diagnosticar :-
    write('Bem-vindo ao sistema de diagn�stico de problemas em ve�culos!'), nl,
    write('Por favor, responda �s perguntas sobre os sintomas do seu ve�culo.'), nl,
    perguntar_sintomas,
    (   problema(Problema) ->
        format('Baseado nos sintomas, o problema pode ser: ~w.', [Problema]), nl,
        recomendar_solucao(Problema)
    ;
        write('Desculpe, n�o foi poss�vel identificar o problema. Leve o ve�culo a um mec�nico.'), nl
    ).

% Pergunta cada sintoma ao usu�rio
perguntar_sintomas :-
    findall(Sintoma, sintoma(Sintoma), ListaSintomas),
    perguntar_sintomas(ListaSintomas).

% Itera sobre a lista de sintomas e coleta respostas
perguntar_sintomas([]).
perguntar_sintomas([Sintoma | Restante]) :-
    format('O ve�culo apresenta o seguinte sintoma: ~w? (sim/nao) ', [Sintoma]),
    read(Resposta),
    (   Resposta == sim ->
        assertz(sintoma_usuario(Sintoma))
    ;   true
    ),
    perguntar_sintomas(Restante).

% Recomenda solu��es com base no problema identificado
recomendar_solucao(bateria_fraca) :-
    write('Solu��o recomendada: Verifique ou troque a bateria.'), nl,
    write('Se o problema persistir, consulte um mec�nico.'), nl.

recomendar_solucao(freio_desgastado) :-
    write('Solu��o recomendada: Verifique o sistema de freios e substitua as pastilhas, se necess�rio.'), nl,
    write('Considere levar o carro a um mec�nico para evitar riscos.'), nl.

recomendar_solucao(vazamento_motor) :-
    write('Solu��o recomendada: Verifique o n�vel de �leo e procure vazamentos vis�veis.'), nl,
    write('Leve o carro a um mec�nico para inspe��o detalhada.'), nl.

recomendar_solucao(sobreaquecimento) :-
    write('Solu��o recomendada: Verifique o n�vel do l�quido de arrefecimento e o funcionamento do radiador.'), nl,
    write('Se o motor continuar superaquecendo, consulte um mec�nico imediatamente.'), nl.
