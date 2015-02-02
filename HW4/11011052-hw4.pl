#!/usr/bin/perl   11011052 - SIDDIK SAID AYDOGAN
use strict;
use warnings;

open( FH1, '<', "./1.txt" );    #FH1 dosya acmak icin kullanilan file handle
open( FH2, '<', "2.txt" );      #FH2 dosya acmak icin kullanilan file handle
my $txt1 = do { local $/; <FH1> };    #1.txt adli dosyadan donguyle okunuyor
my $txt2 = do { local $/; <FH2> };    #2.txt adli dosyadan donguyle okunuyor

my @array1 = split( '', $txt1 );      #okunan degerlerden dizi olusturuluyor
my @array2 = split( '', $txt2 );      #okunan degerlerden dizi olusturuluyor
my @matrix = ();                      #matris tanimi.

#degiskenler
my $i;
my $j;
my $k;
my $z;

#Odevde match 1 puan, mismatch -1 , penalty -2 olarak verilmistir.

my $match    = 1;
my $mismatch = -1;

#penalty
my $w = -2;

#dizilerin basların '-' karakteri ekleniyor
unshift @array1, '-';
unshift @array2, '-';

my $point  = 0;
my $point1 = 0;
my $point2 = 0;
my $point3 = 0;
my $yol    = -1;

# yol icin, eger diyagonelden gelindiyse 1,  yandan gelindiyse 2 , ustten gelindiyse 3 belirlenecek
my @yollar = ();
$k = 0;

$matrix[0][0] = 0;

for ( $i = 1 ; $i < scalar(@array1) ; $i++ ) {
    $matrix[0][$i] = ( $w * $i );
}
for ( $j = 1 ; $j < scalar(@array2) ; $j++ ) {
    $matrix[$j][0] = ( $w * $j );
}

for ( $i = 1 ; $i < scalar(@array2) ; $i++ ) {
    for ( $j = 1 ; $j < scalar(@array1) ; $j++ ) {
        if ( $array2[$i] eq $array1[$j] ) {
            $point = $match;
        }
        else {
            $point = $mismatch;
        }
        $point1 = $matrix[ $i - 1 ][ $j - 1 ] + $point;
        $point2 = $matrix[$i][ $j - 1 ] + $w;

        # En büyük puan degeri bulunur
        if ( $point1 >= $point2 ) {

            #diyagonelden geldi
            $yollar[$k] = 1;
            $point = $point1;

        }
        if ( $point2 > $point1 ) {

            #yandan geldi
            $yollar[$k] = 2;

            $point = $point2;

        }

        $point3 = $matrix[ $i - 1 ][$j] + $w;

        if ( $point3 > $point ) {
            $point = $point3;

            # üstten geldi
            $yollar[$k] = 3;

        }
        $matrix[$i][$j] = $point;
        $k++;
    }
}

printf( "%5s", "" );
for ( $k = 0 ; $k < scalar(@array1) ; $k++ ) {

    # En uste birinci akistan gelenler yazdiriliyor.
    printf( "%5s", "$array1[$k]" );

}

print "\n";
for ( $i = 0 ; $i < scalar(@array2) ; $i++ ) {

    # Ikinci akisi dikey olarak yazdirmak icin buraya eklendi.
    printf( "%5s", $array2[$i] );
    for ( $j = 0 ; $j < scalar(@array1) ; $j++ ) {
        printf( "%5s", $matrix[$i][$j] );
    }
    print "\n";
}

print "\n\n\n";

#dizilerin basların '-' karakteri kaldırılıyor
shift @array1, '-';
shift @array2, '-';
my $gelinenYol = 0;

# En uste birinci akistan gelenler yazdiriliyor.
for ( $k = 0 ; $k < scalar(@array1) ; $k++ ) {
    printf( "%5s", "$array1[$k]" );
}
my $M = scalar(@array1);
my $N = scalar(@array2);

$i = scalar(@array2);
$j = scalar(@array1);
print $j;
$z = $i * $j - 1;
for ( $k = 0 ; $k < scalar(@yollar) ; $k++ ) {
    printf( "\n %5s", "$k - $yollar[$k] \n" );
}

# Geriye donme ve yol bulma yapiliyor.

my @yollar2 = ();
$k = 0;
while ( ( $i > 0 && $j > 0 ) && $z >= 0 ) {
    printf( "%5s", "\n $i $j $z $yollar[$z] $array2[$i-1] $array1[$j-1] \n" );
    $gelinenYol = $yollar[$z];

    if ( $array2[ $i - 1 ] eq $array1[ $j - 1 ] ) {
        $yollar2[$k] = 1;

    }

    #diyagonel
    if ( $yollar[$z] == 1 ) {

        if ( $array2[ $i - 1 ] ne $array1[ $j - 1 ] ) {
            $yollar2[$k] = -1;

        }
        $i--;
        $j--;
        $z = $z - $M - 1;
    }

    #yandan geldi
    elsif ( $yollar[$z] == 2 ) {
        if ( $array2[ $i - 1 ] ne $array1[ $j - 1 ] ) {
            $yollar2[$k] = 0;
        }
        $j--;
        $z--;

    }

    #ustten geldi
    elsif ( $yollar[$z] == 3 ) {
        if ( $array2[ $i - 1 ] eq $array1[ $j - 1 ] ) {
            if ( $array2[ $i - 1 ] ne $array1[ $j - 1 ] ) {
                $yollar2[$k] = 0;
            }

        }

        $i--;
        $z = $z - $M;

    }
    $k++;

}

for ( $k = 0 ; $k < scalar(@array1) ; $k++ ) {
    printf( "%5s", "$array1[$k]" );
}
printf( "%5s", "\n" );


for ( $k = 0 ; $k < scalar(@yollar2) ; $k++ ) {
  
    if ( $yollar2 [$k] == 1 ) {
        printf( "%5s", "|" );     
    }
    if ( $yollar2 [$k] == -1 ) {
        printf( "%5s", " " );     

    }
    if ($yollar2 [$k] == 0 ) {
        printf( "%5s", "-" );    

    }
}


print "\n";

close FH1;
close FH2;
