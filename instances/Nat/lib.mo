import BaseNat "mo:base/Nat";
import Show "../../typeclasses/Show";

module Nat {
  public let show = {
    show = func (value : Nat) : Text {
      BaseNat.toText(value);
    };
  };

  let _ : Show.Show<Nat> = show;
};
