use v6;

use Test;

plan 7;

subtest {
    plan 1;

    my $example-name = "03-01-todays-date.pl";
    my $expected-output = q:to/EOD/;
    2015 5 9
    EOD

    my $output = run-example($example-name);
    is($output, $expected-output, $example-name);
}, "03-01-todays-date.pl";

subtest {
    plan 1;

    my $example-name = "03-02-datetime-to-epoch.pl";
    my $expected-output = 361584000;

    my $output = run-example($example-name);
    is($output.chomp, $expected-output, $example-name);
}, "03-02-datetime-to-epoch.pl";

subtest {
    plan 1;

    my $example-name = "03-03-epoch-to-datetime.pl";
    my $expected-output = q:to/EOD/;
    2014-12-05T15:27:14Z
    EOD

    my $output = run-example($example-name);
    is($output, $expected-output, $example-name);
}, "03-03-epoch-to-datetime.pl";

subtest {
    plan 1;

    my $example-name = "03-04-date-add-sub.pl";
    my $expected-output = q:to/EOD/;
    1981-05-20
    1981-07-01T20:00:00Z
    EOD

    my $output = run-example($example-name);
    is($output, $expected-output, $example-name);
}, "03-04-date-add-sub.pl";

subtest {
    plan 1;

    my $example-name = "03-05-sub-two-dates.pl";
    my $expected-output = 17655;

    my $output = run-example($example-name);
    is($output.chomp, $expected-output, $example-name);
}, "03-05-sub-two-dates.pl";

subtest {
    plan 1;

    my $example-name = "03-06-day-to-num-wmy.pl";
    my $expected-output = q:to/EOD/;
    31 8 216
    EOD

    my $output = run-example($example-name);
    is($output, $expected-output, $example-name);
}, "03-06-day-to-num-wmy.pl";

subtest {
    plan 1;

    my $example-name = "03-09-hires-times.pl";
    my $expected-output = 2;

    my $output = run-example($example-name);
    is($output.chomp, $expected-output, $example-name);
}, "03-09-hires-times.pl";

#| run the given example script
sub run-example($name, :$script-args = Nil) {
    my $base-dir = "categories/cookbook/03dates-and-times";
    my $script-path = $base-dir ~ "/" ~ $name;
    my $base-cmd = "perl6 $script-path";
    my $output = $script-args ?? qqx{$base-cmd \"$script-args\"}
                              !! qqx{$base-cmd};

    return $output;
}

# vim: expandtab shiftwidth=4 ft=perl6
