#!/bin/sh
nasm -fmacho64 $1.s
if [ $? == 0 ]
then
	ld -lSystem $1.o
	if [ $? == 0 ]
	then
		./a.out
		if [ $? == 0 ]
		then
			echo "\nProgram exited with return value 0.\n"
		else
			echo "\nProgram exited abnormally!"
		fi
	fi
fi
