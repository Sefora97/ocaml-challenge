(*
Write a function with type:

has_one : int -> bool
For a positive integer n, has_one n returns true if n contains a 1 digit. If n is negative, then the function must fail.

Here are some unit tests:

assert(has_one 10 = true);;
assert(has_one 220 = false);;
assert(has_one 911 = true);;
assert(has_one 451 = true);;
assert(try has_one (-1) |> fun _ -> false with _ -> true);;
*)
 
let rec digits (n : int) : int list =
  if n = 0 then
    []
  else
      n mod 10 :: digits (n / 10)

let has_one n =
  if n < 0 then failwith "Must be a positive number";
   List.mem 1 (digits n)
;;

assert(has_one 10 = true);;
assert(has_one 220 = false);;
assert(has_one 911 = true);;
assert(has_one 451 = true);;
assert(try has_one (-1) |> fun _ -> false with _ -> true);;
    