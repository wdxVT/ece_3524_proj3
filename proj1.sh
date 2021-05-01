#!/bin/sh
# Author : Dixuan Wang ECE3524



echo "<!DOCTYPE html><html><body>" > filetree.html
function my_func
{
	var=$(ls $1)
	echo "<ul>" >> $2
	for element in $var; do
		newDir=$1"/"$element
		if [ -r $newDir ]
		then
			#echo "readable"
			#echo "$element"
			echo "<li>" >> $2
			echo "$element" >> $2
			echo "</li>" >> $2
			
			if [ -d $newDir ] 
			then
				my_func $1"/"$element $2
			fi
		#else
			#echo "not readable"
			#echo "$element"
		fi
	done
	echo "</ul>" >> $2
}
my_func ~ filetree.html
echo "</body></html>" >> filetree.html
