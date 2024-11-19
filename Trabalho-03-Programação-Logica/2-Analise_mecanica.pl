% Fatos: sintomas conhecidos
sintoma(motor_nao_liga).
sintoma(luzes_fracas).
sintoma(barulho_ao_frear).
sintoma(pedal_freio_macio).
sintoma(vazamento_oleo).
sintoma(aquecimento_motor).
sintoma(fumaça_excesso).

% Regras: associação de problemas a sintomas
problema(bateria_fraca) :- sintoma_usuario(motor_nao_liga), sintoma_usuario(luzes_fracas).
problema(freio_desgastado) :- sintoma_usuario(barulho_ao_frear), sintoma_usuario(pedal_freio_macio).
problema(vazamento_motor) :- sintoma_usuario(vazamento_oleo), sintoma_usuario(aquecimento_motor).
problema(sobreaquecimento) :- sintoma_usuario(aquecimento_motor), sintoma_usuario(fumaça_excesso).


% Interação principal
diagnosticar :-
    write('Bem-vindo ao sistema de diagnóstico de problemas em veículos!'), nl,
    write('Por favor, responda às perguntas sobre os sintomas do seu veículo.'), nl,
    perguntar_sintomas,
    (   problema(Problema) ->
        format('Baseado nos sintomas, o problema pode ser: ~w.', [Problema]), nl,
        recomendar_solucao(Problema)
    ;
        write('Desculpe, não foi possível identificar o problema. Leve o veículo a um mecânico.'), nl
    ).

% Pergunta cada sintoma ao usuário
perguntar_sintomas :-
    findall(Sintoma, sintoma(Sintoma), ListaSintomas),
    perguntar_sintomas(ListaSintomas).

% Itera sobre a lista de sintomas e coleta respostas
perguntar_sintomas([]).
perguntar_sintomas([Sintoma | Restante]) :-
    format('O veículo apresenta o seguinte sintoma: ~w? (sim/nao) ', [Sintoma]),
    read(Resposta),
    (   Resposta == sim ->
        assertz(sintoma_usuario(Sintoma))
    ;   true
    ),
    perguntar_sintomas(Restante).

% Recomenda soluções com base no problema identificado
recomendar_solucao(bateria_fraca) :-
    write('Solução recomendada: Verifique ou troque a bateria.'), nl,
    write('Se o problema persistir, consulte um mecânico.'), nl.

recomendar_solucao(freio_desgastado) :-
    write('Solução recomendada: Verifique o sistema de freios e substitua as pastilhas, se necessário.'), nl,
    write('Considere levar o carro a um mecânico para evitar riscos.'), nl.

recomendar_solucao(vazamento_motor) :-
    write('Solução recomendada: Verifique o nível de óleo e procure vazamentos visíveis.'), nl,
    write('Leve o carro a um mecânico para inspeção detalhada.'), nl.

recomendar_solucao(sobreaquecimento) :-
    write('Solução recomendada: Verifique o nível do líquido de arrefecimento e o funcionamento do radiador.'), nl,
    write('Se o motor continuar superaquecendo, consulte um mecânico imediatamente.'), nl.
