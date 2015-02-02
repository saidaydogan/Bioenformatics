#!/usr/bin/perl
# HOMEWORK 2 - SIDDIK SAID AYDOGAN - 11011052
use strict;
use warnings;    

#DNA bir string olarak veriliyor
my $dna = 'CGACGTCTTCGTACGGGACTAGCTCGTGTCGGTCGC';
#Protein de string olarak tutuluyor.
my $protein = '';
#DNA dan ucer ucer secilen kodlarin tulucagi degisken.
my $codon;

#HASH tanimi yapiliyor. KEY-VALUE eslemeleri belirtiliyor.
my(%genetic_code) = (    
    'TCA' => 'S',    
    'TCC' => 'S',    
    'TCG' => 'S',    
    'TCT' => 'S',    
    'TTC' => 'F',    
    'TTT' => 'F',    
    'TTA' => 'L',    
    'TTG' => 'L',    
    'TAC' => 'Y',    
    'TAT' => 'Y',    
    'TAA' => '_',    
    'TAG' => '_',    
    'TGC' => 'C',    
    'TGT' => 'C',    
    'TGA' => '_',    
    'TGG' => 'W',    
    'CTA' => 'L',    
    'CTC' => 'L',    
    'CTG' => 'L',    
    'CTT' => 'L',    
    'CCA' => 'P',    
    'CCC' => 'P',    
    'CCG' => 'P',    
    'CCT' => 'P',    
    'CAC' => 'H',    
    'CAT' => 'H',    
    'CAA' => 'Q',    
    'CAG' => 'Q',    
    'CGA' => 'R',    
    'CGC' => 'R',    
    'CGG' => 'R',    
    'CGT' => 'R',    
    'ATA' => 'I',    
    'ATC' => 'I',    
    'ATT' => 'I',    
    'ATG' => 'M',    
    'ACA' => 'T',    
    'ACC' => 'T',    
    'ACG' => 'T',    
    'ACT' => 'T',    
    'AAC' => 'N',    
    'AAT' => 'N',    
    'AAA' => 'K',    
    'AAG' => 'K',    
    'AGC' => 'S',    
    'AGT' => 'S',    
    'AGA' => 'R',    
    'AGG' => 'R',    
    'GTA' => 'V',    
    'GTC' => 'V',    
    'GTG' => 'V',    
    'GTT' => 'V',    
    'GCA' => 'A',    
    'GCC' => 'A',    
    'GCG' => 'A',    
    'GCT' => 'A',    
    'GAC' => 'D',    
    'GAT' => 'D',    
    'GAA' => 'E',    
    'GAG' => 'E',    
    'GGA' => 'G',    
    'GGC' => 'G',    
    'GGG' => 'G',    
    'GGT' => 'G',    
    );

#DNA dan ucer ucer secilen kodlar, HASH tablosunda bulunup ilgili amino asit degeri yaziliyor.
for(my $i=0; $i < (length($dna) - 2) ; $i += 3) {
    $codon = substr($dna,$i,3);
    $protein .= $genetic_code{$codon};
}

print "DNA:\n\n$dna\n\nProtein:\n\n$protein\n\n";

exit;