import subprocess as sp
import pymysql
import pymysql.cursors

def display(output):

    if (len(output) == 0):
        return

    maxLengths = {}
    header = output[0].keys();

    for i, val in enumerate(header):
        maxLengths[i] = len(str(val))

    for row in output:
        for i, val in enumerate(row.values()):
            maxLengths[i] = max(maxLengths[i], len(str(val)))

    print('_', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('_', end = '')

    print('_')
    print('|', end='')

    for i, val in enumerate(header):
        print(val, end='')
        for _ in range(maxLengths[i] - len(str(val)) + 2):
            print(' ', end = '')

    print('|')
    print('‾', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end = '')

    print('‾')
    print('_', end='')

    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('_', end = '')

    print('_')

    for i, row in enumerate(output):
        print('|', end = '')
        for i, val in enumerate(row.values()):
            print(val, end = '')
            for _ in range(maxLengths[i] - len(str(val)) + 2):
                print(' ', end = '')
        print('|')

    print('‾', end='')
    for i in range(len(header)):
        for _ in range(maxLengths[i] + 2):
            print('‾', end = '')
    print('‾')


def playerInsert():
    try:
        playerDetails = {}
        print("Enter the details of the player:")
        playerDetails["Base_price"] = int(input("Base price: "))
        playerDetails["Auctioned_price"] = int(input("Auctioned price: "))
        playerDetails["Name"] = input("Full name: ")
        playerDetails["CName"] = input("Captain name: ")
        playerDetails["Fantasy_points"] = int(input("Fantasy points: "))

        query = "INSERT INTO PLAYER(Base_price, Auctioned_price, Name, CName, Fantasy_points) VALUES(%d, %d, '%s', '%s', %d)" % (
            playerDetails["Base_price"], playerDetails["Auctioned_price"], playerDetails["Name"], playerDetails["CName"], playerDetails["Fantasy_points"])

        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())
        
        print("Inserted player details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def playerUpdate():
    try:
        playerDetails = {}
        print("Enter the new details of the player:")
        playerDetails["Base_price"] = int(input("Base price: "))
        playerDetails["Auctioned_price"] = int(input("Auctioned price: "))
        pname = input("Full name: ")
        playerDetails["CName"] = input("Captain name: ")
        playerDetails["Fantasy_points"] = int(input("Fantasy points: "))

        query = "UPDATE PLAYER SET Base_price = %d, Auctioned_price = %d, CName = '%s', Fantasy_points = %d WHERE Name='%s'" % (
            playerDetails["Base_price"], playerDetails["Auctioned_price"], playerDetails["CName"], playerDetails["Fantasy_points"],pname)

        print(query)
        cur.execute(query)
        con.commit()

        print("Player details updated successfully")
    
    except Exception as e:
        con.rollback()
        print("Failed to update player details")
        print(">>>>>>>>>>>>>", e)

    return

def playerSearch():
    try:
        pname = input("Enter player name: ")
        query = f"SELECT * FROM PLAYER WHERE Name = '{pname}'"

        print(query)
        cur.execute(query)
        con.commit()
        
        display(cur.fetchall())
    
    except Exception as e:
        con.rollback()
        print("Failed to search the player")
        print(">>>>>>>>>>>>>", e)

def playerSort():
    try:
        print("Sorting by player:")
        query = f"SELECT * FROM PLAYER ORDER BY Fantasy_points DESC"

        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())
    
    except Exception as e:
        con.rollback()
        print("Failed to sort")
        print(">>>>>>>>>>>>>", e)
        
def formInsert():
    try:
        formDetails = {}
        print("Enter fantasy points and corresponding form values:")
        formDetails["Fantasy_points"] = int(input("Fantasy points: "))
        formDetails["Form"] = float(input("Corresponding form value: "))

        query = "INSERT INTO FORM(Fantasy_points, Form) VALUES(%d, %lf)" % (
            formDetails["Fantasy_points"], formDetails["Form"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted fanatasy points and form details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert form details")
        print(">>>>>>>>>>>>>", e)

    return

def teamInsert():
    try:
        teamDetails = {}
        print("Enter the details of the team:")
        teamDetails["Place"] = input("Home town: ")
        teamDetails["RTM_Cards"] = int(input("Number of RTM Cards: "))
        teamDetails["Money_Left"] = int(input("Money Left: "))
        teamDetails["Brand_Value"] = int(input("Brand Value: "))
        teamDetails["Fair_play_points"] = float(input("Fair play points: "))
        teamDetails["Total_points"] = int(input("Total points: "))
        teamDetails["Name"] = input("Team name: ")
        teamDetails["Coach"] = input("Coach name: ")

        query = "INSERT INTO TEAM(Place, RTM_Cards, Money_Left, Brand_Value, Fair_play_points, Total_points, Name, Coach) VALUES('%s', %d, %d, %d, %f, %d, '%s', '%s')" % (
            teamDetails["Place"], teamDetails["RTM_Cards"], teamDetails["Money_Left"], teamDetails["Brand_Value"], teamDetails["Fair_play_points"], teamDetails["Total_points"], teamDetails["Name"], teamDetails["Coach"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert team details")
        print(">>>>>>>>>>>>>", e)

    return

def teamUpdate():
    try:
        teamDetails = {}
        print("Enter the new details of the team:")
        teamPlace = input("Home stadium: ")
        teamCards = int(input("Number of RTM Cards: "))
        teamMoneyLeft = int(input("Money Left: "))
        teamBrandValue = int(input("Brand Value: "))
        teamFairPlayPoints = float(input("Fair play points: "))
        teamTotalPoints = int(input("Total points: "))
        tname = input("Team name: ")
        teamCoach = input("Coach name: ")

        query = f"UPDATE TEAM SET Place = '{teamPlace}', RTM_Cards = {teamCards}, Money_Left = {teamMoneyLeft}, Brand_Value = {teamBrandValue}, Total_points = {teamTotalPoints}, Coach = '{teamCoach}', Fair_play_points = {teamFairPlayPoints} WHERE Name = '{tname}'"

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated team details")
    
    except Exception as e:
        con.rollback()
        print("Failed to update team details")
        print(">>>>>>>>>>>>>", e)

    return

def deduct_fair_play_points():
    try:
        teamName = input("Enter the team of which the points have to be deducted: ")
        query = f"UPDATE TEAM SET Fair_play_points = Fair_play_points - 2 WHERE Name = '{teamName}'"
        print(query)
        cur.execute(query)
        con.commit()

        print("Deducted points")

    except Exception as e:
        con.rollback()
        print("Failed to deduct points")
        print(">>>>>>>>>>>>>", e)
    
def teamSort():
    try:
        query = f"SELECT * FROM TEAM GROUP BY Name ORDER BY Total_points DESC"
        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())
        
        print("Sorted list of teams")

    except Exception as e:
        con.rollback()
        print("Failed to obtain sorted list")
        print(">>>>>>>>>>>>>", e)
    
def teamMgrInsert():
    try:
        teamMgrDetails = {}
        print("Enter the details of the team manager:")
        teamMgrDetails["Manager_First_Name"] = input("First name of the manager: ")
        teamMgrDetails["Manager_Last_Name"] = input("Last name of the manager: ")
        teamMgrDetails["Name"] = input("Name of the partner the person is manager of: ")

        query = "INSERT INTO TEAM_MANAGER(Manager_First_Name, Manager_Last_Name, Name) VALUES('%s', '%s', '%s')" % (
            teamMgrDetails["Manager_First_Name"], teamMgrDetails["Manager_Last_Name"], teamMgrDetails["Name"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team manager details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert team manager details")
        print(">>>>>>>>>>>>>", e)

    return

def teamMgrUpdate():
    try:
        teamMgrDetails = {}
        print("Enter the details of the team manager:")
        teamMgrDetails["Manager_First_Name"] = input("First name of the manager: ")
        teamMgrDetails["Manager_Last_Name"] = input("Last name of the manager: ")
        teamMgrDetails["Name"] = input("Name of the partner the person is manager of: ")

        query = "UPDATE TEAM_MANAGER SET Manager_First_Name = '%s' AND Manager_Last_Name = '%s' WHERE Name = '%s'" % (
            teamMgrDetails["Manager_First_Name"], teamMgrDetails["Manager_Last_Name"], teamMgrDetails["Name"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated team manager details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to update team manager details")
        print(">>>>>>>>>>>>>", e)

    return

def leagueInsert():
    try:
        leagueDetails = {}
        print("Enter the details of the league:")
        leagueDetails["Prize_Money"] = int(input("Prize pool: "))
        leagueDetails["Runner_Up"] = input("Runner up of the tournament: ")
        leagueDetails["Winner"] = input("Winner of the tournament: ")
        leagueDetails["Name"] = input("League name: ")
        leagueDetails["Season_Number"] = int(input("Season number: "))

        query = "INSERT INTO LEAGUE(Prize_Money, Runner_Up, Winner, Name, Season_Number) VALUES(%d, '%s', '%s', '%s', %d)" % (
            leagueDetails["Prize_Money"], leagueDetails["Runner_Up"], leagueDetails["Winner"], leagueDetails["Name"], leagueDetails["Season_Number"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted league details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert league details")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureInsert():
    try:
        fixtureDetails = {}
        print("Enter the details of the fixture:")
        fixtureDetails["Date_Time"] = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        fixtureDetails["Venue"] = input("Scheduled venue of fixture: ")
        fixtureDetails["Match_No"] = int(input("Match number: "))

        query = "INSERT INTO FIXTURE(Date_Time, Venue, Result, Match_No) VALUES('%s', '%s', NULL, %d)" % (
            fixtureDetails["Date_Time"], fixtureDetails["Venue"], fixtureDetails["Match_No"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted fixture details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert fixture details")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureUpdate():
    try:
        fixtureDetails = {}
        print("Enter the new details of the fixture:")
        fixtureDetails["Date_Time"] = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        fixtureDetails["Venue"] = input("Scheduled venue of fixture: ")
        fixtureDetails["Result"] = input("Winner:")

        query = "UPDATE FIXTURE SET Result = '%s' WHERE Date_Time='%s' AND Venue = '%s'" % (
            fixtureDetails["Result"], fixtureDetails["Date_Time"], fixtureDetails["Venue"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated the fixture details")
    
    except Exception as e:
        con.rollback()
        print("Failed to update fixture details")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureDelete():
    try:
        fixtureDetails = {}
        print("Enter the details of the fixture:")
        Date_Time = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        Venue = input("Scheduled venue of fixture: ")

        query = f"DELETE FROM FIXTURE WHERE Date_Time = '{Date_Time}' AND Venue = '{Venue}'"
        print(query)
        cur.execute(query)
        con.commit()

        print("Fixture deleted sucessfully")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete fixture from database")
        print(">>>>>>>>>>>>>", e)

    return

def fixtureSearch():
    try:
        print("Enter the details of the fixture:")
        Date_Time = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")

        query = f"SELECT * FROM FIXTURE WHERE Date_Time = '{Date_Time}'"

        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())

    except Exception as e:
        con.rollback()
        print("Failed to find the fixture")
        print(">>>>>>>>>>>>>", e)

    return

def commentatorInsert():
    try:
        commentatorDetails = {}
        print("Enter the details of the commentator:")
        commentatorDetails["Date_Time"] = input("Provide time in yyyy-mm-dd HH:MM:SS format: ")
        commentatorDetails["Venue"] = input("Scheduled venue of fixture: ")
        commentatorDetails["Commentators"] = input("Commentator Name: ")

        query = "INSERT INTO COMMENTATORS(Date_Time, Venue, Commentators) VALUES('%s', '%s', '%s')" % (
            commentatorDetails["Date_Time"], commentatorDetails["Venue"], commentatorDetails["Commentators"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted commentator details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert commentator details")
        print(">>>>>>>>>>>>>", e)

    return

def umpireInsert():
    try:
        umpireDetails = {}
        print("Enter the details of the umpire:")
        umpireDetails["Date_Time"] = input("Provide time in 'yyyy-mm-dd HH:MM:SS' (without the '') format: ")
        umpireDetails["Venue"] = input("Scheduled venue of fixture: ")
        umpireDetails["Umpire_Name"] = input("Name of the umpire: ")
        umpireDetails["Umpire_Position"] = int(input("Position of the umpire (For example, 3 for 3rd umpire): "))

        query = "INSERT INTO UMPIRE(Date_Time, Venue, Umpire_Name, Umpire_Position) VALUES('%s', '%s', '%s', %d)" % (
            umpireDetails["Date_Time"], umpireDetails["Venue"], umpireDetails["Umpire_Name"], umpireDetails["Umpire_Position"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted umpire details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert umpire details")
        print(">>>>>>>>>>>>>", e)

    return

def partnerFind():
    try:
        print("Enter the details of the League:")
        leagueNum = int(input("enter league Number:"))

        query = f"SELECT Name FROM SPONSORS_LEAGUE AS S, PARTNER AS P WHERE S.CIN = P.CIN AND S.Number = {leagueNum}"

        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())

    except Exception as e:
        con.rollback()
        print("Failed to find partner")
        print(">>>>>>>>>>>>>", e)

    return

def partnerInsert():
    try:
        partnerDetails = {}
        print("Enter the details of the partners:")
        partnerDetails["CIN"] = int(input("CIN - Company Identification Number of the partner: "))
        partnerDetails["Name"] = input("Name of the partner company: ")

        query = "INSERT INTO PARTNER(CIN, Name) VALUES(%d, '%s')" % (
            partnerDetails["CIN"], partnerDetails["Name"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted partner details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert partner details")
        print(">>>>>>>>>>>>>", e)

    return

def partnerTypeInsert():
    try:
        partnerTypeDetails = {}
        print("Enter the details of the partner type:")
        partnerTypeDetails["CIN"] = int(input("CIN - Company Identification Number of the partner: "))
        partnerTypeDetails["Type"] = input("Type of the partnership: ")

        query = "INSERT INTO PARTNER_TYPE(CIN, Type) VALUES(%d, '%s')" % (
            partnerTypeDetails["CIN"], partnerTypeDetails["Type"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted partner type details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert partner type")
        print(">>>>>>>>>>>>>", e)

    return

def jerseyInsert():
    try:
        jerseyDetails = {}
        print("Enter the details of the jersey:")
        jerseyDetails["Jersey_Number"] = int(input("Jersey Number: "))
        jerseyDetails["BELONGS_TO"] = input("Team to which the jersey belongs to: ")

        query = "INSERT INTO JERSEY(Jersey_Number, BELONGS_TO) VALUES(%d, '%s')" % (
            jerseyDetails["Jersey_Number"], jerseyDetails["BELONGS_TO"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted jersey details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert jersey details")
        print(">>>>>>>>>>>>>", e)

    return

def awardInsert():
    try:
        awardDetails = {}
        print("Enter the details of the award:")
        awardDetails["Prize_Money"] = int(input("Prize money of the award: "))
        awardDetails["Name"] = input("Name of the award: ")
        awardDetails["AWARDED_IN"] = int(input("The season number in which the award was presented: "))
        awardDetails["AWARDED_TO"] = input("The name of the player to which the award was given to: ")

        query = "INSERT INTO AWARDS(Prize_Money, Name, AWARDED_IN, AWARDED_TO) VALUES(%d, '%s', %d, '%s')" % (
            awardDetails["Prize_Money"], awardDetails["Name"], awardDetails["AWARDED_IN"], awardDetails["AWARDED_TO"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted award details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert award details")
        print(">>>>>>>>>>>>>", e)

    return

def playerSponsorInsert():
    try:
        print("Enter the Sponsor, and which league they are sponsoring to:")
        player = input("Player name")
        pcin = int(input("Enter CIN of sponsor: "))

        query = f"INSERT INTO SPONSORS_PLAYER VALUES('{player}',{pcin})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted player partner details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert player partner details")
        print(">>>>>>>>>>>>>", e)

def playerSponsorDelete():
    try:
        print("Enter the Sponsor, and which player they are sponsoring to:")
        player = input("Player name")
        pcin = int(input("Enter CIN of sponsor: "))

        query = f"DELETE FROM SPONSORS_PLAYER WHERE Name='{player}' AND CIN={pcin}"
        print(query)
        cur.execute(query)
        con.commit()

        print("Successfully deleted player partner details")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete player partner details")
        print(">>>>>>>>>>>>>", e)
        
def teamSponsorInsert():
    try:
        print("Enter the Sponsor, and which team they are sponsoring to:")
        tname = input("Team name")
        pcin = int(input("Enter CIN of sponsor: "))

        query = f"INSERT INTO SPONSORS_TEAM VALUES('{tname}',{pcin})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team partner details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete team partner details")
        print(">>>>>>>>>>>>>", e)
        

def teamSponsorDelete():
    try:
        print("Enter the Sponsor, and which team they are sponsoring to:")
        tname = input("Team name")
        pcin = int(input("Enter CIN of sponsor: "))

        query = f"DELETE FROM SPONSORS_TEAM WHERE Name='{tname}' AND CIN={pcin}"
        print(query)
        cur.execute(query)
        con.commit()

        print("Successfully deleted team partner details")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete team partner details")
        print(">>>>>>>>>>>>>", e)

def leagueSponsorInsert():
    try:
        print("Enter the Sponsor, and whom they are sponsoring to:")
        league = input("League number")
        pcin = int(input("Enter CIN of sponsor: "))

        query = f"INSERT INTO SPONSORS_LEAGUE VALUES('{league}',{pcin})"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted league sponsor details into the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete league sponsor details")
        print(">>>>>>>>>>>>>", e)
        

def leagueSponsorDelete():
    try:
        leagueno = input("League number")
        pcin = int(input("Enter CIN of sponsor: "))

        query = f"DELETE FROM SPONSORS_LEAGUE WHERE Number = {leagueno} AND CIN = {pcin}"
        print(query)
        cur.execute(query)
        con.commit()

        print("Successfully deleted league partner from the database")
    
    except Exception as e:
        con.rollback()
        print("Failed to delete league sponsor details")
        print(">>>>>>>>>>>>>", e)

def playsIn():
    try:
        print("Enter the respective details:")
        tname = input("Enter Team Name:")
        dt = input("Provide date/time of the match'yyyy-mm-dd HH:MM:SS' (without the '') format: ")
        venue = input("Provide venue of the match")
        query = f"INSERT INTO PLAYS_IN VALUES('{tname}','{dt}','{venue}')"
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted team and fixture details into the database")

    except Exception as e:
        con.rollback()
        print("Failed to insert team and fixture details")
        print(">>>>>>>>>>>>>", e)

def playsForInOf():
    try:
        print("Enter the respective details:")
        pname = input("Enter player Name:")
        tname = input(f"Whom does {pname} Play for?")
        print("Provide the following details about the match:")
        dt = input("1. Provide date/time of the match'yyyy-mm-dd HH:MM:SS' (without the '') format: ")
        venue = input("2. Provide venue of the match")
        Sno = int(input("In which Season Number does/did this match happen"))
        
        query = f"INSERT INTO PLAYS_FOR_IN_OF VALUES('{pname}','{tname}','{dt}','{venue}',{Sno})"
        
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted details into the database")
    except:
        con.rollback()
        print("Failed to insert details")
        print(">>>>>>>>>>>>>", e)

def tournamentReport():
    try:
        sno = int(input("Enter Season Number"))
        query = f"SELECT DISTINCT Date_time, Venue, Result, Match_No FROM FIXTURE NATURAL JOIN (SELECT * FROM PLAYS_FOR_IN_OF WHERE Season_Number = {sno}) AS N"
        
        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())

    except:
        con.rollback()
        print("ERROR")
        print(">>>>>>>>>>>>>", e)

def MVP():
    try:
        query = f"SELECT Name FROM PLAYER WHERE Fantasy_points = (SELECT MAX(Fantasy_points) FROM PLAYER)"
        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())

    except:
        con.rollback()
        print("ERROR")
        print(">>>>>>>>>>>>>", e)

def pitchDependencyReport():
    try:
        query = f"SELECT Name FROM TEAM, FIXTURE WHERE Name = Result AND Place = Venue AND ((SELECT COUNT(*) FROM TEAM, FIXTURE WHERE Result = Name) > (0.7 * (SELECT COUNT(*) FROM TEAM, FIXTURE WHERE Venue = Place)))"
        print(query)
        cur.execute(query)
        con.commit()

        display(cur.fetchall())
            
    except:
        con.rollback()
        print("ERROR")
        print(">>>>>>>>>>>>>", e)

def dispatchAdmin(ch):
    """
    Function that maps helper functions to option entered
    """

    if (ch == 1):
        playerInsert()
    elif (ch == 2):
        formInsert()
    elif (ch == 3):
        teamInsert()
    elif (ch == 4):
        teamMgrInsert()
    elif (ch == 5):
        leagueInsert()
    elif (ch == 6):
        fixtureInsert()
    elif (ch == 7):
        commentatorInsert()
    elif (ch == 8):
        umpireInsert()
    elif (ch == 9):
        partnerInsert()
    elif (ch == 10):
        partnerTypeInsert()
    elif (ch == 11):
        jerseyInsert()
    elif (ch == 12):
        awardInsert()
    elif (ch == 13):
        playerSponsorInsert()
    elif (ch == 14):
        teamSponsorInsert()
    elif (ch == 15):
        leagueSponsorInsert()
    elif (ch == 16):
        playsIn()
    elif (ch == 17):
        playsForInOf()
    elif (ch == 18):
        playerSponsorDelete()
    elif (ch == 19):
        teamSponsorDelete()
    elif (ch == 20):
        leagueSponsorDelete()
    elif (ch == 21):
        playerUpdate()
    elif (ch == 22):
        teamMgrUpdate()
    elif (ch == 23):
        teamUpdate()
    elif (ch == 24):
        deduct_fair_play_points()
    elif (ch == 25):
        fixtureUpdate()
    elif (ch == 26):
        playerSearch()
    elif (ch == 27):
        fixtureSearch()
    elif (ch == 28):
        teamSort()
    elif (ch == 29):
        playerSort()
    elif (ch == 30):
        partnerFind()
    elif (ch == 31):
        tournamentReport()
    elif (ch == 32):
        MVP()
    elif (ch == 33):
        pitchDependencyReport()
    
    else:
        print("Error: Invalid Option")

def dispatchUser(ch):
    """
    Function that maps helper functions to option entered
    """

    if (ch == 1):
        playerSearch()
    elif (ch == 2):
        fixtureSearch()
    elif (ch == 3):
        teamSort()
    elif (ch == 4):
        playerSort()
    elif (ch == 5):
        partnerFind()
    elif (ch == 6):
        MVP()
    
    else:
        print("Error: Invalid Option")

# Global
while(1):
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="abhinav",
                              password="#Thalapathy67",
                              db='IPL_FANTASY_LEAGUE',
                              cursorclass=pymysql.cursors.DictCursor)
        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        with con.cursor() as cur:
            while(1):

                if username == "admin" and password == "admin":

                    print("1.  Insert Player")
                    print("2.  Insert Form of a Player")
                    print("3.  Insert Team")
                    print("4.  Insert Team Manager")
                    print("5.  Insert LEAGUE")
                    print("6.  Insert Fixture")
                    print("7.  Insert Commentator")
                    print("8.  Insert Umpire")
                    print("9.  Insert Partner")
                    print("10. Insert Partner_Type")
                    print("11. Insert Jersey")
                    print("12. Insert Award")
                    print("13. Insert Player_Sponsor")
                    print("14. Insert Team_Sponsor")
                    print("15. Insert League_Sponsor")
                    print("16. Insert Team PLAYS_IN Fixture")
                    print("17. Insert Player PLAYS_FOR Team IN Fixture OF League")
                    print("18. Delete Player Sponsor")
                    print("19. Delete Team Sponsor")
                    print("20. Delete League Sponsor")
                    print("21. Update Player details")
                    print("22. Update Team Manager details")
                    print("23. Update Team details")
                    print("24. Deduct fair play points of a team")
                    print("25. Update Fixture details")
                    print("26. Search Player by name")
                    print("27. Search Fixture by date-time")
                    print("28. Display all teams sorted in order of Total Points")
                    print("29. Display all players in order of their fantasy points")
                    print("30. Display all Sponsors sponsoring a League")
                    print("31. Display the results of all fixture in a given season")
                    print("32. Display Most Valuable Player(s)")
                    print("33. Display Pitch Dependency Report")
                    
                    print("-1. Logout")
                
                    ch = int(input("Enter choice> "))
                    
                    
                    if ch == -1:
                        exit()
                    else:
                        dispatchAdmin(ch)

                else:
                    print("1. Search Player by name")
                    print("2. Search Fixture by date-time")
                    print("3. Display all teams sorted in order of Total Points")
                    print("4. Display all players in order of their fantasy points")
                    print("5. Display all Sponsors sponsoring a League")
                    print("6. Display Most Valuable Player(s)")
                    
                    print("-1. Logout")
                
                    ch = int(input("Enter choice> "))
                    
                    if ch == -1:
                        exit()
                    else:
                        dispatchUser(ch)

    except Exception as e:
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
