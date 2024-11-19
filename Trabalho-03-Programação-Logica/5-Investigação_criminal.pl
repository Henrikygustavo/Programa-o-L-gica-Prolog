testemunha(visto_discutindo).
testemunha(visto_na_cena_crime).

suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
suspeito(maria) :- testemunha(visto_discutindo), relacao(intima).
suspeito(joao) :- alibi_nao_verificado, motivo(pessoal).

teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).
teoria(crime_finanaceiro) :- motivo(financeiro), impressao_digital(lugar_crime).
teoria(crime_nao_resolvido) :- alibi_nao_verificado, motivo(pessoal).

impressao_digital(lugar_crime).
motivo(financeiro).
motivo(pessoal).
relacao(intima).
alibi_nao_verificado.

analisar_caso :-
    write('Bem-vindo ao sistema de análise de casos criminais!'), nl,
    write('Informe as evidências e testemunhos do caso para uma análise preliminar.'), nl,
    write('1. Há impressões digitais no local do crime? (sim/nao): '),
    read(Impressao), nl,
    write('2. Qual o motivo possível do crime? (financeiro/pessoal/relacao_intima): '),
    read(Motivo), nl,
    write('3. Testemunha ocular: A testemunha viu algo relevante? (sim/nao): '),
    read(Testemunha), nl,
    write('4. O suspeito tem um álibi verificado? (sim/nao): '),
    read(Alibi), nl,
    analisar_resultado(Impressao, Motivo, Testemunha, Alibi).

analisar_resultado(Impressao, Motivo, Testemunha, Alibi) :-
    (   Impressao == sim, Motivo == financeiro ->
        (   suspeito(jose) ->
            write('Suspeito identificado: Jose (impressão digital e motivo financeiro)'), nl
        ;   write('Nenhum suspeito identificado para este caso com base nas evidências fornecidas.'), nl
        )
    ;   Testemunha == sim, Motivo == relacao_intima ->
        (   suspeito(maria) ->
            write('Suspeito identificado: Maria (testemunha ocular e relação íntima)'), nl
        ;   write('Nenhum suspeito identificado para este caso com base nas evidências fornecidas.'), nl
        )
    ;   Alibi == nao_verificado ->
        (   suspeito(joao) ->
            write('Suspeito identificado: João (álibi não verificado e motivo pessoal)'), nl
        ;   write('Nenhum suspeito identificado para este caso com base nas evidências fornecidas.'), nl
        )
    ;   write('Nenhum suspeito identificado para este caso com base nas evidências fornecidas.'), nl
    ).

recomendar_teoria :-
    write('Recomendações de investigação com base nas evidências:'), nl,
    (   teoria(crime_passional) ->
        write('Teoria: Crime passional (testemunha viu discussão e relação íntima)'), nl
    ;   teoria(crime_finanaceiro) ->
        write('Teoria: Crime financeiro (impressão digital e motivo financeiro)'), nl
    ;   teoria(crime_nao_resolvido) ->
        write('Teoria: Crime não resolvido (álibi não verificado e motivo pessoal)'), nl
    ;   write('Nenhuma teoria específica pode ser sugerida com base nas evidências fornecidas.'), nl
    ).

iniciar_analise :-
    analisar_caso,
    recomendar_teoria.
