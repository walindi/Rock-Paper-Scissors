# custom font
red='\033[31m'
reset='\033[0m'

echo -e "${red}WELCOME TO ROCK-PAPER-SCISSORS!$reset"
echo ""
echo -e "-ROCK beats SCISSORS\n-SCISSORS cut PAPER\n-PAPER conceals ROCK"

function choices {
	choices=("r" "p" "s")

	# Randomise CPU choice
	rand=$(( RANDOM%3 ))
	cpu_choice=${choices[$rand]}

	# User choice
	echo "Which one do you choose? ROCK, PAPER or SCISSORS? (r / p / s)"
	read -p ": " user_choice
	echo""
}


# This function compares cpu choice and user choice
function comparison {
	if [ $cpu_choice == $user_choice ]
	then
		echo "It's a tie"

	elif [ $cpu_choice == r ] && [ $user_choice == p ]
	then
		echo "Computer picked ROCK, you picked PAPER. You WIN!"

	elif [ $cpu_choice == r ] && [ $user_choice == s ]
	then
		echo "Computer picked ROCK, you picked SCISSORS. You LOSE!"

	elif [ $cpu_choice == p ] && [ $user_choice == r ]
	then
		echo "Computer picked PAPER, you picked ROCK. You LOSE!"

	elif [ $cpu_choice == p ] && [ $user_choice == s ]
	then
		echo "Computer picked PAPER, you picked SCISSORS. You WIN!"

	elif [ $cpu_choice == s ] && [ $user_choice == r ]
	then
		echo "Computer picked SCISSORS, you picked ROCK. You WIN!"

	elif [ $cpu_choice == s ] && [ $user_choice == p ]
	then
		echo "Computer picked SCISSORS, you picked PAPER. You LOSE!"

	else
		echo "Wrong input. Please try again"
		main

	fi
}


# This function asks user if they want to play again
# and returns to start or end the game
function play_again {
	echo "Do you want to play again? (y/n):"
	read input
	echo ""

	if [ $input == y ]
	then
		main
	else
		exit
	fi
}

function main {
	choices
	comparison
	play_again
}

main
