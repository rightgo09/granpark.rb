#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Encode qw/ encode_utf8 /;
use feature qw/ say /;
use List::MoreUtils qw/ zip /;

my $H = 10;
my $U = 'A';
my $TATE = '｜';
my $YOKO = 'ー';
my $SPACE = '　';


my $count = shift(@ARGV) || 5;
my @counts = 1..$count;

sub e { encode_utf8(+shift) }
sub p { say e(+shift) }

p join('', zip(@{[map{ ' '.$U++ } @counts]}, @{[map $SPACE, @counts]}));

for (1..$H) {
  my $y = rand(@counts);
  my @yoko = @{[map $SPACE, @counts]};
  $yoko[$y] = $YOKO;
  p join('', zip(@{[map $TATE, @counts]}, @yoko));
}



__END__
