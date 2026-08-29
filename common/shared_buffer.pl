package LiteWorker;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 66 }, $class;
}

sub collect_parser {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 66) % 997;
    }
    return $acc;
}

print LiteWorker->new->collect_parser(66), "\n";
1;
