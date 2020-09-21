%Sahil Yadav

/*
Problem 12 oddSize(X)
oddSize: Return true if a list is of size one. Returns true if we recurse down the list until fact is matched. 
         Return false if the list is recursed and the fact is not matched or the list has zero elements left.
*/
oddSize([_]) :- !.
oddSize([_,_|Tail]) :- oddSize(Tail).
	
/*
Problem 13 evenSize(X)
evenSize:Return true if a list is of size 0. Returns true if we recurse down the list until fact of zero element is matched. 
         Return false if the list is recursed and the fact is not matched or the list has one elements left.
*/
evenSize([]).
evenSize([_,_|Tail]) :- evenSize(Tail).

/*
Problem 14 prefix(X,Y)
prefix: Returns the different possible list or subset that can be created for the given list.
*/
prefix([],_).
prefix([Head|Tail], [Head|NewTail]) :- 
    prefix(Tail, NewTail).

/*
Problem 15 isMember(X,Y)
isMember: Return True for the first fact if the first element is the head of the list.
          Return True if the first fact is matched after the list is recursed and the elements match.
          Return False if the elements are not matched.
*/
isMember(Head, [Head|_]).
isMember(Head, [_|Tail]) :- 
    isMember(Head, Tail).

/*
remove(X,Y,Z): Returns a list Z by removing the first (leftmost) instance of item X from list Y.
*/
remove(X, [X|Y], Y) :- !.
remove(X, [Z|Y1], [Z|Y2]) :- 
    remove(X,Y1,Y2).

/*
Problem 16 isUnion(X,Y,Z)
isUnion: Returns the union of X and Y set in a Z set.            
*/
isUnion([],[],[]) :- !.
isUnion([A|X], Y, [A|Z]) :- 
    isUnion(X,Y,Z),
    !.
isUnion([],[B|Y],[B|Z]) :- 
    isUnion([],Y,Z).
/*
Problem 18 isEqual(X,Y)
isEqual: Returns true if both recursed list are equal.
         Returns false if both recursed list have some members left
         that are not equal.
*/
isEqual([],_).
isEqual([X1|X], Y) :- 
    isMember(X1, Y), 
    isEqual(X, Y).
/* 
between(N1,N2,X): Returns a list X if X is a list of all the numbers, in order,
that are strictly between N1 and N2 exclusive.
*/
between(_,_,[]).
between(N1, N2, [C|X]) :- 
    A is N1+1, 
    C = A,
    A < N2, 
    between(A, N2, X).