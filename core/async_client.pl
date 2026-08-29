package SharedDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 76 }, $class;
}

sub encode_router {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 76) % 997;
    }
    return $count;
}

print SharedDispatcher->new->encode_router(76), "\n";
1;
