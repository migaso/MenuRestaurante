menu(sopas,[aguada,lentejas,crema,codito]).
menu(entremes,[ensalada,pasta,arroz]).
menu(principal,[pechuga_rellena,pollo_con_mole]).
menu(postre,[flan,fresas_con_crema,pastel]).
cliente([]).
escribir_lista([]).

main:- write('Este programa muestra un menu'),
		 nl,
		 repeat,
		 muestraop(X), X==6,
		 write('Gracias por la pereferencia'),nl.
		 
muestraop(X):- write('Escribe el numero de tu operacion (termina con punto):'),nl,
					write('1.Entreda Sopas'),nl,
					write('2.Entrada entremes'),nl,
					write('3.Plato principal'),nl,
					write('4.Postres'),nl,
					write('5.Lista pedido cliente'),nl,
					write('6.Salir'),nl,
					write('opcion:'),
					read(X),
					ejecutaop(X), !.
					
ejecutaop(1):- menu(sopas,L_sopas),
					write(L_sopas),nl,
					write('Elije el platillo:'),
					read(Platillo),
					guarda_eleccion(Platillo).
					
ejecutaop(2):-  menu(entremes,L_entremes), nl,
			       write(L_entremes), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).

ejecutaop(3):-  menu(principal,L_principal), nl,
			       write(L_principal), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).

ejecutaop(4):-  menu(postre,L_postre), nl,
			       write(L_postre), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).

ejecutaop(5):-  write('El cliente ordeno: '), nl,
			       cliente(Lista),
			       write(Lista), nl,
			       escribir_lista(Lista),nl.
			       
ejecutaop(6).

ejecutaop(_):- write('opcion incorrecta'),nl.

guarda_eleccion(X):- cliente(Lista),
						añade(X,Lista,Lista2),
						retract(cliente(Lista)),
						assert(cliente(Lista2)).

escribir_lista([Head|Tail]):- write(Head),nl,
										escribir_lista(Tail).
										
member(X,[X|L]) :- !.
member(X,[X|L]) :- member(X,L).
añade(X,L,L) :- member(X,L), !.
añade(X,L,[X|L]).	
						
