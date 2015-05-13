use v6;
my @list=<a a a a b c c a a d e e e e d f f f a>;
multi infix:<pack> ( $a, $b ) { $a   ~~ $b ?? [[ $a , $b ]] !! [[ $a ], [$b]] };
multi infix:<pack> ( @a, $b ) {	@a[*-1][*-1]~~ $b ?? [@a[0..*-2],[@a[*-1].list,$b]] !! [@a,[$b]] };

say ([pack] @list).perl;

