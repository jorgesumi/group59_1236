echo "How many numbers do you want to find?"
read number_1
echo "Enter a number to check for multiple:"
read number_2
number_found=0
for((i=2;number_found<number_1; i+=2 ));
do
product=$((i*(i+2)))
if((product % 2==0));
then
if((product % number_2 ==0));
then
echo "$product is a multiple of $number_2"
else
echo "$product is not a multiple of $number_2"
fi
((number_found++))
fi
done