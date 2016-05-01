#!/usr/bin/awk -f

BEGIN {FS=","} ; 
{ 
	    system("echo -n `date -d \"" $1 "\" '+%s'`");
	    printf "|"$3"|A|"$2"/"$6"/"$NF"/x|";
	    if ($2 ~ /C2/) 
		    printf "FF0000" 
	    else if ($2 ~ /Payment/)
		    printf "00FF00"
	    else if ($2 ~ /Distrib/)
		    printf "0000FF"
            printf "|" tolower($3) "|"
	    printf "\n"
}
