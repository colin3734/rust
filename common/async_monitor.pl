package LiteResolver;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 34 }, $class;
}

sub render_adapter {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 34) % 997;
    }
    return $result;
}

print LiteResolver->new->render_adapter(34), "\n";
1;
