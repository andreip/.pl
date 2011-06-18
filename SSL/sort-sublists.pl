% 1.28 - sort a list of lists according 
% Example:
% ?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
% L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]

% change qsort so that it sorts after the begining of a sublist, a key
quicksort([], []).
quicksort([SUBLIST | TAIL], SORTED) :-
	[HEAD | _] = SUBLIST,
	partition(HEAD, TAIL, LEFT, RIGHT),
	quicksort(LEFT, SORTEDL),
	quicksort(RIGHT, SORTEDR),
	append(SORTEDL, [SUBLIST | SORTEDR], SORTED).

partition(_, [], [], []).
partition(PIVOT, [SUBLIST | TAIL], [SUBLIST | LEFT], RIGHT) :-
	[HEAD | _] = SUBLIST,
	HEAD =< PIVOT,
	partition(PIVOT, TAIL, LEFT, RIGHT).
partition(PIVOT, [SUBLIST | TAIL], LEFT, [SUBLIST | RIGHT]) :-
	[HEAD | _] = SUBLIST,
	HEAD > PIVOT,
	partition(PIVOT, TAIL, LEFT, RIGHT).
% -------------------------------------------------------------------

lsort(LIST, SORTED) :-
	add_key(LIST, KLIST),
	quicksort(KLIST, KSLIST),
	remove_key(KSLIST, SORTED).

% add_key([[a,b],[c,d,e]],[[2,a,b],[3,c,d,e]]) :- true.
add_key([], []).
add_key([SUBLIST | TAIL], [[N | SUBLIST] | KTAIL]) :-
	length(SUBLIST, N),
	add_key(TAIL, KTAIL).

% remove added keys
remove_key([], []).
remove_key([KSUBLIST | KTAIL], [SUBLIST | TAIL]) :-
	[_| SUBLIST] = KSUBLIST,
	remove_key(KTAIL, TAIL).
