import Debug "mo:base/Debug";

import Eq "typeclasses/Eq";
import Show "typeclasses/Show";

import Nat "instances/Nat";
import Option "instances/Option";

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

Debug.print(Show.show(Nat.Instances, 42));

Debug.print(Show.show(Option.Instances(Nat.Instances), null));
Debug.print(Show.show(Option.Instances(Nat.Instances), ?42));

Debug.print(useEqAndShow(Nat.Instances, 0, 1));
Debug.print(useEqAndShow(Nat.Instances, 1, 1));

Debug.print(useEqAndShow(Option.Instances(Nat.Instances), null, null));
Debug.print(useEqAndShow(Option.Instances(Nat.Instances), ?0, null));
Debug.print(useEqAndShow(Option.Instances(Nat.Instances), null, ?0));
Debug.print(useEqAndShow(Option.Instances(Nat.Instances), ?0, ?1));
Debug.print(useEqAndShow(Option.Instances(Nat.Instances), ?1, ?1));
