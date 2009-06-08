package Template::Stash::AutoEscape::Escaped::Base;
use strict;
use warnings;
use overload '""' => \&as_string;
use overload "."  => \&concat;

sub new {
    my ( $klass, $str ) = @_;
    bless \$str, $klass;
}

sub as_string {
    my $self = shift;
    return $$self;
}

sub concat {
    my ( $self, $other, $reversed ) = @_;
    my $class = ref $self;
    if ($other) {
        my $newval = ($reversed) ? $other . $$self : $$self . $other;
        return bless \$newval, $class;
    }
    else {
        return $self;
    }
}

1;
