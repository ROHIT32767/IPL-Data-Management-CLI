Insert_Player - `1`
```sql
SELECT * FROM PLAYER;

50000000
60000000
Moeen Ali
MS Dhoni
276

SELECT * FROM PLAYER;
```

<hr>

formInsert() - `2`
```sql
SELECT * FROM FORM;

331
8.2

SELECT * FROM FORM;
```

<hr>

Team insert() - `3`

```sql
SELECT * FROM TEAM;

Vizag Stadium
2
30000000
50000000
0
0
Vizag Thunders
Krishnamachari Srikanth


SELECT * FROM TEAM;
```

<hr>

Team Manger() - `4`
```sql
SELECT * FROM TEAM_MANAGER;


VVS
Laxman
Vizag Thunders


SELECT * FROM TEAM_MANAGER;
```

<hr>

League Insert() - `5`
```sql
SELECT * FROM LEAGUE;

200000000
Vizag Thunders
Chennai Super Kings
TATA IPL
16

SELECT * FROM LEAGUE;
```

Fixture Insert() - `6`
```sql

SELECT * FROM FIXTURE;

2022-05-18 15:30:00.000
Narendra Modi Stadium
53

SELECT * FROM FIXTURE;
```

<hr>

Commentatorinsert() - `7`
```sql
SELECT * FROM COMMENTATORS;

2022-05-18 15:30:00.000
Narendra Modi Stadium
Dinesh Karthik

SELECT * FROM COMMENTATORS;
```

<hr>

Umpire insert() - `8`
```sql
SELECT * FROM UMPIRE;

2022-05-18 15:30:00.000
Narendra Modi Stadium
Aleem dar
2

SELECT * FROM UMPIRE;
```

<hr>

partnerInsert() - `9`
```sql
SELECT * FROM PARTNER;

830912635
Star Maa

SELECT * FROM PARTNER;
```

<hr>

Partner Type insert() - `10`
```sql
SELECT * FROM PARTNER_TYPE;

830912635
Broadcast Partner

SELECT * FROM PARTNER_TYPE;
```

<hr>

jersey insert() - `11`
```sql
SELECT * FROM JERSEY;

32
Vizag Thunders

SELECT * FROM JERSEY;
```

<hr>

award insert() - `12`
```sql
SELECT * FROM AWARDS;

100000
Super striker of the Season
9
Moeen Ali

SELECT * FROM AWARDS;
```

<hr>

playerSponsorInsert() - `13`
```sql
SELECT * FROM SPONSORS_PLAYER;

Moeen Ali
830912635

SELECT * FROM SPONSORS_PLAYER;
```

<hr>

teamSponsorInsert() - `14`
```sql
SELECT * FROM SPONSORS_TEAM;

Vizag Thunders
830912635

SELECT * FROM SPONSORS_TEAM;
```

<hr>

league sponsor(insert) - `15`
```sql
SELECT * FROM SPONSORS_LEAGUE;

16
830912635

SELECT * FROM SPONSORS_LEAGUE;
```

<hr>

playsin() - `16`
```sql
SELECT * FROM PLAYS_IN;

2022-05-18 15:30:00.000
Mumbai Indians
Narendra Modi Stadium

SELECT * FROM PLAYS_IN;
```

<hr>

playsforinof() - `17`
```sql
SELECT * FROM PLAYS_FOR_IN_OF;

Rohit Sharma
Mumbai Indians
2022-05-18 15:30:00.000
Narendra Modi Stadium
16

SELECT * FROM PLAYS_FOR_IN_OF;
```

<hr>

playersponsordelete() - `18`
```sql
SELECT * FROM SPONSORS_PLAYER;

Virat Kohli
110415674

SELECT * FROM SPONSORS_PLAYER;
```

<hr>

teamSponsorDelete() - `19`
```sql
SELECT * FROM SPONSORS_TEAM;

Gujarat Titans
833192133

SELECT * FROM SPONSORS_TEAM;
```

<hr>

Leaguesponsordelete() - `20`
```sql
SELECT * FROM SPONSORS_LEAGUE;

15
0847819876

SELECT * FROM SPONSORS_LEAGUE;
```

<hr>

playerUpdate() - `21`
```sql
SELECT * FROM PLAYER;

100000000
120000000
Andre Russell
Shreyas Iyer
287

SELECT * FROM PLAYER;
```

<hr>

teamMgrUpdate() - `22`
```sql
SELECT * FROM TEAM_MANAGER;

Lokesh
Kanagaraj
Chennai Super Kings

SELECT * FROM TEAM_MANAGER;
```

<hr>

teamUpdate() - `23`
```sql
SELECT * FROM TEAM;

Chepauk Stadium
4
10000000
250000000
10.00
0
Chennai Super Kings
Stephen Fleming

SELECT * FROM TEAM;
```

<hr>

deduct_fair_play_points() - `24`
```sql
SELECT * FROM TEAM;

Delhi Capitals

SELECT * FROM TEAM;
```

<hr>

fixtureUpdate() - `25`
```sql
SELECT * FROM FIXTURE;

2022-03-26 21:00:00
Feroz Shah Kotla Ground
Sunrisers Hyderabad

SELECT * FROM FIXTURE;
```

<hr>

playerSearch() - `26`
```sql

SELECT * FROM PLAYER;

Faf Du Plessis
```

<hr>

fixtureSearch() - `27`
```sql
SELECT * FROM FIXTURE;

2022-04-22 01:00:00
```

<hr>

*  teamsort - `28`

<hr>

*  playersort - `29`

<hr>

partnerFind() - `30`
```sql
SELECT * FROM PARTNER;

13
```

<hr>

tournamentReport() - `31`
```sql
11
```

<hr>

MVP() - `32`

<hr>

pitchDependencyReport() - `33`

<hr>

------------------done------------------------

* playersearch():26
```
Faf Du Plessis
```

* fixture search():27
```
SELECT * FROM FIXTURE (point the cursor to the fixture after doing this)
2022-03-26 15:30:00

```
* teamsort : 28
* playersort : 29
* partnerfind():30
```
15
```

* tournament report():31 
 ```
 11
 ```
