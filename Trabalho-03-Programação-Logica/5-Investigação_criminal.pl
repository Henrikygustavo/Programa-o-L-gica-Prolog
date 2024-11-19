% Base de dados de evid�ncias, testemunhos e suspeitos
% Definindo fatos para testemunhas
testemunha(visto_discutindo).
testemunha(visto_na_cena_crime).

suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).
suspeito(maria) :- testemunha(visto_discutindo), relacao(intima).
suspeito(joao) :- alibi_nao_verificado, motivo(pessoal).

teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).
teoria(crime_finanaceiro) :- motivo(financeiro), impressao_digital(lugar_crime).
teoria(crime_nao_resolvido) :- alibi_nao_verificado, motivo(pessoal).

% Base de dados de outras evid�ncias
impressao_digital(lugar_crime).
motivo(financeiro).
motivo(pessoal).
relacao(intima).
alibi_nao_verificado.

% Intera��o principal
analisar_caso :-
    write('Bem-vindo ao sistema de an�lise de casos criminais!'), nl,
    write('Informe as evid�ncias e testemunhos do caso para uma an�lise preliminar.'), nl,
    write('1. H� impress�es digitais no local do crime? (sim/nao): '),
    read(Impressao), nl,
    write('2. Qual o motivo poss�vel do crime? (financeiro/pessoal/relacao_intima): '),
    read(Motivo), nl,
    write('3. Testemunha ocular: A testemunha viu algo relevante? (sim/nao): '),
    read(Testemunha), nl,
    write('4. O suspeito tem um �libi verificado? (sim/nao): '),
    read(Alibi), nl,
    analisar_resultado(Impressao, Motivo, Testemunha, Alibi).

% Analisar os resultados com base nas evid�ncias fornecidas
analisar_resultado(Impressao, Motivo, Testemunha, Alibi) :-
    (   Impressao == sim, Motivo == financeiro ->
        (   suspeito(jose) ->
            write('Suspeito identificado: Jose (impress�o digital e motivo financeiro)'), nl
        ;   write('Nenhum suspeito identificado para este caso com base nas evid�ncias fornecidas.'), nl
        )
    ;   Testemunha == sim, Motivo == relacao_intima ->
        (   suspeito(maria) ->
            write('Suspeito identificado: Maria (testemunha ocular e rela��o �ntima)'), nl
        ;   write('Nenhum suspeito identificado para este caso com base nas evid�ncias fornecidas.'), nl
        )
    ;   Alibi == nao_verificado ->
        (   suspeito(joao) ->
            write('Suspeito identificado: Jo�o (�libi n�o verificado e motivo pessoal)'), nl
        ;   write('Nenhum suspeito identificado para este caso com base nas evid�ncias fornecidas.'), nl
        )
    ;   write('Nenhum suspeito identificado para este caso com base nas evid�ncias fornecidas.'), nl
    ).

% Recomendar investiga��es baseadas em teoria
recomendar_teoria :-
    write('Recomenda��es de investiga��o com base nas evid�ncias:'), nl,
    (   teoria(crime_passional) ->
        write('Teoria: Crime passional (testemunha viu discuss�o e rela��o �ntima)'), nl
    ;   teoria(crime_finanaceiro) ->
        write('Teoria: Crime financeiro (impress�o digital e motivo financeiro)'), nl
    ;   teoria(crime_nao_resolvido) ->
        write('Teoria: Crime n�o resolvido (�libi n�o verificado e motivo pessoal)'), nl
    ;   write('Nenhuma teoria espec�fica pode ser sugerida com base nas evid�ncias fornecidas.'), nl
    ).

% Iniciar a an�lise
iniciar_analise :-
    analisar_caso,
    recomendar_teoria.
