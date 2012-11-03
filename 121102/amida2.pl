#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Encode qw/ encode_utf8 /;
use feature qw/ say /;
use List::MoreUtils qw/ mesh /;

my $H = 10;
my $U = 'A';
my $TATE = '|';
my $YOKO = '-';
my $SPACE = ' ';


my $count = shift(@ARGV) || 5;
my @counts = 1..$count;

sub puts { say encode_utf8(+shift) }
sub line { puts join('', grep($_, mesh(@{$_[0]}, @{$_[1]}))) }

line [map{ $U++ } @counts], [map $SPACE, @counts];

for (1..$H) {
  my @yoko = map $SPACE, 0..$#counts-1;
  $yoko[rand(@yoko)] = $YOKO;
  line [map $TATE, @counts], \@yoko;
}
puts '*';

__END__
