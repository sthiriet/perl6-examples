use v6;

=begin pod

=TITLE P09 - Pack consecutive duplicates of list elements into sublists.

=AUTHOR Samuel Thiriet

Based on Johan Viklund's solution to the problem 08 with the reduce metaoperator

=head1 Specification
   P09 (**) Pack consecutive duplicates of list elements into sublists.
       If a list contains repeated elements they should be placed in separate
       sublists.

=head1 Example

    > say ([pack] <a a a a b c c a a d e e e e>).perl;
    [["a", "a", "a", "a"], ["b"], ["c", "c"], ["a", "a"], ["d"], ["e", "e", "e", "e"]]

=end pod

multi infix:<pack> ( $a, $b ) { $a   ~~ $b ?? [[ $a , $b ]] !! [[ $a ], [$b]] };
multi infix:<pack> ( @a, $b ) {@a[*-1][*-1]~~ $b ?? [@a[0..*-2],[@a[*-1].list,$b]] !! [@a,[$b]] };

say ([pack] <a a a a b c c a a d e e e e>).perl;