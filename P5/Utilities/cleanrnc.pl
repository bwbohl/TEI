#!/usr/bin/perl
$clean=0;
while (<>) {
 if (/<pre/) { $clean=1; print; }
 elsif (/<\/pre/) { $clean=0; print; }
 elsif (/<eg/) { $clean=1; print; }
 elsif (/<\/eg/) { $clean=0; print; }
 elsif ($clean eq 0) { print; }
 elsif (/namespaces/) { print; }
 elsif (/namespace</) { print; }
 elsif (/>namespace/){
	s/(.*>)namespace.*/$1/;
	print;
	while (<>) {
	    if (/</) { print; last; }
	    elsif (/^namespace /) {  }
	    elsif (/^default namespace /) { }
 	    elsif (/^$/) { }
	    else {print; }
	}
    }
    else { 
	s/>namespace local = \"\"/>/;
	print; }
}
