#!/usr/bin/env perl
use strict;
use warnings;

my $ninzu = shift || 5;
my $x;
my $y;
my @amida;
my @hito = qw(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z);

my $nagasa = $ninzu * 2;

for ($y = 0; $y < $nagasa; $y++) {
  $x = rand ($ninzu - 1);
  $amida[$y][$x]++;
}

for ($x = 0; $x < $ninzu; $x++) {
  print $hito[$x],' ';
}
print "\n";

for ($y = 0; $y < $nagasa; $y++) {
  for ($x = 0; $x < $ninzu - 1; $x++) {
    print '|';
    if (defined $amida[$y][$x]) {
      print '-';
    }
    else {
      print ' ';
    }
  }
  print '|', "\n";
}
print "*\n";

