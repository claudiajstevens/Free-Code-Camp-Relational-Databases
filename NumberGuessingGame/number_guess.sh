#!/bin/bash

# This program will be a guessing game where a user tries to
# guess and randomly generated number that is between 1-1000.

## PSQL variable that will connect to database for queries
PSQL="psql --username=freecodecamp --dbname=number_guess_game -t --no-align -c"

#echo $($PSQL "TRUNCATE users, games")

# randomly generated number that user will try to guess
# it is between 1-1000
NUMBER=$(( RANDOM % 1000 + 1 ))

# getting username from user
echo -e "\nEnter your username:"
read USERNAME

# check if user is in database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

#if user not found
if [[ -z $USER_ID ]]
then
  # add user to database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  echo $USER_ID
else
  # user is in database

  # get number of games played
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")
  
  # get the score of the best game
  HIGH_SCORE=$($PSQL "SELECT high_score FROM users WHERE user_id = $USER_ID")
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $HIGH_SCORE guesses."
fi


# ~~~ game start ~~~~

# get first guess from user
echo "Guess the secret number between 1 and 1000:"
read GUESS

# check if guess is a number
while [[ ! $GUESS =~ [0-9]+ ]]
do
 echo "That is not an integer, guess again:"
 read GUESS
done

COUNT=1

#echo "Number = $NUMBER"
# keep having user enter numbers until they guess the correct one
while [[ $GUESS != $NUMBER ]]
do
  
  if [[ $GUESS > $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi

  # get user's next guess
  read GUESS

  # have user keep inputting values until they enter a valid one
  while [[ ! $GUESS =~ [0-9]+ ]]
  do
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  done
  
  # increment guess counter
  (( COUNT=COUNT + 1 ))

done

# number has been guessed and game is over
echo -e "\nYou guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"

# ~~~~ game done ~~~~~

# add game to database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($COUNT, $USER_ID)")

# check if user has beaten their previous high score
if [[ -z $HIGH_SCORE ]] || [[ $HIGH_SCORE > $COUNT ]]
then
  # if there is new high score update user data
  UPDATE_USER_RESULT=$($PSQL "UPDATE users SET high_score = $COUNT WHERE user_id = $USER_ID")
fi


