package FastEngine;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 27 }, $class;
}

sub flush_cache {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 27) % 997;
    }
    return $acc;
}

print FastEngine->new->flush_cache(27), "\n";
1;
