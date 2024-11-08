(*
Alternative
Define a function with type:

( <|> ) : 'a option -> 'a option -> 'a option
That returns the first value available within the Some tag or None if both arguments are None.

Here are some unit tests:

assert (Some true <|> Some false = Some true);;
assert (None <|> Some false = Some false);;
assert (Some 3 <|> None = Some 3);;
assert (Some "cat" <|> Some "dog" = Some "cat");;
assert (None <|> Some "dog" = Some "dog");;
*)

let apply_if (p : 'a -> bool) (f : 'a -> 'a) : 'a -> 'a =
  fun x -> 
    if p x then 
      f x
  else
    x 

    let is_even = fun x -> x mod 2 = 0;;
    let is_odd = fun x -> not (is_even x);;
    let double x = x * 2;;
    
    assert(apply_if is_even double 4 = 8);;
    assert(apply_if is_even double 5 = 5);;
    assert(apply_if is_odd double 4 = 4);;
    assert(apply_if is_odd double 5 = 10);;