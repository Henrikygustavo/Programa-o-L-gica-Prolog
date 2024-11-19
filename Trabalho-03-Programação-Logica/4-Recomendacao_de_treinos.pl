% Base de dados de treinos
treino(ganhar_massa, intermediario, tempo_disponivel,
    ['Supino reto: 4 s�ries de 8 repeti��es',
     'Agachamento livre: 4 s�ries de 8 repeti��es',
     'Remada curvada: 3 s�ries de 10 repeti��es']).

treino(ganhar_massa, iniciante, tempo_disponivel,
    ['Supino m�quina: 3 s�ries de 10 repeti��es',
     'Leg press: 3 s�ries de 12 repeti��es',
     'Puxada alta: 3 s�ries de 12 repeti��es']).

treino(emagrecer, iniciante, tempo_limitado,
    ['Caminhada r�pida: 20 minutos',
     'Circuito de peso corporal: 3 rodadas de 10 flex�es, 15 agachamentos e 20 abdominais']).

treino(emagrecer, intermediario, tempo_disponivel,
    ['Corrida: 30 minutos',
     'Treino intervalado de alta intensidade (HIIT): 5 ciclos de 30s alta intensidade / 1min descanso',
     'Treinamento funcional: 3 rodadas de 10 burpees, 15 kettlebell swings e 20 lunges']).

treino(condicionamento, avancado, tempo_disponivel,
    ['Corrida de longa dist�ncia: 40 minutos',
     'Crossfit: Fran (21-15-9 repeti��es de Thrusters e Pull-ups)',
     'Treino pliom�trico: 3 s�ries de 12 saltos com caixa e 15 skater jumps']).

treino(condicionamento, iniciante, tempo_limitado,
    ['Caminhada inclinada na esteira: 20 minutos',
     'Bodyweight circuit: 3 rodadas de 10 flex�es, 15 agachamentos e 20 abdominais']).

% Intera��o principal
recomendar_treino :-
    write('Bem-vindo ao sistema de recomenda��o de treinos de academia!'), nl,
    write('Qual � o seu objetivo? (ganhar_massa, emagrecer, condicionamento): '),
    read(Objetivo), nl,
    write('Qual � o seu n�vel de experi�ncia? (iniciante, intermediario, avancado): '),
    read(Experiencia), nl,
    write('Quanto tempo voc� tem dispon�vel? (tempo_limitado, tempo_disponivel): '),
    read(Disponibilidade), nl,
    buscar_treino(Objetivo, Experiencia, Disponibilidade).

% Buscar treino com base nos crit�rios
buscar_treino(Objetivo, Experiencia, Disponibilidade) :-
    treino(Objetivo, Experiencia, Disponibilidade, Plano),
    write('Recomendamos o seguinte plano de treino para voc�:'), nl,
    listar_treino(Plano).

buscar_treino(_, _, _) :-
    write('Desculpe, n�o encontramos um plano de treino para os crit�rios informados. Tente novamente.'), nl.

% Mostrar plano de treino
listar_treino([]).
listar_treino([Exercicio | Resto]) :-
    write('- '), write(Exercicio), nl,
    listar_treino(Resto).
