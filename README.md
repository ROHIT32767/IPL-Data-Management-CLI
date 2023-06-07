# <center> Data And Applications
# <center> Project Phase 4

### <div style="text-align: right"> Abhinav Reddy Boddu
#### <div style="text-align: right"> 2021101034
### <div style="text-align: right"> Rohit Gowlapalli
#### <div style="text-align: right"> 2021101113
### <div style="text-align: right"> Gnana Prakash Punnavajhala
#### <div style="text-align: right"> 2021111027

<hr>

### <ins>Video link:</ins>
- https://drive.google.com/file/d/1noNfVKUjKp-8GLd_q4MqPYrwGPH7_R92/view?usp=sharing

### <ins>Commands to be executed:</ins>

- Command 1 - enter 1

    `Insert Player`

    If executed successfully , Inserts a Player into PLAYER table of the Database with Base_price , Auctioned_price , Name , Cname and Fantasy points as inputs. Player references Fanatasy points from FORM(Fantasy_points)

- Command 2 - enter 2 

    `Insert Form `

     If executed successfully , Inserts Form into FORM table of the database with Fantasy points,Form as inputs 
    
- Command 3 - enter 3

     ``Insert Team``

     If executed successfully , Inserts Team into TEAM table of the database with Place , RTM_Cards , Money_left , Brand_value , Fair_play_points , Total_points , Name , Coach as inputs

-  Command 4 - enter 4

     ``Insert Team Manager``

     If executed successfully , Inserts team manager into TEAM_MANAGER table of the database with Manager_First_Name and Manager_Last_Name and Team Name as inputs

-  Command 5 - enter 5

     ``Insert League``

     If executed successfully , Inserts league into LEAGUE table of the database with Prize_Money , Runner_up , Winner , Name and Season_Number as inputs

-  Command 6 - enter 6

     ``Insert Fixture``
     
     If executed successfully , Inserts fixture into FIXTURE table of the database with Date_Time , Venue and Match_No as inputs

-  Command 7 - enter 7

     ``Insert Commmentator``

     If executed successfully , Inserts commentator into COMMENTATORS table of the database with Date_Time , Venue and Commentators as inputs

-  Command 8 - enter 8

     ``Insert Umpire``

     If executed successfully , Inserts commentator into COMMENTATORS table of the database with Date_Time , Venue and Commentators as inputs

-  Command 9 - enter 9

     ``Insert Partner``

     If executed successfully , Insert partner into PARTNER table of the database with CIN and NAE as inputs

-  Command 10 - enter 10

     ``Insert Partner_type``

     If executed successfully , Insert partner into PARTNER table of the database with CIN and NAE as inputs

-   Command 11 - enter 11

     ``Insert Jersey``

     If executed successfully , Insert jersey into PARTNER table of the database with Jersey_Number and BELONGS_TO as inputs 

-   Command 12 - enter 12

     ``Insert Award``

     If executed successfully , Insert award into AWARDS table of the database with Prize_Money , Name ,AWARDED_IN and AWARDED_TO as inputs 

-   Command 13 - enter 13

     ``Insert Player Sponsor``

     If executed successfully , Insert player_sponsor into SPONSORS_PLAYER  table of the database with pcin and player as inputs   

     
-   Command 14 - enter 14

     ``Insert Team Sponsor``

     If executed successfully , Insert team_sponsor into SPONSORS_TEAM table of the database with pcin and tname as inputs

-   Command 15 - enter 15

     ``Insert League Sponsor``

     If executed successfully , Insert league_sponsor into SPONSORS_LEAGUE table of the database with pcin and league as inputs


-   Command 16 - enter 16

     ``Insert Team playing in Fixture``

     If executed successfully , Insert team playing in fixture into PLAYS_IN table of the database with tname, dt, venue as inputs

-   Command 17 - enter 17

     ``Insert player playing for team in fixture of league``

     If executed successfully , Insert player playing for team in fixture of league into PLAYS_FOR_IN_OF table of the database with pname, tname, dt, venue and Sno as inputs

-   Command 18 - enter 18

     ``Delete player sponsor``

     If executed successfully , delete player_sponsor into SPONSORS_PLAYER table of the database with pcin and player as inputs

-   Command 19 - enter 19

     ``Delete team sponsor``

     If executed successfully , delete team_sponsor into SPONSORS_TEAM table of the database with pcin and tname as inputs

-   Command 20 - enter 20

     ``Delete player sponsor``

     If executed successfully , delete league_sponsor into SPONSORS_LEAGUE table of the database with pcin and leagueno as inputs

-   Command 21 - enter 21

     ``Update player details``

     If executed successfully , update player details in PLAYER table of the database with Base_price, Auctioned_price, CName, Fantasy_points, pname as inputs

-   Command 22 - enter 22

     ``Update team manager details``

     If executed successfully , update team details of manager in TEAM_MANAGER table of the database with Manager_First_Name, Manager_Last_Name and Name as inputs

-   Command 23 - enter 23

     ``Update team details``

     If executed successfully , update team details in TEAM table of the database with teamPlace, teamCards, teamMoneyLeft, teamBrandValue, teamFairPlayPoints, teamTotalPoints, tname and teamCoach as inputs

-   Command 24 - enter 24

     ``Deduct fair play points of team``

     If executed successfully , fair play points of a team are deducted in TEAM table of the database with teamName as input

-   Command 25 - enter 25

     ``Update fixture details``

     If executed successfully, result of a fixture is updated in FIXTURE table of the database with Date_Time, Venue and Result as input

-   Command 26 - enter 26

     ``Search for a player``

     If executed successfully, details of a player is displayed from PLAYER table of the database with pname as input

-   Command 27 - enter 27

     ``Search for a fixture``

     If executed successfully, details of all fixtures at a particular time is displayed from FIXTURE table of the database with Date_Time as input

-   Command 28 - enter 28

     ``Sorted list of teams``

     If executed successfully, list of teams sorted according to Total_points is displayed from TEAM table of the database

-   Command 29 - enter 29

     ``Sorted list of players``

     If executed successfully, list of players sorted according to Fantasy_points is displayed from PLAYER table of the database

-   Command 30 - enter 30

     ``Find partner``

     If executed successfully, list of partners sponsoring a particular league is displayed from SPONSORS_LEAGUE table of the database with leagueNum as input

-   Command 31 - enter 31

     ``Tournament report``

     If executed successfully, list of all fixtures in a season is displayed from FIXTURE table of the database with sno as input

-   Command 32 - enter 32

     ``Most Valuable Player``

     If executed successfully, list of all players with highest fantasy points are displayed from PLAYER table of the database

-   Command 33 - enter 33

     ``Pitch Dependency Report``

     If executed successfully, list of all teams with win rate > 70% in the home stadium are displayed

<hr>

- `Note 1:` All these commands are tested on Ubuntu Version 20.04.3 LTS (Focal Fossa) 
- `Note 2:` Use the `Dump.sql` file to load data into sql
- `Note 3:` Change the username and password to the details of the system on which testing is being done in the `Miniworld.py` file (lines `887` and `888`)

<hr>