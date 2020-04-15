#!/usr/bin/perl
use strict;
use warnings;
use POSIX;
use SVG;

open CAP, ">cap.svg" or die "Невозможно создать SVG-файл: $!\n";
 
our $m=100;
# create an SVG object with a size of 200x200 pixels
my $svg = SVG->new(
width => $m*2,
height => $m*2,
);

our $n=shift()+1;
#$n=10;
my $r;
my %rgb;

# add a circles
for(my $i=0;$i<$n;$i++){
$r=10+floor(rand()*($m-10));
%rgb=(R=>floor(rand()*255), G=>floor(rand()*255), B=>floor(rand()*255));

$svg->circle(
r => $r,
cx => $r+floor(rand()*2*($m-$r)),
cy => $r+floor(rand()*2*($m-$r)),
style => {
 'fill' => 'rgb('.$rgb{R}.','.$rgb{G}.','.$rgb{B}.')',
# 'fill' => 'rgb(255, 0, 0)',
 'stroke' => 'black',
 'stroke-width' => 1,
 'stroke-opacity' => .5,
 'fill-opacity' => .5,
},
);
print $r." ";
print $rgb{R}."+".$rgb{G}."+".$rgb{B}." ";
}

# now render the SVG object, implicitly use svg namespace
#print $svg->xmlify;
print CAP $svg->xmlify;
