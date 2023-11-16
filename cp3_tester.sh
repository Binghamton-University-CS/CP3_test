#!/usr/bin/env bash

# HOW TO RUN:
# 
# 1. Copy the bash file (cp3_tester.h) and the expect file (cp3_subroutine.exp) to the same directory as your executable (e.g., bin directory).
# 2. cd to the directory of your executable (e.g., bin directory).
# 3. Execute the following command: 
#    "bash cp3_tester.sh ./<executable> <testcase-number>"
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

# test-case 2 : 
tests[2]="
add_movie 1 2022 SS Rajamouli RRR
add_movie 1 2022 SS Rajamouli RRR
add_movie 2 2010 Cameroon James Test
register_actor 1 Konidela Ram Charan
register_actor 2 Jr NTR
register_actor 3 Bhatt Alia
join_cast 1 1
join_cast 3 1
join_cast 2 1
join_cast 1 2
cast 4
cast 1
career 1
remove_actor 2
remove_actor 3
cast 1
career 1
remove_movie 2
career 1
quit
"

# DESIRED RESULTS
declare -A desired_result

desired_result[1]="
add_movie 1 1977 Bednam John SaturdayNightFever
add_movie: Added SaturdayNightFever (1977) directed by John Bednam
add_movie 1 1990 Scorsese Martin Goodfellas
add_movie: Error movie id 1 already in use
remove_movie 2
remove_movie: Error movie id 2 does not exist
register_actor 22 Travolta John
register_actor: Registered actor John Travolta
register_actor 22 Pacino Al
register_actor: Error actor id 22 already in use
register_actor 21 Gorney Karen
register_actor: Registered actor Karen Gorney
join_cast 22 1
join_cast: Added actor John Travolta to the cast of SaturdayNightFever
join_cast: Associated movie SaturdayNightFever with John Travolta
join_cast 22 2
join_cast: Error movie id 2 does not exist
join_cast 23 1
join_cast: Error actor id 23 does not exist
join_cast 21 1
join_cast: Added actor Karen Gorney to the cast of SaturdayNightFever
join_cast: Associated movie SaturdayNightFever with Karen Gorney
cast 1
SaturdayNightFever features:
- Karen Gorney
- John Travolta
"

desired_result[2]="
register_actor: Registered actor Ram Konidela
register_actor 2 Jr NTR
register_actor: Registered actor NTR Jr
register_actor 3 Bhatt Alia
register_actor: Registered actor Alia Bhatt
join_cast 1 1
join_cast: Added actor Ram Konidela to the cast of RRR
join_cast: Associated movie RRR with Ram Konidela
join_cast 3 1
join_cast: Added actor Alia Bhatt to the cast of RRR
join_cast: Associated movie RRR with Alia Bhatt
join_cast 2 1
join_cast: Added actor NTR Jr to the cast of RRR
join_cast: Associated movie RRR with NTR Jr
join_cast 1 2
join_cast: Added actor Ram Konidela to the cast of Test
join_cast: Associated movie Test with Ram Konidela
cast 4
cast: Error movie id 4 does not exist
cast 1
RRR features:
- Ram Konidela
- NTR Jr
- Alia Bhatt
career 1
Ram Konidela has acted in:
- RRR
- Test
remove_actor 2
Removed Actor with id:2
remove_actor 3
Removed Actor with id:3
cast 1
RRR features:
- Ram Konidela
career 1
Ram Konidela has acted in:
- RRR
- Test
remove_movie 2
remove_movie: Removed Test
career 1
Ram Konidela has acted in:
- RRR
"

# INTERACTION
clear 
#interaction=$(expect cp3_subroutine.exp "$1" "$2" "${tests[$3]}" 2>&1)
#key_results=$(echo "$interaction" | tail -n20)
#echo "$interaction"

expect cp3_subroutine.exp "$1" "${tests[$2]}" 2>&1
printf "\n\n********** EXPECTED OUTPUT DESCRIPTION **********\\n\n${desired_result[$2]}\n\n\n"


exit 0


