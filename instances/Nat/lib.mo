import Nat "mo:base/Nat";

import Eq "../../typeclasses/Eq";
import Show "../../typeclasses/Show";

module {
  public let Instances: Eq.Eq<Nat> and Show.Show<Nat> = {
    eq = func (x : Nat, y : Nat) : Bool {
      x == y;
    };

    show = func (value : Nat) : Text {
      Nat.toText(value);
    };
  };
};
