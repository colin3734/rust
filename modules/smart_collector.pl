package SharedClient;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 18 }, $class;
}

sub build_dispatcher {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 18) % 997;
    }
    return $count;
}

print SharedClient->new->build_dispatcher(18), "\n";
1;
