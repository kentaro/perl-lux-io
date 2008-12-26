package Lux::IO;
use 5.008001;
use strict;
use warnings;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Lux::IO', $VERSION);

1;

__END__

=head1 NAME

Lux::IO - A Perl Interface to Lux IO

=head1 SYNOPSIS

  use Lux::IO;
  use Lux::IO::Btree;

  my $bt = Lux::IO::Btree->new(CLUSTER);
  $bt->open('test', DB_CREAT);
  $bt->put('key', 'value', OVERWRITE);  #=> true
  $bt->get('key');                      #=> 'value'
  $bt->del('key');                      #=> true
  $bt->get('key');                      #-> false
  $bt->close;

=head1 DESCRIPTION

Lux IO is a yet another database manager. Lux::IO provides a Perl
interface to it. You must note that it supports only BTree-based
database so far, though Lux IO supports also hash-based database.

=head1 METHODS

=head2 new ( I<$index_type> )

=over 4

  my $bt = Lux::IO::Btree->new(CLUSTER);

Creates and returns a new Lux::IO::Btree object.

=back

=head2 open ( I<$filename>, I<$oflags> )

=over 4

  $bt->open($filename, DB_CREAT);

Opens a database specified by C<$filename>.

=back

=head2 close ()

=over 4

  $bt->close();

Closes the database.

=back

=head2 get ( I<$key> )

=over 4

  $bt->get($key);

Retrieves a value which is correspondent to the C<$key> from the
database.

=back

=head2 put ( I<$key>, I<$value>, I<$insert_mode> )

=over 4

  $bt->put($key, $value, OVERWRITE);

Stores the key-value pair into the database.

=back

=head2 del ( I<$key> )

=over 4

  $bt->del($key);

Deletes the value which is correspondent to the C<$key>.

=back

=head1 SEE ALSO

=over 4

=item * Lux IO

http://luxio.sourceforge.net/

=back

=head1 AUTHOR

=item * Kentaro Kuribayashi E<lt>kentaro@cpan.orgE<gt>

=head1 ACKNOWLEDGMENT

=item * Tokuhiro Matsuno for much improvement of the codes.

=head1 COPYRIGHT AND LICENSE

Copyright (c) Kentaro Kuribayashi E<lt>kentaro@cpan.orgE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut
