(*
Define a function with type:

countzero : (int -> int) -> int -> int -> int
Given as input a function f from integers to integers and two integers a and b, 
countzero f a b counts the zeros of f in the interval [a,b], i.e. the number of integer values x in the interval 
such that f(x)=0.

For instance, the following assert must pass:

assert (countzero (fun x -> x) (-10) 10 = 1);;

assert (countzero (fun x -> x) 1 10 = 0);;

assert (countzero (fun x -> x*x - 1) (-10) 10 = 2);;

assert (countzero (fun x -> (if x<0 then -x else x) - 1) (-10) 10 = 2);;
*)

(*Esempio: f(x) = x^2 - 1*)

let rec range (a : int) (b : int) : int list = 
  if a > b then 
    []
  else a :: range (a + 1) b

let rec countzero (f : int -> int) (a : int) (b : int) = 
  range a b |>
    List.map f |>
      List.fold_left (fun acc y -> 
        (if y = 0 then 1 else 0) + acc) 0


let rec countZero1 (f : int -> int) (a : int) (b : int) = 
    range a b |>
      List.map f |>
      List.filter (fun n -> n = 0) |> 
      List.length
;;


assert (countzero (fun x -> x) (-10) 10 = 1);;

assert (countzero (fun x -> x) 1 10 = 0);;

assert (countzero (fun x -> x*x - 1) (-10) 10 = 2);;

assert (countzero (fun x -> (if x<0 then -x else x) - 1) (-10) 10 = 2);;
