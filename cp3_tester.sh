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

# test-case 3 : 
tests[3]="
add_movie 1 1977 Bednam John SaturdayNightFever
add_movie 2 1972 FordCoppala Francis TheGodfather
register_actor 100 Travolta John
register_actor 100 Gorney Karen
join_cast 100 1
join_cast 100 1
join_cast 100 2
join_cast 101 2
cast 1
cast 2
quit
"

# test-case 4 : 
tests[4]="
add_movie 1 1977 Bednam John SaturdayNightFever
add_movie 2 1972 FordCoppala Francis TheGodfather
add_movie 3 1974 FordCoppala Francic TheGodfatherPartII
add_movie 4 1994 Darabont Frank TheShawshankRedemption
add_movie 5 2000 Crowe Cameron AlmostFamous
add_movie 6 1990 Scorsese Martin Goodfellas
add_movie 7 1994 Tarantino Quenton PulpFiction
add_movie 8 1991 Demme Jonathan TheSilenceOfTheLambs
add_movie 9 1980 Kubrick Stanley TheShining
add_movie 10 2006 Scorsese Martin TheDeparted
add_movie 11 1997 VanSant Gus GoodWillHunting
add_movie 12 1989 Chechik Jeremiah NationalLampoon'sChristmasVacation
add_movie 13 1984 Reiner Rob ThisIsSpinalTap
add_movie 14 2005 Nolan Christopher BatmanBegins
add_movie 15 1999 Mendes Sam AmericanBeauty
add_movie 16 2014 Linklater Richard Boyhood
add_movie 17 2001 Jackson Peter TheLordOfTheRingsTheFellowshipOfTheRing
add_movie 18 1994 Zemeckis Robert ForrestGump
add_movie 19 2010 Nolan Christopher Inception
add_movie 20 1986 Scott Tony TopGun
add_movie 21 2012 Tarantino Quenton DjangoUnchained
add_movie 22 1975 Spielberg Steven Jaws
add_movie 23 2008 Boyle Danny SlumdogMillionaire
add_movie 24 2017 Nolan Christopher Dunkirk
add_movie 25 1987 Kubrick Stanley FullMetalJacket
add_movie 26 2003 Tarantino Quenton KillBillVolume1
add_movie 27 2013 Scorsese Martin TheWolfOfWallStreet
add_movie 28 1984 Spielberg Steven IndianaJonesAndTheTempleOfDoom
add_movie 29 2019 Bong Joonho Parasite
add_movie 30 2009 Cameron James Avatar
add_movie 31 1982 Spielberg Steven E.T.TheExtraTerrestrial
add_movie 32 2004 Jackson Peter TheLordOfTheRingsTheReturnOfTheKing
add_movie 33 1989 Burton Tim Batman
add_movie 34 2008 Nolan Christopher TheDarkKnight
add_movie 35 1979 Coppola Francis ApocalypseNow
add_movie 36 1999 Shyamalan MNight TheSixthSense
add_movie 37 1968 Kubrick Stanley 2001ASpaceOdyssey
add_movie 38 2016 Chazelle Damien LaLaLand
add_movie 39 2002 Spielberg Steven CatchMeIfYouCan
add_movie 40 2015 Miller George MadMaxFuryRoad
add_movie 41 1995 Fincher David Se7en
add_movie 42 1982 Ridley Scott BladeRunner
add_movie 43 2009 Tarantino Quenton InglouriousBasterds
add_movie 44 1971 Kubrick Stanley AClockworkOrange
add_movie 45 1991 Stone Oliver JFK
add_movie 46 1985 Zemeckis Robert BackToTheFuture
add_movie 47 2011 Scorsese Martin Hugo
add_movie 48 1976 DePalma Brian Carrie
add_movie 49 2018 Peele Jordan GetOut
add_movie 50 2007 Anderson Paul ThereWillBeBlood
add_movie 51 1960 Hitchcock Alfred Psycho
add_movie 52 2004 Tarantino Quenton KillBillVolume2
add_movie 53 1973 Friedkin William TheExorcist
add_movie 54 2010 Fincher David TheSocialNetwork
add_movie 55 1994 Gump Zemeckis Forrest
add_movie 56 1998 Wachowski Lana TheMatrix
add_movie 57 2006 Nolan Christopher ThePrestige
add_movie 58 1980 Cimino Michael Heaven'sGate
add_movie 59 1979 Coppola Francis ApocalypseNow
add_movie 60 1990 Levinson Barry RainMan
add_movie 61 1967 Nichols Mike TheGraduate
add_movie 62 1986 Howard Ron Apollo13
add_movie 63 1976 Carpenter John AssaultOnPrecinct13
add_movie 64 2014 Iñárritu Alejandro Birdman
add_movie 65 2001 Kubrick Stanley ABeautifulMind
add_movie 66 1975 Kubrick Stanley BarryLyndon
add_movie 67 1957 Wilder Billy WitnessForTheProsecution
add_movie 68 2007 Fincher David Zodiac
add_movie 69 1968 Kubrick Stanley 2001ASpaceOdyssey
add_movie 70 1984 Stone Oliver Scarface
add_movie 71 2013 Scorsese Martin TheWolfofWallStreet
add_movie 72 2002 Spielberg Steven MinorityReport
add_movie 73 1995 Mendes Sam AmericanBeauty
add_movie 74 1988 Zemeckis Robert WhoFramedRogerRabbit
add_movie 75 2009 Bigelow Kathryn TheHurtLocker
add_movie 76 1973 Friedkin William TheExorcist
add_movie 77 1992 Tarantino Quenton ReservoirDogs
add_movie 78 1983 Reiner Rob ThePrincessBride
add_movie 79 1979 Ashby Hal BeingThere
add_movie 80 1994 Fincher David ForrestGump
add_movie 81 2011 Scorsese Martin Hugo
add_movie 82 1985 Zemeckis Robert BacktotheFuture
add_movie 83 2018 Peele Jordan GetOut
add_movie 84 2007 Anderson Paul ThereWillBeBlood
add_movie 85 1960 Hitchcock Alfred Psycho
add_movie 86 2004 Tarantino Quenton KillBillVolume2
add_movie 87 1973 Friedkin William TheExorcist
add_movie 88 2010 Fincher David TheSocialNetwork
add_movie 89 1994 Gump Zemeckis Forrest
add_movie 90 1998 Wachowski Lana TheMatrix
add_movie 91 2006 Nolan Christopher ThePrestige
add_movie 92 1980 Cimino Michael Heaven'sGate
add_movie 93 1979 Coppola Francis ApocalypseNow
add_movie 94 1990 Levinson Barry RainMan
add_movie 95 1967 Nichols Mike TheGraduate
add_movie 96 1986 Howard Ron Apollo13
add_movie 97 1976 Carpenter John AssaultOnPrecinct13
add_movie 98 2014 Iñárritu Alejandro Birdman
add_movie 99 2001 Kubrick Stanley ABeautifulMind
add_movie 100 1975 Kubrick Stanley BarryLyndon
cast 1
cast 2
cast 3
cast 4
cast 5
cast 6
cast 7
cast 8
cast 9
cast 10
cast 11
cast 12
cast 13
cast 14
cast 15
cast 16
cast 17
cast 18
cast 19
cast 20
cast 21
cast 22
cast 23
cast 24
cast 25
cast 26
cast 27
cast 28
cast 29
cast 30
cast 31
cast 32
cast 33
cast 34
cast 35
cast 36
cast 37
cast 38
cast 39
cast 40
cast 41
cast 42
cast 43
cast 44
cast 45
cast 46
cast 47
cast 48
cast 49
cast 50
cast 51
cast 52
cast 53
cast 54
cast 55
cast 56
cast 57
cast 58
cast 59
cast 60
cast 61
cast 62
cast 63
cast 64
cast 65
cast 66
cast 67
cast 68
cast 69
cast 70
cast 71
cast 72
cast 73
cast 74
cast 75
cast 76
cast 77
cast 78
cast 79
cast 80
cast 81
cast 82
cast 83
cast 84
cast 85
cast 86
cast 87
cast 88
cast 89
cast 90
cast 91
cast 92
cast 93
cast 94
cast 95
cast 96
cast 97
cast 98
cast 99
cast 100
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
join_cast 22 2
join_cast: Error movie id 2 does not exist
join_cast 23 1
join_cast: Error actor id 23 does not exist
join_cast 21 1
join_cast: Added actor Karen Gorney to the cast of SaturdayNightFever
cast 1
SaturdayNightFever features:
- Karen Gorney
- John Travolta
"

desired_result[2]="
add_movie 1 2022 SS Rajamouli RRR
add_movie: Added RRR (2022) directed by Rajamouli SS
add_movie 1 2022 SS Rajamouli RRR
add_movie: Error movie id 1 already in use
add_movie 2 2010 Cameroon James Test
add_movie: Added Test (2010) directed by James Cameroon
register_actor 1 Konidela Ram Charan

Ignoring unexpected arguments
register_actor: Registered actor Ram Konidela
register_actor 2 Jr NTR
register_actor: Registered actor NTR Jr
register_actor 3 Bhatt Alia
register_actor: Registered actor Alia Bhatt
join_cast 1 1
join_cast: Added actor Ram Konidela to the cast of RRR
join_cast 3 1
join_cast: Added actor Alia Bhatt to the cast of RRR
join_cast 2 1
join_cast: Added actor NTR Jr to the cast of RRR
join_cast 1 2
join_cast: Added actor Ram Konidela to the cast of Test
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
NTR Jr removed from the program and from all casts
remove_actor 3
Alia Bhatt removed from the program and from all casts
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

desired_result[3]="
add_movie 1 1977 Bednam John SaturdayNightFever
add_movie: Added SaturdayNightFever (1977) directed by John Bednam
add_movie 2 1972 FordCoppala Francis TheGodfather
add_movie: Added TheGodfather (1972) directed by Francis FordCoppala
register_actor 100 Travolta John
register_actor: Registered actor John Travolta
register_actor 100 Gorney Karen
register_actor: Error actor id 100 already in use
join_cast 100 1
join_cast: Added actor John Travolta to the cast of SaturdayNightFever
join_cast 100 1
join_cast: Error John Travolta is already in the cast of SaturdayNightFever
join_cast 100 2
join_cast: Added actor John Travolta to the cast of TheGodfather
join_cast 101 2
join_cast: Error actor id 101 does not exist
cast 1
SaturdayNightFever features:
- John Travolta
cast 2
TheGodfather features:
- John Travolta
"

desired_result[4]="
cast 2 should output: 

add_movie: Added SaturdayNightFever (1977) directed by John Bednam
add_movie: Added TheGodfather (1972) directed by Francis FordCoppala
add_movie: Added TheGodfatherPartII (1974) directed by Francic FordCoppala
add_movie: Added TheShawshankRedemption (1994) directed by Frank Darabont
add_movie: Added AlmostFamous (2000) directed by Cameron Crowe
add_movie: Added Goodfellas (1990) directed by Martin Scorsese
add_movie: Added PulpFiction (1994) directed by Quenton Tarantino
add_movie: Added TheSilenceOfTheLambs (1991) directed by Jonathan Demme
add_movie: Added TheShining (1980) directed by Stanley Kubrick
add_movie: Added TheDeparted (2006) directed by Martin Scorsese
add_movie: Added GoodWillHunting (1997) directed by Gus VanSant
add_movie: Added NationalLampoon'sChristmasVacation (1989) directed by Jeremiah Chechik
add_movie: Added ThisIsSpinalTap (1984) directed by Rob Reiner
add_movie: Added BatmanBegins (2005) directed by Christopher Nolan
add_movie: Added AmericanBeauty (1999) directed by Sam Mendes
add_movie: Added Boyhood (2014) directed by Richard Linklater
add_movie: Added TheLordOfTheRingsTheFellowshipOfTheRing (2001) directed by Peter Jackson
add_movie: Added ForrestGump (1994) directed by Robert Zemeckis
add_movie: Added Inception (2010) directed by Christopher Nolan
add_movie: Added TopGun (1986) directed by Tony Scott
add_movie: Added DjangoUnchained (2012) directed by Quenton Tarantino
add_movie: Added Jaws (1975) directed by Steven Spielberg
add_movie: Added SlumdogMillionaire (2008) directed by Danny Boyle
add_movie: Added Dunkirk (2017) directed by Christopher Nolan
add_movie: Added FullMetalJacket (1987) directed by Stanley Kubrick
add_movie: Added KillBillVolume1 (2003) directed by Quenton Tarantino
add_movie: Added TheWolfOfWallStreet (2013) directed by Martin Scorsese
add_movie: Added IndianaJonesAndTheTempleOfDoom (1984) directed by Steven Spielberg
add_movie: Added Parasite (2019) directed by Joonho Bong
add_movie: Added Avatar (2009) directed by James Cameron
add_movie: Added E.T.TheExtraTerrestrial (1982) directed by Steven Spielberg
add_movie: Added TheLordOfTheRingsTheReturnOfTheKing (2004) directed by Peter Jackson
add_movie: Added Batman (1989) directed by Tim Burton
add_movie: Added TheDarkKnight (2008) directed by Christopher Nolan
add_movie: Added ApocalypseNow (1979) directed by Francis Coppola
add_movie: Added TheSixthSense (1999) directed by MNight Shyamalan
add_movie: Added 2001ASpaceOdyssey (1968) directed by Stanley Kubrick
add_movie: Added LaLaLand (2016) directed by Damien Chazelle
add_movie: Added CatchMeIfYouCan (2002) directed by Steven Spielberg
add_movie: Added MadMaxFuryRoad (2015) directed by George Miller
add_movie: Added Se7en (1995) directed by David Fincher
add_movie: Added BladeRunner (1982) directed by Scott Ridley
add_movie: Added InglouriousBasterds (2009) directed by Quenton Tarantino
add_movie: Added AClockworkOrange (1971) directed by Stanley Kubrick
add_movie: Added JFK (1991) directed by Oliver Stone
add_movie: Added BackToTheFuture (1985) directed by Robert Zemeckis
add_movie: Added Hugo (2011) directed by Martin Scorsese
add_movie: Added Carrie (1976) directed by Brian DePalma
add_movie: Added GetOut (2018) directed by Jordan Peele
add_movie: Added ThereWillBeBlood (2007) directed by Paul Anderson
add_movie: Added Psycho (1960) directed by Alfred Hitchcock
add_movie: Added KillBillVolume2 (2004) directed by Quenton Tarantino
add_movie: Added TheExorcist (1973) directed by William Friedkin
add_movie: Added TheSocialNetwork (2010) directed by David Fincher
add_movie: Added Forrest (1994) directed by Zemeckis Gump
add_movie: Added TheMatrix (1998) directed by Lana Wachowski
add_movie: Added ThePrestige (2006) directed by Christopher Nolan
add_movie: Added Heaven'sGate (1980) directed by Michael Cimino
add_movie: Added ApocalypseNow (1979) directed by Francis Coppola
add_movie: Added RainMan (1990) directed by Barry Levinson
add_movie: Added TheGraduate (1967) directed by Mike Nichols
add_movie: Added Apollo13 (1986) directed by Ron Howard
add_movie: Added AssaultOnPrecinct13 (1976) directed by John Carpenter
add_movie: Added Birdman (2014) directed by Alejandro Iñárritu
add_movie: Added ABeautifulMind (2001) directed by Stanley Kubrick
add_movie: Added BarryLyndon (1975) directed by Stanley Kubrick
add_movie: Added WitnessForTheProsecution (1957) directed by Billy Wilder
add_movie: Added Zodiac (2007) directed by David Fincher
add_movie: Added 2001ASpaceOdyssey (1968) directed by Stanley Kubrick
add_movie: Added Scarface (1984) directed by Oliver Stone
add_movie: Added TheWolfofWallStreet (2013) directed by Martin Scorsese
add_movie: Added MinorityReport (2002) directed by Steven Spielberg
add_movie: Added AmericanBeauty (1995) directed by Sam Mendes
add_movie: Added WhoFramedRogerRabbit (1988) directed by Robert Zemeckis
add_movie: Added TheHurtLocker (2009) directed by Kathryn Bigelow
add_movie: Added TheExorcist (1973) directed by William Friedkin
add_movie: Added ReservoirDogs (1992) directed by Quenton Tarantino
add_movie: Added ThePrincessBride (1983) directed by Rob Reiner
add_movie: Added BeingThere (1979) directed by Hal Ashby
add_movie: Added ForrestGump (1994) directed by David Fincher
add_movie: Added Hugo (2011) directed by Martin Scorsese
add_movie: Added BacktotheFuture (1985) directed by Robert Zemeckis
add_movie: Added GetOut (2018) directed by Jordan Peele
add_movie: Added ThereWillBeBlood (2007) directed by Paul Anderson
add_movie: Added Psycho (1960) directed by Alfred Hitchcock
add_movie: Added KillBillVolume2 (2004) directed by Quenton Tarantino
add_movie: Added TheExorcist (1973) directed by William Friedkin
add_movie: Added TheSocialNetwork (2010) directed by David Fincher
add_movie: Added Forrest (1994) directed by Zemeckis Gump
add_movie: Added TheMatrix (1998) directed by Lana Wachowski
add_movie: Added ThePrestige (2006) directed by Christopher Nolan
add_movie: Added Heaven'sGate (1980) directed by Michael Cimino
add_movie: Added ApocalypseNow (1979) directed by Francis Coppola
add_movie: Added RainMan (1990) directed by Barry Levinson
add_movie: Added TheGraduate (1967) directed by Mike Nichols
add_movie: Added Apollo13 (1986) directed by Ron Howard
add_movie: Added AssaultOnPrecinct13 (1976) directed by John Carpenter
add_movie: Added Birdman (2014) directed by Alejandro Iñárritu
add_movie: Added ABeautifulMind (2001) directed by Stanley Kubrick
add_movie: Added BarryLyndon (1975) directed by Stanley Kubrick
SaturdayNightFever features:
TheGodfather features:
TheGodfatherPartII features:
TheShawshankRedemption features:
AlmostFamous features:
Goodfellas features:
PulpFiction features:
TheSilenceOfTheLambs features:
TheShining features:
TheDeparted features:
GoodWillHunting features:
NationalLampoon'sChristmasVacation features:
ThisIsSpinalTap features:
BatmanBegins features:
AmericanBeauty features:
Boyhood features:
TheLordOfTheRingsTheFellowshipOfTheRing features:
ForrestGump features:
Inception features:
TopGun features:
DjangoUnchained features:
Jaws features:
SlumdogMillionaire features:
Dunkirk features:
FullMetalJacket features:
KillBillVolume1 features:
TheWolfOfWallStreet features:
IndianaJonesAndTheTempleOfDoom features:
Parasite features:
Avatar features:
E.T.TheExtraTerrestrial features:
TheLordOfTheRingsTheReturnOfTheKing features:
Batman features:
TheDarkKnight features:
ApocalypseNow features:
TheSixthSense features:
2001ASpaceOdyssey features:
LaLaLand features:
CatchMeIfYouCan features:
MadMaxFuryRoad features:
Se7en features:
BladeRunner features:
InglouriousBasterds features:
AClockworkOrange features:
JFK features:
BackToTheFuture features:
Hugo features:
Carrie features:
GetOut features:
ThereWillBeBlood features:
Psycho features:
KillBillVolume2 features:
TheExorcist features:
TheSocialNetwork features:
Forrest features:
TheMatrix features:
ThePrestige features:
Heaven'sGate features:
ApocalypseNow features:
RainMan features:
TheGraduate features:
Apollo13 features:
AssaultOnPrecinct13 features:
Birdman features:
ABeautifulMind features:
BarryLyndon features:
WitnessForTheProsecution features:
Zodiac features:
2001ASpaceOdyssey features:
Scarface features:
TheWolfofWallStreet features:
MinorityReport features:
AmericanBeauty features:
WhoFramedRogerRabbit features:
TheHurtLocker features:
TheExorcist features:
ReservoirDogs features:
ThePrincessBride features:
BeingThere features:
ForrestGump features:
Hugo features:
BacktotheFuture features:
GetOut features:
ThereWillBeBlood features:
Psycho features:
KillBillVolume2 features:
TheExorcist features:
TheSocialNetwork features:
Forrest features:
TheMatrix features:
ThePrestige features:
Heaven'sGate features:
ApocalypseNow features:
RainMan features:
TheGraduate features:
Apollo13 features:
AssaultOnPrecinct13 features:
Birdman features:
ABeautifulMind features:
BarryLyndon features:
"

# INTERACTION
clear 
#interaction=$(expect cp3_subroutine.exp "$1" "$2" "${tests[$3]}" 2>&1)
#key_results=$(echo "$interaction" | tail -n20)
#echo "$interaction"

expect cp3_subroutine.exp "$1" "${tests[$2]}" 2>&1
printf "\n\n********** EXPECTED OUTPUT DESCRIPTION **********\\n\n${desired_result[$2]}\n\n\n"


exit 0



