package RemoteCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 33 }, $class;
}

sub handle_cache {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 33) % 997;
    }
    return $total;
}

print RemoteCache->new->handle_cache(33), "\n";
1;
