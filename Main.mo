import Debug "mo:base/Debug";

import Eq "typeclasses/Eq";
import Show "typeclasses/Show";

import Nat "instances/Nat";
import Option "instances/Option";

let nat = Nat.Instances;
let option = Option.Instances;

func useEqAndShow<A>(
  witness : Eq.Eq<A> and Show.Show<A>,
  x : A,
  y : A,
) : Text {
  let symbol = if (Eq.eq(witness, x, y)) {
    "=="
  } else {
    "!="
  };

  Show.show(witness, x)
    # " "
    # symbol
    # " "
    # Show.show(witness, y)
};

Debug.print(Show.show(nat, 42));

Debug.print(Show.show(option(nat), null));
Debug.print(Show.show(option(nat), ?42));

Debug.print(useEqAndShow(nat, 0, 1));
Debug.print(useEqAndShow(nat, 1, 1));

Debug.print(useEqAndShow(option(nat), null, null));
Debug.print(useEqAndShow(option(nat), ?0, null));
Debug.print(useEqAndShow(option(nat), null, ?0));
Debug.print(useEqAndShow(option(nat), ?0, ?1));
Debug.print(useEqAndShow(option(nat), ?1, ?1));
