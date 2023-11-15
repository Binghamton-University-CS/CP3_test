#!/usr/bin/env bash

# HOW TO RUN:
# 
# 1. Copy the bash file (cp3_tester.h) and the expect file (cp3_subroutine.exp) to the same directory as your executable (e.g., bin directory).
# 2. cd to the directory of your executable (e.g., bin directory).
# 3. Execute the following command: 
#    "bash cp3_tester_votingvariant.sh ./<executable> <testcase-number>"
# 4. Refer to the 'EXPECTED OUTPUT DESCRIPTION' output and verify if your output contains the expected result.

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