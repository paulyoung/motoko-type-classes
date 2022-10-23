import Show "../../typeclasses/Show";

module Option {
  public func show<A>(witness : Show.Show<A>) : Show.Show<?A> = {
    show = func (value : ?A) : Text {
      switch value {
        case (?some) "?" # Show.show(witness, some);
        case (null) "null";
      };
    };
  };

  let _ = func <A>(witness : Show.Show<A>) : Show.Show<?A> = show(witness);
};
