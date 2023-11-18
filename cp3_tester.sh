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
add_movie 29 2019 BongJoonho Parasite
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
add_movie 55 1994 Gump Zemeckis Robert Forrest
add_movie 56 1998 Wachowski Lana TheMatrix
add_movie 57 2006 Nolan Christopher ThePrestige
add_movie 58 1980 Cimino Michael Heaven'sGate
add_movie 59 1979 Coppola Francis ApocalypseNow
add_movie 60 1990 Levinson Barry RainMan
add_movie 61 1967 Nichols Mike TheGraduate
add_movie 62 1986 Howard Ron Apollo13
add_movie 63 1976 Carpenter John AssaultOnPrecinct13
add_movie 64 2014 Iñárritu AlejandroBirdman
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
add_movie 89 1994 Gump Zemeckis Robert Forrest
add_movie 90 1998 Wachowski Lana TheMatrix
add_movie 91 2006 Nolan Christopher ThePrestige
add_movie 92 1980 Cimino Michael Heaven'sGate
add_movie 93 1979 Coppola Francis ApocalypseNow
add_movie 94 1990 Levinson Barry RainMan
add_movie 95 1967 Nichols Mike TheGraduate
add_movie 96 1986 Howard Ron Apollo13
add_movie 97 1976 Carpenter John AssaultOnPrecinct13
add_movie 98 2014 Iñárritu AlejandroBirdman
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

	Added movie: 1, 1977, Bednam John, SaturdayNightFever
	Added movie: 2, 1972, FordCoppala Francis, TheGodfather
	Added movie: 3, 1974, FordCoppala Francic, TheGodfatherPartII
	Added movie: 4, 1994, Darabont Frank, TheShawshankRedemption
	Added movie: 5, 2000, Crowe Cameron, AlmostFamous
	Added movie: 6, 1990, Scorsese Martin, Goodfellas
	Added movie: 7, 1994, Tarantino Quenton, PulpFiction
	Added movie: 8, 1991, Demme Jonathan, TheSilenceOfTheLambs
	Added movie: 9, 1980, Kubrick Stanley, TheShining
	Added movie: 10, 2006, Scorsese Martin, TheDeparted
	Added movie: 11, 1997, VanSant Gus, GoodWillHunting
	Added movie: 12, 1989, Chechik Jeremiah, NationalLampoon'sChristmasVacation
	Added movie: 13, 1984, Reiner Rob, ThisIsSpinalTap
	Added movie: 14, 2005, Nolan Christopher, BatmanBegins
	Added movie: 15, 1999, Mendes Sam, AmericanBeauty
	Added movie: 16, 2014, Linklater Richard, Boyhood
	Added movie: 17, 2001, Jackson Peter, TheLordOfTheRingsTheFellowshipOfTheRing
	Added movie: 18, 1994, Zemeckis Robert, ForrestGump
	Added movie: 19, 2010, Nolan Christopher, Inception
	Added movie: 20, 1986, Scott Tony, TopGun
	Added movie: 21, 2012, Tarantino Quenton, DjangoUnchained
	Added movie: 22, 1975, Spielberg Steven, Jaws
	Added movie: 23, 2008, Boyle Danny, SlumdogMillionaire
	Added movie: 24, 2017, Nolan Christopher, Dunkirk
	Added movie: 25, 1987, Kubrick Stanley, FullMetalJacket
	Added movie: 26, 2003, Tarantino Quenton, KillBillVolume1
	Added movie: 27, 2013, Scorsese Martin, TheWolfOfWallStreet
	Added movie: 28, 1984, Spielberg Steven, IndianaJonesAndTheTempleOfDoom
	Added movie: 29, 2019, BongJoonho, Parasite
	Added movie: 30, 2009, Cameron James, Avatar
	Added movie: 31, 1982, Spielberg Steven, E.T.TheExtraTerrestrial
	Added movie: 32, 2004, Jackson Peter, TheLordOfTheRingsTheReturnOfTheKing
	Added movie: 33, 1989, Burton Tim, Batman
	Added movie: 34, 2008, Nolan Christopher, TheDarkKnight
	Added movie: 35, 1979, Coppola Francis, ApocalypseNow
	Added movie: 36, 1999, Shyamalan MNight, TheSixthSense
	Added movie: 37, 1968, Kubrick Stanley, 2001ASpaceOdyssey
	Added movie: 38, 2016, Chazelle Damien, LaLaLand
	Added movie: 39, 2002, Spielberg Steven, CatchMeIfYouCan
	Added movie: 40, 2015, Miller George, MadMaxFuryRoad
	Added movie: 41, 1995, Fincher David, Se7en
	Added movie: 42, 1982, Ridley Scott, BladeRunner
	Added movie: 43, 2009, Tarantino Quenton, InglouriousBasterds
	Added movie: 44, 1971, Kubrick Stanley, AClockworkOrange
	Added movie: 45, 1991, Stone Oliver, JFK
	Added movie: 46, 1985, Zemeckis Robert, BackToTheFuture
	Added movie: 47, 2011, Scorsese Martin, Hugo
	Added movie: 48, 1976, DePalma Brian, Carrie
	Added movie: 49, 2018, Peele Jordan, GetOut
	Added movie: 50, 2007, Anderson Paul, ThereWillBeBlood
	Added movie: 51, 1960, Hitchcock Alfred, Psycho
	Added movie: 52, 2004, Tarantino Quenton, KillBillVolume2
	Added movie: 53, 1973, Friedkin William, TheExorcist
	Added movie: 54, 2010, Fincher David, TheSocialNetwork
	Added movie: 55, 1994, Gump Zemeckis Robert, Forrest
	Added movie: 56, 1998, Wachowski Lana, TheMatrix
	Added movie: 57, 2006, Nolan Christopher, ThePrestige
	Added movie: 58, 1980, Cimino Michael, Heaven'sGate
	Added movie: 59, 1979, Coppola Francis, ApocalypseNow
	Added movie: 60, 1990, Levinson Barry, RainMan
	Added movie: 61, 1967, Nichols Mike, TheGraduate
	Added movie: 62, 1986, Howard Ron, Apollo13
	Added movie: 63, 1976, Carpenter John, AssaultOnPrecinct13
	Added movie: 64, 2014, Iñárritu Alejandro, Birdman
	Added movie: 65, 2001, Kubrick Stanley, ABeautifulMind
	Added movie: 66, 1975, Kubrick Stanley, BarryLyndon
	Added movie: 67, 1957, Wilder Billy, WitnessForTheProsecution
	Added movie: 68, 2007, Fincher David, Zodiac
	Added movie: 69, 1968, Kubrick Stanley, 2001ASpaceOdyssey
	Added movie: 70, 1984, Stone Oliver, Scarface
	Added movie: 71, 2013, Scorsese Martin, TheWolfofWallStreet
	Added movie: 72, 2002, Spielberg Steven, MinorityReport
	Added movie: 73, 1995, Mendes Sam, AmericanBeauty
	Added movie: 74, 1988, Zemeckis Robert, WhoFramedRogerRabbit
	Added movie: 75, 2009, Bigelow Kathryn, TheHurtLocker
	Added movie: 76, 1973, Friedkin William, TheExorcist
	Added movie: 77, 1992, Tarantino Quenton, ReservoirDogs
	Added movie: 78, 1983, Reiner Rob, ThePrincessBride
	Added movie: 79, 1979, Ashby Hal, BeingThere
	Added movie: 80, 1994, Fincher David, ForrestGump
	Added movie: 81, 2011, Scorsese Martin, Hugo
	Added movie: 82, 1985, Zemeckis Robert, BacktotheFuture
	Added movie: 83, 2018, Peele Jordan, GetOut
	Added movie: 84, 2007, Anderson Paul, ThereWillBeBlood
	Added movie: 85, 1960, Hitchcock Alfred, Psycho
	Added movie: 86, 2004, Tarantino Quenton, KillBillVolume2
	Added movie: 87, 1973, Friedkin William, TheExorcist
	Added movie: 88, 2010, Fincher David, TheSocialNetwork
	Added movie: 89, 1994, Gump Zemeckis Robert, Forrest
	Added movie: 90, 1998, Wachowski Lana, TheMatrix
	Added movie: 91, 2006, Nolan Christopher, ThePrestige
	Added movie: 92, 1980, Cimino Michael, Heaven'sGate
	Added movie: 93, 1979, Coppola Francis, ApocalypseNow
	Added movie: 94, 1990, Levinson Barry, RainMan
	Added movie: 95, 1967, Nichols Mike, TheGraduate
	Added movie: 96, 1986, Howard Ron, Apollo13
	Added movie: 97, 1976, Carpenter John, AssaultOnPrecinct13
	Added movie: 98, 2014, Iñárritu Alejandro, Birdman
	Added movie: 99, 2001, Kubrick Stanley, ABeautifulMind
	Added movie: 100, 1975, Kubrick Stanley, BarryLyndon
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



