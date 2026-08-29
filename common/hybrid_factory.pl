package BatchSession;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 71 }, $class;
}

sub handle_processor {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 71) % 997;
    }
    return $value;
}

print BatchSession->new->handle_processor(71), "\n";
1;
