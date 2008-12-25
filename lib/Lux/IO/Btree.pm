package Lux::IO::Btree;
use 5.008001;
use strict;
use warnings;
use Lux::IO;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Lux::IO', $VERSION);

sub new {
    my ($class, $index_type) = shift;
    btree_new($index_type || CLUSTER);
}

sub DESTROY {
    my $self = shift;
    btree_free($self);
}

sub open {
    my ($self, $filename, $oflags) = @_;
    btree_open($self, $filename, $oflags || DB_CREAT);
}

sub close {
    my ($self, $filename, $oflags) = @_;
    btree_close($self);
}

sub get {
    my ($self, $key) = @_;
    btree_get($self, $key);
}

sub put {
    my ($self, $key, $value, $insert_mode) = @_;
    btree_put($self, $key, $value, $insert_mode || OVERWRITE);
}

sub del {
    my ($self, $key) = @_;
    btree_del($self, $key);
}

1;
