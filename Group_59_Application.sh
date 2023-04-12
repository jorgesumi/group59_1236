# Computer Logic - COMP1236
#	4/11/2023
# 	Group 59 - Final Project
#	Members:
#	     - Jorge Sumi, 101406039
#	     - Deep Gajjar, student number
#	     - Shubh Vipulkumar Patel, student number

# Menu 1
bold=$(tput bold)
normal=$(tput sgr0)
smul=$(tput smul)
rmul=$(tput rmul)
setab=$(tput setab 6)

menu_01 () {
	for (( ; ; ))
	do
		echo -n ${setab}
		echo "${smul}${bold}Group 59 - Final Project${rmul}"
		echo "	${normal}${smul}Welcome to our application, please select an option:${rmul}"
		echo "		C. Continue with the application"
		echo "		E. Exit"
		echo
		read -p "	Select an option using [1-2], or the listed letters: " ans_01

		case $ans_01 in
			1|C|c) clear
				echo "${setab}${smul}${bold}Group 59 - Final Project${normal}${rmul}"
				echo
				menu_02;;
			2|E|e) echo "Exiting Application"
				clear
				exit 0;;
			*) clear
			    echo "Sorry $ans_01 is not an option"
			    echo;;
		esac
	done
}

# Menu 2
menu_02 () {
	for (( ; ; ))
	do
		echo "	${setab}${smul}${bold}Tasks:${normal}${rmul}"
		echo "		T. Task 1 - Triangle Numbers"
		echo "		P. Task 2 - Product of Non-Negatives"
		echo "		Q. Task 3 - Quadratic Sequences"
		echo "		E. Exit"
		echo
		read -p "	Select an option using [1-4], or the listed letters: " ans_02

		case $ans_02 in
			1|T|t) ;;
			2|P|p) ;;
			3|Q|q) ;;
			4|E|e) echo "Exiting Application"
				clear
				exit 0;;
			*) echo "Sorry $ans is not an option";;
		esac
	done
}


clear
menu_01
