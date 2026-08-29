package StreamBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 28 }, $class;
}

sub fetch_adapter {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 28) % 997;
    }
    return $result;
}

print StreamBuilder->new->fetch_adapter(28), "\n";
1;
