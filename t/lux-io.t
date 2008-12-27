use strict;
use Test::More tests => 3;
BEGIN { use_ok('Lux::IO') };
is Lux::IO::NONCLUSTER, 0;
is Lux::IO::CLUSTER, 1;
