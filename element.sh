#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no argument
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # look for atomic number
  ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1")
  echo $ATOMIC_NUMBER
  # if no atomic number
  # look for symbol
  # if no symbol
  # look for name
  # if no name
fi




