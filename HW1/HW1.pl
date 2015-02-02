#!/usr/bin/perl
use strict;
use warnings;

open( FH1, '<', "./1.txt" );    #FH1 dosya acmak icin kullanilan file handle
open( FH2, '<', "./2.txt" );    #FH2 dosya acmak icin kullanilan file handle
my $txt1 = do { local $/; <FH1> };    #1.txt adli dosyadan donguyle okunuyor
my $txt2 = do { local $/; <FH2> };    #2.txt adli dosyadan donguyle okunuyor

my @array1 = split( '', $txt1 );      #okunan degerlerden dizi olusturuluyor
my @array2 = split( '', $txt2 );      #okunan degerlerden dizi olusturuluyor
my @matrix = ();                      #matrix dizisi tanimi.

#degiskenler
my $i;
my $j;
my $k;                            

for ( $i = 0 ; $i < scalar(@array2) ; $i++ ) #dotplot icin noktalar belirleniyor
{
    for ( $j = 0 ; $j < scalar(@array1) ; $j++ ) {
        if ( $array2[$i] eq $array1[$j])    #ayni ise eger nokta konuluyor degilse bosluk konuluyor
        {
            $matrix[$i][$j] = ".";
        }
        else {
            $matrix[$i][$j] = " ";
        }
    }
}

print "  ";    #satir - sutun denk gelmesi icin eklendi

#dotplot matrisi ekrana cikti olarak veriliyor

for ( $k = 0 ; $k < scalar(@array1) ; $k++ ) {
    print " $array1[$k]";  # En uste birinci akistan gelenler yazdiriliyor. 
}

print "\n";
for ( $i = 0 ; $i < scalar(@array2) ; $i++ ) { 
    print " $array2[$i]";  # Ikinci akisi dikey olarak yazdirmak icin buraya eklendi.
    for ( $j = 0 ; $j < scalar(@array1) ; $j++ ) {
        print " $matrix[$i][$j]";
    }
    print "\n";
}

close FH1;
close FH2;