package CoreAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 25 }, $class;
}

sub compute_router {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 25) % 997;
    }
    return $value;
}

print CoreAdapter->new->compute_router(25), "\n";
1;
