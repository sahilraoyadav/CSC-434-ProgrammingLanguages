/*
 *
 * [a,b] - represents a problem state with a gallons in the 4-gallon jug
 * and b gallons in the 3-gallon jug
 */

/*
You can fill the 4 gallon jug from the faucet, taking you from a
problem state [X,Y] to a problem state [4,Y],
provided X < 4.
*/
move([X,Y],'Fill 4-gallon jug from faucet',[4,Y]) :- 
    X<4.
/*2. Rule corresponding to the move 'Fill 3-gallon jug from faucet'*/
move([X,Y],'Fill 3-gallon jug from faucet',[X,3]) :- 
    Y<3.
/*3. Rule corresponding to the move 'Empty 4-gallon jug onto the ground'*/
move([X,Y],'Empty 4-gallon jug onto the ground',[0,Y]) :- 
    X>0.

/*4. Rule corresponding to the move 'Empty 3-gallon jug onto the ground'*/
move([X,Y],'Empty 3-gallon jug onto the ground',[X,0]) :- 
    Y>0.

/*5. Rule corresponding to the move 'Fill 4-gallon jug from 3-gallon jug'*/
move([X,Y],'Fill 4-gallon jug from 3-gallon jug',[4,Z]) :- 
    X < 4, Y > 0, 
    X+Y >= 4, Z is Y-(4-X).

/*6. Rule corresponding to the move 'Fill 3-gallon jug from 4-gallon jug'*/
move([X,Y],'Fill 3-gallon jug from 4-gallon jug',[Z,3]) :- 
    X > 0, Y < 3, 
    X+Y >= 3, Z is X-(3-Y).

/*7. Rule corresponding to the move 'Empty 3-gallon jug into 4-gallon jug'*/
move([X,Y],'Empty 3-gallon jug into 4-gallon jug',[Z,0]) :- 
    X < 4, Y > 0, 
    X+Y < 4, Z is X+Y.

/*8. Rule corresponding to the move 'Empty 4-gallon jug into 3-gallon jug'*/
move([X,Y],'Empty 4-gallon jug into 3-gallon jug',[0,Z]) :- 
    X > 0, Y < 3, 
    X+Y < 3, Z is X+Y.
/*
 solution predicates
 To solve the problem try this: length(X, Y), Y < 10, solution([0,0], X).
 [2,0] is the goal state. No move required if you are in this state
*/
solution([2,0],[]).
%
/*
 The list of moves [Move|Rest] constitutes a solution from PresentState
 if Move takes you from PresentState to NextState
 and Rest represents a sequence of moves that will take
 you from NextState to the goal state.
*/ 
solution(PresentState,[Move|Rest]) :- move(PresentState,Move,NextState),
    solution(NextState,Rest).



