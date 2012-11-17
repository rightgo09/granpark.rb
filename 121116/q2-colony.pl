#!/usr/bin/env perl
use strict;
use warnings;
use feature qw/ say /;

chomp(my $size = <STDIN>);
my ($X, $Y) = split(/ /, $size);

my @space = ();
my $now_colony_id = 0;

for (1..$Y) {
  chomp(my $line = <STDIN>);
  push(@space, [ map +{ lived => $_ }, split(//, $line) ]);
}

sub search {
  my ($y, $x, $colony_id) = @_;
  my $cell = $space[$y][$x];
  return if (not $cell->{lived}) || $cell->{scaned};
  $cell->{scaned} = 1; # true
  $colony_id ||= ($cell->{colony_id} = ++$now_colony_id);

  # right
  if ($x+1 < $X && $space[$y][$x+1]->{lived}) {
    search($y, $x+1, $colony_id);
  }
  # below
  if ($y+1 < $Y && $space[$y+1][$x]->{lived}) {
    search($y+1, $x, $colony_id);
  }
  # left
  if ($x > 0 && $space[$y][$x-1]->{lived}) {
    search($y, $x-1, $colony_id);
  }
  # below
  if ($y > 0 && $space[$y-1][$x]->{lived}) {
    search($y-1, $x, $colony_id)
  }
}

for my $y (0..$Y-1) { # must begin at from 0
  for my $x (0..$X-1) {
    search($y, $x);
  }
}

say $now_colony_id;
