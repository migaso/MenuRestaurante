main:-
	write('escribe una expresion:'),nl,
	read_string(E),
	string_term(S,E),
	particiona(S).
	
particiona(T):- 
		sub_string(T,Pos_ini,1,$ $),
		Long_1 is Pos_ini - 1,
		sub_string(T,1,Long_1,T1),
		write('elemento separado:'),
		write(T1),nl,
		string_length(T,Largo),
		Long_2 is Largo - Pos_ini,
		Pos_2 is Pos_ini + 1,
		sub_string(T,Pos_2,Long_2,T2),
		particiona(T2).

particiona(T):-
		write('ultimo elemento:'),
		write(T),nl.
