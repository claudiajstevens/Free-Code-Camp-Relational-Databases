#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# see if argument was passed
if [[ $1 ]]
then
  # search by atomic number
  if [[ $1 =~ ^[0-9]+ ]]
  then
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = $1")
  fi

  # search by symbol
  if [[ -z $ELEMENT_INFO && '$1' =~ (..?) ]]
  then
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE symbol = '$1'")
  fi

  # search by name
  if [[ -z $ELEMENT_INFO ]]
  then
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE name = '$1'")
  fi

  # if element was found in database
  if [[ $ELEMENT_INFO ]]
  then
    echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_WEIGHT BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
      # output message about element
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_WEIGHT amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done

  # if element was not found print message
  else
      echo "I could not find that element in the database."
  fi

# if argument was not provided
else
  # output message
  echo Please provide an element as an argument.
fi
