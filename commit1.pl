% --- PERSONAJES (nombre, nivel, vida) ---
personaje('Elara', 5, 100).
personaje('Kael', 3, 80).
personaje('Rin', 7, 120).

% --- MISIONES (id, nombre, dificultad, XP) ---
mision(m1, 'Bosque de Sombras', 2, 50).
mision(m2, 'Cueva del Dragón', 5, 120).
mision(m3, 'Torre Arcana', 7, 200).

% --- INVENTARIOS (personaje, lista de objetos) ---
inventario('Elara', [espada, escudo, pocion]).
inventario('Kael', [arco, flechas]).
inventario('Rin', [varita, grimorio, pocion, amuleto]).

% --- OBJETOS REQUERIDOS POR MISIÓN ---
requiere(m2, escudo). requiere(m2, pocion).
requiere(m3, grimorio). requiere(m3, pocion).

?- personaje('Rin', Nivel, Vida).

?- inventario('Kael', Objetos).

?- mision(m2, Nombre, Dificultad, XP).

% Resultados
%Nivel = 7, Vida = 120.
%Objetos = [arco, flechas].
%Nombre = 'Cueva del Dragón', Dificultad = 5, XP = 120.

personaje('Saskia', 10, 150).
inventario('Saskia', [daga, capa, pocion_magica]).
?- personaje('Saskia', Nivel, _).
?- inventario(_, Objetos).


arma('Claymores', 45, viento).
tiene('Rin', arma('Claymores', 45, viento)).
?- tiene('Rin', arma(_, Dano, viento)).
inventario('Rin', [varita, grimorio, pocion, amuleto, 'Claymores']).

xp_para_subir(NivelActual, XP):-
    XP is NivelActual * 30.

vida_restante(VidaMaz, Danio, Final):-
    Final is VidaMax - Danio.
?-xp_para_subir(5, XP).
?-vida_restante(100, 35, V).

dano_acumulado(0,0).
dano_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    dano_acumulado(N1, Prev),
    Total is Prev + (10 * N).

?- dano_acumulado(4, Total).

mas_fuerte(P1, P2) :-
    personaje(P1, Nivel1, _),
    personaje(P2, Nivel2, _),
    Nivel1 > Nivel2.
mismo_objeto(P1, P2, Objeto) :-
    inventario(P1, Objetos1),
    inventario(P2, Objetos2),
    member(Objeto, Objetos1),
    member(Objeto, Objetos2).

?- mas_fuerte('Elara', 'Kael').
?- mismo_objeto('Rin', 'Elara', pocion).