use v6;

=begin pod

=TITLE P10 - Run-length encoding of a list.

=AUTHOR Samuel Thiriet

=head1 Specification

   P10 (*) Run-length encoding of a list.
       Use the result of problem P09 to implement the so-called run-length
       encoding data compression method. Consecutive duplicates of elements
       are encoded as arrays [N, E] where N is the number of duplicates of the
       element E.

=head1 Example

    > encode(<a a a a b c c a a d e e e e>).perl.say
    [[4, "a"], [1, "b"], [2, "c"], [2, "a"], [1, "d"], [4, "e"]]

=end pod

multi infix:<pack> ( $a, $b ) { $a   ~~ $b ?? [[ $a , $b ]] !! [[ $a ], [$b]] };
multi infix:<pack> ( @a, $b ) {@a[*-1][*-1]~~ $b ?? [@a[0..*-2],[@a[*-1].list,$b]] !! [@a,[$b]] };

sub encode(@l){
    return [([pack] @l).map: {[$_.elems, $_[0] ]}];
}
say encode(<a a a a b c c a a d e e e e>).perl;