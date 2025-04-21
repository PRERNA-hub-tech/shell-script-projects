#!/bin/bash
#
#Author: Prerna Chourey
#Date: 21/04/25


#Description: File Analyzer
#

#Ask the user to enter a file name
echo "Enter the filename" #prints message
read filename #takes the input in variable filename

#check if the file exists


if [[-e "$filename"]]; then
	filepath="$filename"

else
	echo "File not found in current directory, searching in the system..."
	filepath=$(find / type -f -name "$filename" 2>/dev/null | head -n 1)

	if[[-z "$filepath"]]; then
		echo "File not found in the system."
		exit 1
	else
		echo "File found at : $filepath"
	fi
fi



# if [ -e "$filename" ]; then
# 	echo "File found"
# 	lines=$(wc -l<"$filename")
# 	words=$(wc -w<"$filename")
# 	chars=$(wc -m<"$filename")

# 	echo "Lines: $lines"
# 	echo "Words: $words"
# 	echo "Charecters: $chars"
	
# else
# 	echo "File not Found!"

# fi


