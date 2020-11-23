#!/usr/bin/perl
#This program is to read the fasta file and to find the position of mutation and change in the nucleotides 
#Jyotishpal Deka
#Enrollment Number - BBI17013
#Course Code: CS610
#Semester: Integrated M. Sc. 7th semester, Biosciences and Bioinformatics
#Department: Molecular Biology and Biotechnology, Tezpur University

open(FH1,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq1.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq1.fasta not found"; #To read the fasta file in the FASTA format
open(FH9,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq9.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq9.fasta not found"; #To read the fasta file in the FASTA format
open(FH2,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq2.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq2.fasta not found";#To read the fasta file in the FASTA format
open(FH3,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq3.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq3.fasta not found";#To read the fasta file in the FASTA format
open(FH4,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq4.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq4.fasta not found";#To read the fasta file in the FASTA format
open(FH5,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq5.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq5.fasta not found";#To read the fasta file in the FASTA format
open(FH6,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq6.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq6.fasta not found";#To read the fasta file in the FASTA format
open(FH7,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq7.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq7.fasta not found";#To read the fasta file in the FASTA format
open(FH8,"Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq8.fasta") || die "File Helicobacter-bizzozeronii-CIII-1-outer-membrane-protein-seq8.fasta not found";#To read the fasta file in the FASTA format
open(FH,">Mutation-in-sequence.txt") || die "File cannot be created"; #To write the output of the program to Mutation-in-sequence-1.txt file 

chomp(@arr_genome1=<FH1>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome2=<FH2>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome3=<FH3>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome4=<FH4>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome5=<FH5>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome6=<FH6>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome7=<FH7>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome8=<FH8>); #removing the trailing new lines from the sequence in the fasta and storing it in the array
chomp(@arr_genome9=<FH9>); #removing the trailing new lines from the sequence in the fasta and storing it in the array

close(FH1) || warn "File handler 1 failed to close"; #closing the file handler
close(FH2) || warn "File handler 2 failed to close"; #closing the file handler
close(FH3) || warn "File handler 3 failed to close"; #closing the file handler
close(FH4) || warn "File handler 4 failed to close"; #closing the file handler
close(FH5) || warn "File handler 5 failed to close"; #closing the file handler
close(FH6) || warn "File handler 6 failed to close"; #closing the file handler
close(FH7) || warn "File handler 7 failed to close"; #closing the file handler
close(FH8) || warn "File handler 8 failed to close"; #closing the file handler
close(FH9) || warn "File handler 9 failed to close"; #closing the file handler

shift(@arr_genome1); #removing the first line in the fasta file 
shift(@arr_genome2); #removing the first line in the fasta file 
shift(@arr_genome3); #removing the first line in the fasta file
shift(@arr_genome4); #removing the first line in the fasta file
shift(@arr_genome5); #removing the first line in the fasta file
shift(@arr_genome6); #removing the first line in the fasta file
shift(@arr_genome7); #removing the first line in the fasta file
shift(@arr_genome8); #removing the first line in the fasta file
shift(@arr_genome9); #removing the first line in the fasta file

$whole_genome1 = join("",@arr_genome1); #connecting all the elements in the array to the string variable
$whole_genome2 = join("",@arr_genome2); #connecting all the elements in the array to the string variable
$whole_genome3 = join("",@arr_genome3); #connecting all the elements in the array to the string variable
$whole_genome4 = join("",@arr_genome4); #connecting all the elements in the array to the string variable
$whole_genome5 = join("",@arr_genome5); #connecting all the elements in the array to the string variable
$whole_genome6 = join("",@arr_genome6); #connecting all the elements in the array to the string variable
$whole_genome7 = join("",@arr_genome7); #connecting all the elements in the array to the string variable
$whole_genome8 = join("",@arr_genome8); #connecting all the elements in the array to the string variable
$whole_genome9 = join("",@arr_genome9); #connecting all the elements in the array to the string variable

@genome1 = split("",$whole_genome1); #splitting the string into array of substrings 
@genome2 = split("",$whole_genome2); #splitting the string into array of substrings
@genome3 = split("",$whole_genome3); #splitting the string into array of substrings
@genome4 = split("",$whole_genome4); #splitting the string into array of substrings
@genome5 = split("",$whole_genome5); #splitting the string into array of substrings
@genome6 = split("",$whole_genome6); #splitting the string into array of substrings
@genome7 = split("",$whole_genome7); #splitting the string into array of substrings
@genome8 = split("",$whole_genome8); #splitting the string into array of substrings
@genome9 = split("",$whole_genome9); #splitting the string into array of substrings

$genome_length1 = length($whole_genome1); #finding the length of the total sequence
$genome_length2 = length($whole_genome2); #finding the length of the total sequence
$genome_length3 = length($whole_genome3); #finding the length of the total sequence
$genome_length4 = length($whole_genome4); #finding the length of the total sequence
$genome_length5 = length($whole_genome5); #finding the length of the total sequence
$genome_length6 = length($whole_genome6); #finding the length of the total sequence
$genome_length7 = length($whole_genome7); #finding the length of the total sequence
$genome_length8 = length($whole_genome8); #finding the length of the total sequence
$genome_length9 = length($whole_genome9); #finding the length of the total sequence

print FH "Total length of the reference sequence is:\t$genome_length9\n";
print FH "Total length of the compared sequence 1 is:\t$genome_length1\n";
print FH "Total length of the compared sequence 2 is:\t$genome_length2\n";
print FH "Total length of the compared sequence 3 is:\t$genome_length3\n";
print FH "Total length of the compared sequence 4 is:\t$genome_length4\n";
print FH "Total length of the compared sequence 5 is:\t$genome_length5\n";
print FH "Total length of the compared sequence 6 is:\t$genome_length6\n";
print FH "Total length of the compared sequence 7 is:\t$genome_length7\n";
print FH "Total length of the compared sequence 8 is:\t$genome_length8\n\n";

print FH "Mutation in sequence 1 with respect to the reference sequence (i.e. sequence 9) are as follows - \n";
	for($count = 0; $count <= $#genome9; $count++) #loop to find the position of mutation and to identify the nucleotide change in the position
	{
        	if($genome9 [$count] ne $genome1 [$count]){
			print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome1[$count]\n";} #printing the mutation position and the nucleotide changes.
	}

print FH "\nMutation in sequence 2 with respect to the refernce sequence (i.e. sequence 9) are as follows - \n";
	for ($count = 0; $count <= $#genome9; $count++)
	{
		if($genome9 [$count] ne $genome2 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome2[$count]\n";} 
	}

print FH "\nMutation in sequence 3 with respect to the reference sequence (i.e. sequence 9) are as follows -\n";
	for($count = 0; $count <= $#genome9; $count++)
	{
		if($genome9 [$count] ne $genome3 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome3[$count]\n";}
	}

print FH "\nMutation in sequence 4 with respect to the reference sequence (i.e. sequence 9) are as follows -\n";
	for($count = 0; $count <= $#genome9; $count++)
	{	
        	if($genome9 [$count] ne $genome4 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome4[$count]\n";}
	}

print FH "\nMutation in sequence 5 with respect to the reference sequence (i.e. sequence 9) are as follows -\n";
	for($count = 0; $count <= $#genome9; $count++)
	{
        	if($genome9 [$count] ne $genome5 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome5[$count]\n";}
	}

print FH "\nMutation in sequence 6 with respect to the reference sequence (i.e. sequence 9) are as follows -\n";
	for($count = 0; $count <= $#genome9; $count++)
	{
        	if($genome9 [$count] ne $genome6 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome6[$count]\n";}
	}

print FH "\nMutation in sequence 7 with respect to the reference sequence (i.e. sequence 9) are as follows -\n";
	for($count = 0; $count <= $#genome9; $count++)
	{
        	if($genome9 [$count] ne $genome7 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome7[$count]\n";}
	}

print FH "\nMutation in sequence 8 with respect to the reference sequence (i.e. sequence 9) are as follows -\n";
	for($count = 0; $count <= $#genome9; $count++)
	{
        	if($genome9 [$count] ne $genome8 [$count]){print FH "Mutation found at position $count from \t$genome9[$count] ---> $genome8[$count]\n";}
	}

close(FH); #closing the file handler of in the file the output will be written to. 

