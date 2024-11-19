% Base de dados de treinos
treino(ganhar_massa, intermediario, tempo_disponivel,
    ['Supino reto: 4 séries de 8 repetições',
     'Agachamento livre: 4 séries de 8 repetições',
     'Remada curvada: 3 séries de 10 repetições']).

treino(ganhar_massa, iniciante, tempo_disponivel,
    ['Supino máquina: 3 séries de 10 repetições',
     'Leg press: 3 séries de 12 repetições',
     'Puxada alta: 3 séries de 12 repetições']).

treino(emagrecer, iniciante, tempo_limitado,
    ['Caminhada rápida: 20 minutos',
     'Circuito de peso corporal: 3 rodadas de 10 flexões, 15 agachamentos e 20 abdominais']).

treino(emagrecer, intermediario, tempo_disponivel,
    ['Corrida: 30 minutos',
     'Treino intervalado de alta intensidade (HIIT): 5 ciclos de 30s alta intensidade / 1min descanso',
     'Treinamento funcional: 3 rodadas de 10 burpees, 15 kettlebell swings e 20 lunges']).

treino(condicionamento, avancado, tempo_disponivel,
    ['Corrida de longa distância: 40 minutos',
     'Crossfit: Fran (21-15-9 repetições de Thrusters e Pull-ups)',
     'Treino pliométrico: 3 séries de 12 saltos com caixa e 15 skater jumps']).

treino(condicionamento, iniciante, tempo_limitado,
    ['Caminhada inclinada na esteira: 20 minutos',
     'Bodyweight circuit: 3 rodadas de 10 flexões, 15 agachamentos e 20 abdominais']).

% Interação principal
recomendar_treino :-
    write('Bem-vindo ao sistema de recomendação de treinos de academia!'), nl,
    write('Qual é o seu objetivo? (ganhar_massa, emagrecer, condicionamento): '),
    read(Objetivo), nl,
    write('Qual é o seu nível de experiência? (iniciante, intermediario, avancado): '),
    read(Experiencia), nl,
    write('Quanto tempo você tem disponível? (tempo_limitado, tempo_disponivel): '),
    read(Disponibilidade), nl,
    buscar_treino(Objetivo, Experiencia, Disponibilidade).

% Buscar treino com base nos critérios
buscar_treino(Objetivo, Experiencia, Disponibilidade) :-
    treino(Objetivo, Experiencia, Disponibilidade, Plano),
    write('Recomendamos o seguinte plano de treino para você:'), nl,
    listar_treino(Plano).

buscar_treino(_, _, _) :-
    write('Desculpe, não encontramos um plano de treino para os critérios informados. Tente novamente.'), nl.

% Mostrar plano de treino
listar_treino([]).
listar_treino([Exercicio | Resto]) :-
    write('- '), write(Exercicio), nl,
    listar_treino(Resto).
