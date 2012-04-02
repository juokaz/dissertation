#!/bin/sh

check() {
    dir="."
    chsum1=`ls -l | grep .tex | sha1sum | awk '{print $1}'`
    chsum2=$chsum1

	while :
    do
	    while [ $chsum1 = $chsum2 ]
	    do
	        sleep 1
	        chsum2=`ls -l | grep .tex | sha1sum | awk '{print $1}'`
	    done

    	chsum1=`ls -l | grep .tex | sha1sum | awk '{print $1}'`

	    latex dissertation.tex
		dvips dissertation
		ps2pdf dissertation.ps
	done
}

check $*