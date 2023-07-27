#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")
# Script to insert data from games.csv into world cup database

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    #echo $WINNER
    #getting team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ;")
    
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      #insert team into teams table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER' ;")
      fi    
    fi

    if [[ $OPPONENT != "opponent" ]]
    then
      #getting team id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ;")
      
      #if not found
      if [[ -z $OPPONENT_ID ]]
      then
        #insert team into teams table
        INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
        if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
        then
          echo Inserted into teams, $OPPONENT
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT' ;")
        fi    
      fi
    fi

    #add info to games table
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS);")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS 
    fi

  fi

done