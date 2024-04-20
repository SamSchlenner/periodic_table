#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no argument
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # look for atomic number
  ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1")
  if [[ -n $ATOMIC_NUMBER ]]
  then
    SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUMBER")
    NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUMBER")
    TYPE=$($PSQL "select type from properties join types using (type_id) where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  else
    # look for symbol
    SYMBOL=$($PSQL "select symbol from elements where symbol='$1'")
    if [[ -z $SYMBOL ]]
    then
      echo "$SYMBOL"
    else
      echo "null"
    fi
    # if no symbol
    # look for name
    # if no name
      # I could not find that element in the database.
  fi

fi




