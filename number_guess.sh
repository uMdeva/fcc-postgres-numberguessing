#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to get user information
get_user_info() {
  USERNAME=$1
  USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")
  echo "$USER_INFO"
}

# Function to insert a new user
insert_new_user() {
  USERNAME=$1
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
}

# Function to update user stats
update_user_stats() {
  USER_ID=$1
  GAMES_PLAYED=$2
  BEST_GAME=$3
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID")
}

# Function to insert a new game
insert_new_game() {
  USER_ID=$1
  GUESSES=$2
  INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")
}

echo "Enter your username:"
read USERNAME

USER_INFO=$(get_user_info $USERNAME)

if [[ -z $USER_INFO ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  insert_new_user $USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME=0
else
  USER_ID=$(echo $USER_INFO | cut -d'|' -f1)
  GAMES_PLAYED=$(echo $USER_INFO | cut -d'|' -f2)
  BEST_GAME=$(echo $USER_INFO | cut -d'|' -f3)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"
while read GUESS; do
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  GUESSES=$(( GUESSES + 1 ))

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))

if [[ $BEST_GAME -eq 0 || $GUESSES -lt $BEST_GAME ]]; then
  BEST_GAME=$GUESSES
fi

update_user_stats $USER_ID $GAMES_PLAYED $BEST_GAME
insert_new_game $USER_ID $GUESSES
