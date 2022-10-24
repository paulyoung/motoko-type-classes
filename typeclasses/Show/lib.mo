module {
  public type Show<A> = {
    show : A -> Text;
  };

  public func show<A>(witness : Show<A>, x : A) : Text {
    witness.show(x);
  };
};
