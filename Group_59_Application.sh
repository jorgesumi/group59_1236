# Computer Logic - COMP1236
#	4/11/2023
# 	Group 59 - Final Project
#	Members:
#	     - Jorge Sumi, 101406039
#	     - Deep Gajjar



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

# Name:
	name=""
# Char limit:
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
	while ! [[ $input_2 =~ $char ]] || [ $input_2 -le $input_1 ]
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

	# Prints results
	echo "${fg_red}${bold}   	   |- ${fg_green}Your set, ($input_1-$input_2), of Even Triangular numbers is:"
	echo -n "${fg_red}${bold}   	   |-  ${smul}${fg_green}${smul}(${eqTris[*]})${rmul}"

	echo
	echo
}

# Task 2
task_02 () {
	echo "${fg_red}${bold}>>>	${fg_yellow}${bg_red}${smul}Task 2:${normal}"
	# This line print message to user to enter input of number
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}How many numbers do you want to find?"
	# This line store input of user
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_1

	# Checks if number_1 is a valid number
	while ! [[ $number_1 =~ $char ]] || [ $number_1 -lt 0 ]
	do
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$number_1${rmul} is not a valid input."
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a non negative number: "
		read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_1
	done

	# This line print message to user to input to find multiple
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Enter a number to check for multiple:"
	# This line store value of user input to check multiple
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_2

	# Checks if number_2 is a valid number
	while ! [[ $number_2 =~ $char ]] || [ $number_2 -lt 0 ]
	do
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$number_2${rmul} is not a valid input."
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a non negative number: "
		read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" number_2
	done
	# This line track how many numbers want to check
	number_found=0

	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Processing..."

	# This line keep loop unless number_found is equal to number_1,
	# I initialized variable to 2 and increment by 2
	for((i=2;number_found<number_1; i+=2 ));
	do
		# This line do product of i and i+2, and store in $product
		product=$((i*(i+2)))
		# This line check product is even or not, then it initialized if statement
		if((product % 2==0));
		then
			# This line check product is multiple  of number_2
			if((product % number_2 ==0));
			then
				# This line print product is multiple of number_2
				echo "${fg_red}${bold}   	   |-  ${fg_green}${smul}$product${rmul} is a multiple of ${smul}$number_2${rmul}"
			else
				# This line print product is not multipleof number_2
				echo "${fg_red}${bold}   	   |-  ${fg_green}${smul}$product${rmul} is not a multiple of ${smul}$number_2${rmul}"
			fi
			# This line increment number_found variable by 1
			((number_found++))
		# This line end the inner if statement
		fi
	# This line end the for loop
	done
	echo
	echo
}

# Task 3
task_03 () {
	# This program finds the terms of the function 'an^2 + bn + c' and returns one of two different answers based off the users choice
	echo "${fg_red}${bold}>>>	${fg_yellow}${bg_red}${smul}Task 3:${normal}"

	# Variables
	n=1
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


	echo "${fg_red}${bold}   	   |- ${fg_green}Your function is ${smul}${a}n^2 + ${b}n + $c${rmul}"
	echo "${fg_red}${bold}   	   |- ${fg_green}Do you want to:"
	echo "${fg_red}${bold}   	   |- 	${fg_green}1) Find x amount of terms in your function"
	echo "${fg_red}${bold}   	   |- 	${fg_green}or"
	echo "${fg_red}${bold}   	   |- 	${fg_green}2) Find the nth term and check if its a factor of a number of your choosing"
	echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Select an option using [1-2]: "
	read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" opt

	# Checks if opt is a valid input
	while ! [[ $opt =~ [1-2] ]] 
	do
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$opt${rmul} is not a valid input."
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Select an option using [1-2]: "
		read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" opt
	done


	if [ $opt == 1 ]
	# Option 1
	then
		terms=()
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a positive number: "
		read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" limit

		# Checks if limit is a valid input
		while ! [[ $limit =~ $char ]] || [ $limit -le 0 ]
		do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$limit${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a positive number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" limit
		done
		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Processing..."
		while [ $n -le $limit ]
		do
			terms+=($[$a*($n*$n)+$b*$n+$c])
			n=$[$n+1]
		done
		echo "${fg_red}${bold}   	   |- ${fg_green}The first $limit terms are: "
		echo "${fg_red}${bold}   	   |-  ${smul}${fg_green}(${terms[*]})${rmul}"

	# Option 2
	else
		echo "${fg_red}${bold}   	   |- ${fg_green}What term do you want to find: "
		read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" n

		# Checks if n is a valid input
		while ! [[ $n =~ $char ]]
		do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$n${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}What term do you want to find: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" n
		done

		# Calculates the nth term
		t3_ans=$[$a*($n*$n) + $b*$n + $c]


		echo "${fg_red}${bold}   	   |- ${fg_green}Enter a number to check if the ${n}th term is a factor of it: "
		read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" factor

		# Check if factor is a valid input
		while ! [[ $factor =~ $char ]]
		do
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}${smul}$factor${rmul} is not a valid input."
			echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Give a number: "
			read -p "${fg_red}${bold}   	   |   ${normal}${fg_green}" factor
		done

		echo "${fg_red}${bold}   	   |- ${fg_green}${fg_bold}Processing..."

		# Determines whether t3_ans is a factor of factor
		if [ $[$factor % $t3_ans] -eq 0 ]
		then
			echo "${fg_red}${bold}   	   |- ${fg_green}The ${n}th term is ${smul}$t3_ans${rmul}. This term is a factor of ${smul}$factor${rmul}"
		else
			echo "${fg_red}${bold}   	   |- ${fg_green}The ${n}th term is ${smul}$t3_ans${rmul}. This term is not a factor of ${smul}$factor${rmul}"
		fi
	fi
	echo
	echo
}

# Function to allow easy calling of the launch menu
lmenu () {
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

	echo "${fg_red}${bold}>>>	${fg_green}Welcome to our project ${name}!"
	# Selection loop
	for (( ; ; ))
	do
		echo "${fg_red}${bold}>>>	${fg_green}Please select an option using [1-2], or the listed letters: "
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
echo "Welcome! What is your name?"
read -p "" name
clear
lmenu
