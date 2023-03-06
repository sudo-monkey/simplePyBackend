#!/bin/bash

API_ENDPOINT="http://localhost:8001/get_score/"
$USER_ID
$SCORE

# Asking user for USER_ID
echo 'Please enter USER_ID (integer):'
read USER_ID

# Asking user for SCORE
echo 'Please enter dummy score (will be overwritten)'
read SCORE


# Make a GET request to the API endpoint and store the response in a variable
RESPONSE=$(curl -s -X GET "${API_ENDPOINT}?user_id=${USER_ID}&score=${SCORE}")

# Print the response to the console
echo "Response: ${RESPONSE}"

