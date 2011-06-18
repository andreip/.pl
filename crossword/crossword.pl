#!/usr/bin/swipl

% resolve a crossword with this 6 words
% having 3 vertically, 3 horizontally
% see .png for details

% facts
word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

% rule
crosswd(W1, W2, W3, W4, W5, W6) :-
	word(W1, X1, X2, X3, X4, X5, X6, X7),
	word(W2, Y1, Y2, Y3, Y4, Y5, Y6, Y7),
	word(W3, Z1, Z2, Z3, Z4, Z5, Z6, Z7),
	word(W4, A1, X2, A2, Y2, A3, Z2, A4),
	word(W5, B1, X4, B2, Y4, B3, Z4, B4),
	word(W6, C1, X6, C2, Y6, C3, Z6, C4),
	nl.
