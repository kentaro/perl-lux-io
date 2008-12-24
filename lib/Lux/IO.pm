package Lux::IO;
use 5.008001;
use strict;
use warnings;

our $VERSION = '0.01';

our $DB_RDONLY = 0x0000;
our $DB_RDWR   = 0x0002;
our $DB_CREAT  = 0x0200;
our $DB_TRUNC  = 0x0400;

sub DB_RDONLY { $DB_RDONLY }
sub DB_RDWR   { $DB_RDWR   }
sub DB_CREAT  { $DB_CREAT  }
sub DB_TRUNC  { $DB_TRUNC  }

1;

__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Lux::IO - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Lux::IO;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Lux::IO, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

antipop, E<lt>antipop@localE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by antipop

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
