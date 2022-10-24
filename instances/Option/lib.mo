import Eq "../../typeclasses/Eq";
import Show "../../typeclasses/Show";

module {
  public class Instances<A>(
    witness : Eq.Eq<A> and Show.Show<A>,
  ) : Eq.Eq<?A> and Show.Show<?A> {
    public func eq(x : ?A, y : ?A) : Bool {
      switch (x, y) {
        case (?someX, ?someY) Eq.eq(witness, someX, someY);
        case (null, null) true;
        case (_, _) false;
      };
    };

    public func show(value : ?A) : Text {
      switch value {
        case (?some) "?" # Show.show(witness, some);
        case (null) "null";
      };
    };
  };
}
