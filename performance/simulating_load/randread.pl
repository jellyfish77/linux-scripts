#!/usr/bin/perl -w
#
# randread.pl - randomly read over specified file.
# perl ./randread.pl /home/otto/Documents/data/text_data

use strict;

my $IOSIZE = 8192;                      # size of I/O, bytes
my $QUANTA = $IOSIZE;                   # seek granularity, bytes

die "USAGE: randread.pl filename\n" if @ARGV != 1 or not -e $ARGV[0];

my $file = $ARGV[0];
my $span = -s $file;                    # span to randomly read, bytes
my $junk;

open FILE, "$file" or die "ERROR: reading $file: $!\n";

while (1) {
        seek(FILE, int(rand($span / $QUANTA)) * $QUANTA, 0);
        sysread(FILE, $junk, $IOSIZE);
}

close FILE;
