# This program takes two numeric inputs(x and y) and searches the set of numbers inbetween x and y for the even triangular numbers

read -p "Give a non negative number: " input_1
read -p "Give a second non negative number greater than the last: " input_2

x=$[$input_1+1] # Variable that iterates through the set
eqTris=() # array for even triangular numbers
y=0 # variable used for finding the perfect square

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

# Prints each even triangular number
len=${#eqTris[@]}

for (( i=0; i<=$len; i++ ))
do
	echo "${eqTris[$i]}"
done
