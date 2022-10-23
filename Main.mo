import Debug "mo:base/Debug";

import Nat "instances/Nat";
import Option "instances/Option";
import Show "typeclasses/Show";

Debug.print(Show.show(Nat.show, 42));

Debug.print(Show.show(Option.show(Nat.show), null));
Debug.print(Show.show(Option.show(Nat.show), ?42));
