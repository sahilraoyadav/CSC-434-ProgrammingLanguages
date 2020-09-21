
(* #1 - duplist *)
(*
	duplist: Takes in a list as a parameter and then
		recurse the list from right to left while 
		concatenating each element twice using the high order
		function. The high order function breaks the list
		into first and rest and then adds two instances of first
		to the rest and then foldr recurses down the list until the
		list is recursed. Returns a nil list if a [] is passed. 
	Return type: val duplist = fn : 'a list -> 'a list
*)
fun duplist x = 
	foldr(fn(first,rest) => first::first::rest) nil x;

(* #2 - mylength *)
(*
	mylength: Takes in a list as a parameter and then 
		recurse left to right through the list, while 
		adding 1 to length counter until the list is 
		fully recursed and then add a 0 to indicate
		list is fully recursed. Return 0 for a nil list.
	Return type: val mylength = fn : 'a list -> int
*)
fun mylength x = 
	foldl (fn (_, count) => 1 + count) 0 x;

(* #3 - il2absrl *)
(*
	il2absrl: Takes in a list as a parameter and then 
		maps each element in the list to the abs value 
		and cast as real number using the higher order function
		num. Num checks to see if a element number < 0 then
		cast the number as a real and multiply the number 
		with -1 to take the absolute value of it else just 
		cast the number to real. If if given a empty list then
		return a empty list.
	Return type: val il2absrl = fn : int list -> real list
*)
fun il2absrl x = 
	map(fn (num) => if num < 0 then real(~num) else real num) x;

(* #4 - myimplode *)
(*
	myimplode: Takes in a char list as a parameter and 
		then concatenate each element before each other and 
		then maps the resulting list to a string. Returns a 
		empty string if given a empty list.
	Return type: val myimplode = fn : char list -> string
*)
fun myimplode x = 
	foldr (op ^) "" (map str x);

(* #5 - lconcat *)
(*
	lconcat: Takes in a list of list as a parameter. Recurse the 
		list of list right to left and then concatenate each list
		before each other and then returns the concatenated list.
		Return a [] if [] list is passed. 
	Return type: val lconcat = fn : 'a list list -> 'a list
*)
fun lconcat x = 
	foldr (op @) [] x ;

(* #6 - convert *)
(*
	convert: Takes in a list of tuples as a parameter.
		Operate on the list left to right and uses a
		high order function to capture tuples 
		and concatenate the first element of the tuples
		into a list and the second element into a 
		new list. Returns a tuple of two list conatining first
		elements and second elements of the tupels.
		Returns a nil tuples in a list if a nil 
		list is passed.  
	Return type: val convert = fn : ('a * 'b) list -> 'a list * 'b list
*)
fun convert list = 
	foldl (fn((a,b),(c,d))=>(c@[a],d@[b])) (nil,nil) list;

(* #7 - mymap *)
(*
	mymap: Takes in a function and a list as a parameter. 
		Operates on a list of values in order to produce a
		new list of values,by applying the same computation to
		each value. Returns a empty list if passed in a nil list.
	Return type: val mymap = fn : ('a -> 'b) -> 'a list -> 'b list
*)
fun mymap f x = 
	foldr(fn(a,b)=>(f a)::b) [] x;
(* #8 - myfoldl *)
(*
	myfoldl: Takes in a function, intial value and a list as a parameter.
		It applies the function to the starting point and the first element
		of the list. Then takes the resulting solution and uses it with the
		second element of the list and so on.
	Return type: val myfoldl = fn : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b
*)
fun myfoldl f initialValue [] = initialValue  |
  myfoldl f initialValue (first::rest) = 
  myfoldl f (f(first,initialValue)) rest;
