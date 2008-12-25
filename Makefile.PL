use inc::Module::Install;

requires 'enum';

name                 'Lux-IO';
author               'Kentaro Kuribayashi, <kentarok@gmail.com>';
all_from             'lib/Lux/IO.pm';
build_requires       'Test::More';
build_requires       'FindBin';
build_requires       'File::Temp';
makemaker_args       CC    => 'g++';
makemaker_args       LD    => 'g++';
makemaker_args       XSOPT => '-C++';
cc_inc_paths         '.';
cc_files             'IO.c';
can_cc               or die 'This module requires C++ compiler.';
use_test_base;
auto_include_deps;
WriteAll;
