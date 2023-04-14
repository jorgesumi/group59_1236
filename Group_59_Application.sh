# Computer Logic - COMP1236
#	4/11/2023
# 	Group 59 - Final Project
#	Members:
#	     - Jorge Sumi, 101406039
#	     - Deep Gajjar, student number
#	     - Shubh Vipulkumar Patel, student number



# tput variables:
# -font modifiers:
	bold=$(tput bold)
	normal=$(tput sgr0)
	smul=$(tput smul)
	rmul=$(tput rmul)
# -background colours:
	bg_red=$(tput setab 1)
	bg_blue=$(tput setab 4)
	bg_grey=$(tput setab 7)
# -font colours:
	fg_black=$(tput setaf 0)
	fg_red=$(tput setaf 1)
	fg_green=$(tput setaf 2)
	fg_yellow=$(tput setaf 3)
	fg_white=$(tput setaf 9)
# -char limit:
	char=[0-9]

# Task 1
task_01 () {
	# This program takes two numeric inputs(x and y) and searches the set of numbers inbetween x and y for the even triangular numbers
	echo "${fg_red}${bold}>>>	${fg_yellow}${bg_red}${smul}Task 1:${normal}"
	
	# input_1
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a non negative number: "
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" input_1
	
	
	# Checks if input_1 is a valid input or if input_1 < 0
	while ! [[ $input_1 =~ $char ]] || [ $input_1 -lt 0 ]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$input_1${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a non negative number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" input_1
	done

	# input_2
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a second non negative number greater than the last: "
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" input_2
	
	# Checks if input_2 is valid
	while ! [[ $input_2 =~ $char ]] || [ $input_2 -lt $input_1 ]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$input_2${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a second non negative number greater than the last: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" input_2
	done
	
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Processing..."

	# Variable that iterates through the set
	x=$[$input_1+1]
	# Array for even triangular numbers
	eqTris=()
	# Variable used for finding the perfect square
	y=0

	# While x is within the given set.
	while [ $input_1 -lt $x ] && [ $x -lt $input_2 ]
	do
		# Finds the closest perfect square less than 2x
		if [ $[$y*$y] -lt $[2*$x] ] && [ $[2*$x] -lt $[($y+1)*($y+1)] ];
		then
			# Checks if x is a triangular number by using y(The sqrt of the closest perfect square)
			if [ $[($y*($y+1))/2] -eq $x ];
			then
				# Checks if x is even
				if [ $[$x%2] -eq 0 ];
				then
					# Adds x to the set of even, triangular numbers and iterates x and y
					eqTris+=($x)
					x=$[$x+1]
					y=$[$y+1]
				else
					# Iterates x and y
					x=$[$x+1]
					y=$[$y+1]
				fi
			else
				# Iterates x
				x=$[$x+1]
			fi
		# Decides whether x or y needs to be iterated
		elif [ $[ ($y+1)*($y+1) ] -lt $[ 2*$x ] ];
		then
			# Iterates y
			y=$[$y+1]
		else
			# Iterates x
			x=$[$x+1]
		fi
	done

	# len = number of even triangular numbers
	len=${#eqTris[@]}

	echo "${fg_red}${bold}   	   |- ${fg_green}Your set, ($input_1-$input_2), of Even Triangular numbers is:"
	echo -n "${fg_red}${bold}   	   |-  ${smul}${fg_green}("
	# Loops through the set of even triangular numbers, and, prints each even triangular number
	for (( i=0; i<=$[$len-1]; i++ ))
	do
		# Checks if eqTris[i] is the final value in the list if so closing brackets are printed
		if [ $i -eq $[$len-1] ];
		then
			echo -n "${smul}${fg_green}${bold}${eqTris[$i]})${normal}"
		else
			echo -n "${smul}${fg_green}${bold}${eqTris[$i]}, ${normal}"
		fi
	done
	echo
	echo
}

# Task 2
task_02 () {
	echo "${fg_red}${bold}>>>	${fg_yellow}${bg_red}${smul}Task 2:${normal}"
	# Number of outputs
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}How many numbers do you want to find?"
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_1
	
	# Checks if number_1 is a valid number
	while ! [[ $number_1 =~ $char ]] || [ $number_1 -lt 0 ]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$number_1${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a non negative number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_1
	done
	
	# Base multiple
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Enter a number to check for multiple:"
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_2
	
	# Checks if number_2 is a valid number
	while ! [[ $number_2 =~ $char ]] || [ $number_2 -lt 0 ]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$number_2${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a non negative number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_2
	done
	number_found=0
	
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Processing..."
	
	# Prints the results
	for((i=2;number_found<number_1; i+=2 ));
	do
		product=$((i*(i+2)))
		if((product % 2==0));
		then
			if((product % number_2 ==0));
			then
				echo "${fg_red}${bold}   	   |-  ${fg_green}${smul}$product${rmul} is a multiple of ${smul}$number_2${rmul}"
			else
				echo "${fg_red}${bold}   	   |-  ${fg_green}${smul}$product${rmul} is not a multiple of ${smul}$number_2${rmul}"
			fi
			((number_found++))
		fi
	done
	echo
	echo
}

# Task 3
task_03 () {
	# This program finds the terms of the function 'an^2 + bn + c' and returns one of two different answers based off the users choice
	echo "${fg_red}${bold}>>>	${fg_yellow}${bg_red}${smul}Task 3:${normal}"
	
	# Sets a variable
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a number: "
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" a
	
	# Checks if a is a number
	while ! [[ $a =~ $char ]]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$a${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" a
	done
	
	# Sets b variable
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give another number: "
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" b
	
	# Checks if b is a number
	while ! [[ $b =~ $char ]]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$b${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" b
	done
	
	# Sets c variable
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give another, another number: "
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" c
	
	# Checks if c is a number
	while ! [[ $c =~ $char ]]
	do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$c${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" c
	done
}


# Function to allow easy calling of the task menu
tMenu () {

	# GUI of the menu
	echo "${bg_blue}${fg_white}${smul}${bold}				 Group 59 - Final Project ${normal}"
	echo "${fg_yellow}${bold}#=======================================================================================#"
		echo "${fg_yellow}${bold}|                                                                   			|"
		echo "${fg_yellow}${bold}|		${fg_green}${smul}${bold}Tasks:${normal}${rmul}									${fg_yellow}${bold}|"
		echo "${fg_yellow}${bold}|      		${fg_red}>>>                                                  			${fg_yellow}${bold}|"
		echo "${fg_yellow}${bold}|		${fg_red}>>>	${normal}${fg_green}T.) Task 1 - Triangle Numbers					${fg_yellow}${bold}|"
		echo "${fg_yellow}${bold}|		${fg_red}>>>	${normal}${fg_green}P.) Task 2 - Product of Non-Negatives				${fg_yellow}${bold}|"
		echo "${fg_yellow}${bold}|		${fg_red}>>>	${normal}${fg_green}Q.) Task 3 - Quadratic Sequences				${fg_yellow}${bold}|"
		echo "${fg_yellow}${bold}|		${fg_red}>>>	${normal}${fg_green}E.) Exit							${fg_yellow}${bold}|"
		echo "${fg_yellow}${bold}|                                                                   			|"
		echo "${fg_yellow}${bold}#=======================================================================================#"
		echo

	# Selection loop
	for (( ; ; ))
	do
		echo "${fg_red}${bold}>>>	${fg_green}Select an option using [1-4], or the listed letters: "
		# Creates a variable of the users choice
		read -p "${fg_red}${bold}>>>	${normal}${fg_green} " ans_02

		# Task menu and relative instructions
		case $ans_02 in
			1|T|t) task_01;;
			2|P|p) task_02;;
			3|Q|q) task_03;;
			4|E|e) clear
				echo "${fg_red}${bold}>>>	${normal}${fg_green}${fg_bold}Exiting Application"
				exit 0;;
			*) echo "${fg_red}${bold}>>>	${fg_green}Sorry ${smul}$ans_01${rmul}${fg_green} is not an option";;
		esac
	done
}



clear
# GUI of the menu
echo "${bg_blue}${smul}${bold}				 Group 59 - Final Project ${normal}"
echo "${fg_yellow}${bold}#=======================================================================================#"
echo "${fg_yellow}${bold}|                                                                   			|"
echo "${fg_yellow}${bold}|		${fg_green}${smul}${bold}Welcome to our application, please select an option:${rmul}			${fg_yellow}|"
echo "${fg_yellow}${bold}|      		${fg_red}>>>                                                  			${fg_yellow}${bold}|"
echo "${fg_yellow}${bold}|		${fg_red}>>>	${normal}${fg_green}C.) Continue with the application				${fg_yellow}${bold}|"
echo "${fg_yellow}${bold}|		${fg_red}>>>	${normal}${fg_green}E.) Exit							${fg_yellow}${bold}|"
echo "${fg_yellow}${bold}|                                                                   			|"
echo "${fg_yellow}${bold}#=======================================================================================#"
echo

# Selection loop
for (( ; ; ))
do
	echo "${fg_red}${bold}>>>	${fg_green}Select an option using [1-2], or the listed letters: "
	# Creates a variable of the users choice
	read -p "${fg_red}${bold}>>>	${normal}${fg_green} " ans_01

	# Launch menu
	case $ans_01 in
		1|C|c) clear
			tMenu;;
		2|E|e) clear
			echo "${fg_red}${bold}>>>	${fg_green}${fg_bold}Exiting Application"
			exit 0;;
		*) echo "${fg_red}${bold}>>>	${fg_green}Sorry ${smul}$ans_01${rmul}${fg_green} is not an option";;
	esac
done

