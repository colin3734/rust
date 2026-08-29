package LiteRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 31 }, $class;
}

sub collect_handler {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 31) % 997;
    }
    return $count;
}

print LiteRegistry->new->collect_handler(31), "\n";
1;
