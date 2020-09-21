(* Name: Sahil Yadav *)

(* #1 - pow *)
(* pow takes two integer arguments and then returns first integer raised to the second integer. *)
fun pow (a, b) = 
	if (b<=0) then 1 
	else (a* pow(a,b-1));

(* #2 - sumTo *)
(* sumTo takes x as a integer argument and then computes the sum of first x reciprocals.*)
fun sumTo x = 
	if (x=0) then 0.0 
	else(1.0/real(x)) + sumTo(x-1);
                              
(* #3 - repeat *)
(* repeat takes a string s and an integer n argument and returns a string consisting of the n occurences. *)
fun repeat (s, n) = 
	if n=0 then "" 
	else (s^repeat(s,n-1));

(* #4 - binary *)
(* binary takes the integer x as an argument, and return a string corresponding to that ineger's binary representation. *)
fun binary x = 
	if x = 0 then "0" 
	else binary(x div 2)^str(chr((x mod 2)+48));

(* #5 - countNegative *)
(* countNegative takes x as list of integer as an argument and returns the count of negative numbers in the list.*)
fun countNegative x = 
	if x = [] then 0 
	else if hd x <0 then 1+ countNegative(tl x) 
		 else countNegative(tl x);

(* #6 - absList *)
(* absHelper takes int * int tuple as a parameter and return the abs value of the original tuple*)
fun absHelper (a,b) = 
	(abs(a), abs(b));
(* absList takes x as a list of int * int tuples and return a list with absolute values of orginal int*int tuples*)
fun absList x = 
	if x = [] then [] 
	else absHelper(hd x)::absList(tl x);;

(* #7 - split *)
(*splitHelper takes integer a as argument and return the tuple obtained by splitting integer into two numbers whose sum equals the original integer.*)
fun splitHelper a = 
	if a = 0 then (0,0)	
	else ((a div 2),(a div 2)+(a mod 2));
(*split takes list of integer x as argument and return the list with tuples obtained by splitting integers into two numbers whose sum equals the original integer. *)
fun split x = 
	if x = [] then [] 
	else splitHelper(hd x)::split(tl x);


(* #8 - isSorted *)
(* isSorted takes a list of integers x as an argument and returns wehthere the list is sorted in an increasing order or not.*)
fun isSorted x = 
	if length (x:int list) <= 1 then true 
	else if hd(x) <= hd(tl(x)) then isSorted(tl x) 
		 else false;
 
(* #9 - collapse *)
(*collapseHelper takes integer a and list of integers b as parameter and returns the sum of the integer and the first element of the list.*)
fun collapseHelper (a, b) =	
	if b= [] then a 
	else a+ hd b;
(*collapse takes a list of integers x as an arguments and returns a list which is obtained by collapsing successive pairs in the original list by replacing each pair with its sum. *)
fun collapse x =  
	if x = [] then [] 
	else if length x = 1 then collapseHelper(hd x, [])::collapse(tl x) 
		 else collapseHelper(hd x, tl x)::collapse(tl(tl x));
        
(* #10 - insert *)        
(*Insert takes an integer n and a sorted increasing integer list x as parameters and returns the list with integer inserted into the list so as to keep the nondecreasing order.*)
fun insert (n, x) = 
	if n < hd x then n::x  
	else if tl x = [] then x@[n]  
		 else hd x::insert(n,tl x);