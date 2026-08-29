package LocalCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 97 }, $class;
}

sub collect_cache {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 97) % 997;
    }
    return $result;
}

print LocalCollector->new->collect_cache(97), "\n";
1;
