#!/usr/bin/env bash

if [ $# -ne 2 ]; then
	echo "bash cp3_tester.sh ./<executable> <testcase-number>"
	exit 1
fi

declare -A tests

# test-case 1 : 
tests[1]="
add_movie 1 1977 Bednam John SaturdayNightFever
add_movie 1 1990 Scorsese Martin Goodfellas
remove_movie 2
register_actor 22 Travolta John
register_actor 22 Pacino Al
register_actor 21 Gorney Karen
join_cast 22 1
join_cast 22 2
join_cast 23 1
join_cast 21 1
cast 1
quit
"


# DESIRED RESULTS
declare -A desired_result
desired_result[1]="
cast 1 should output: 

	SaturdayNightFever features:
		- John Travolta
		- Karen Gorney
"

# INTERACTION
clear 
#interaction=$(expect cp3_subroutine.exp "$1" "$2" "${tests[$3]}" 2>&1)
#key_results=$(echo "$interaction" | tail -n20)
#echo "$interaction"

expect cp3_subroutine.exp "$1" "${tests[$2]}" 2>&1
printf "\n\n********** EXPECTED OUTPUT DESCRIPTION **********\\n\n${desired_result[$2]}\n\n\n"


exit 0