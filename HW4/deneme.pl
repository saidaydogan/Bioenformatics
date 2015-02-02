#! /usr/bin/perl -w
# The 'oddeven3' program - yet another version of 'oddeven'.

# $i=0;
# $ubiquitin = 'MQIFVKTLTGKT';
# @array = split(//, $ubiquitin);
# # @array = qw(M Q I F V K T L T G K T);
# $lenght = scalar @array;

# while ( $i < $lenght )
# {
# print  "$array[$i] \n";
# $i++;
# }
# sub aab () {
# $x = ($a * $b) / 2;
# return $x;
# }

# $alan1 = &aab(3, 4);

# print "$alan1 ";

# my @stuff = (
# {
# 'Jack' => 'stamp collecting',
# 'Pete' => 'golf',
# 'Lisa' => 'bus surfing',
# },

# {
# 1 => 'Mon',
# 2 => 'Tues',
# 3 => 'Wed',
# # etc.
# },
# );

# print $stuff[0]{'Jack'},"\n";
# print $stuff[1]{2}, "\n";

use strict;
use constant URL => "http://pblinux.itcarlow.ie/mersearchmulti.html";
use WWW::Mechanize;
my $browser = WWW::Mechanize->new;
while ( my $seq = <> ) {
    chomp($seq);
    print "Now processing: '$seq'.\n";
    $browser->get(URL);
    $browser->form(1);
    $browser->field( "shortsequence", $seq );
    $browser->submit;
    if ( $browser->success ) {
        my $content = $browser->content;
        while (
            $content =~ m[<tr align="CENTER"
/><td>(\w+?)</td><td>yes</td>]g
          )
        {
            print "\tAccession code: $1 matched '$seq'.\n";
        }
    }
    else {
        print "Something went wrong: HTTP status code: ",
          $browser->status, "\n";
    }
}
