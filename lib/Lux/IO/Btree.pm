package Lux::IO::Btree;
use strict;
use warnings;
use Carp qw(croak);
use enum qw(
    ENUM: NONCLUSTER CLUSTER
    ENUM: OVERWRITE NOOVERWRITE APPEND
);
use Lux::IO;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Lux::IO', $VERSION);

sub new {
    my ($class, $index_type) = shift;
    my $btree = btree_new($index_type || NONCLUSTER);
    bless \$btree, $class;
}

sub DESTROY {
    my $self = shift;
    btree_free($$self);
}

sub open {
    my ($self, $filename, $oflags) = @_;
    btree_open($$self, $filename, $oflags || $Lux::IO::DB_CREAT)
        or croak "Couldn't open $filename";
}

sub close {
    my ($self, $filename, $oflags) = @_;
    btree_close($$self);
}

sub get {
    my ($self, $key) = @_;
    btree_get($$self, $key);
}

sub put {
    my ($self, $key, $value, $insert_mode) = @_;
    btree_put($$self, $key, $value, $insert_mode || OVERWRITE);
}

sub del {
    my ($self, $key) = @_;
    btree_del($$self, $key);
}

1;
