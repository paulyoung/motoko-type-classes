module {
  public type Eq<A> = {
    eq : (A, A) -> Bool;
  };

  public func eq<A>(witness : Eq<A>, x : A, y : A) : Bool {
    witness.eq(x, y);
  };
};
