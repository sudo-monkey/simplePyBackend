#!/bin/bash
clear

# Set the database name, table name, and username and password 
DBNAME="simpledb"
TABLENAME="myapp_score"
USERNAME="monkey"
PASSWORD="1234"

echo -e "1. Connect to the database and retrieve all columns in the table:"
columns=$(psql -U $USERNAME -d $DBNAME -t -c "SELECT column_name FROM information_schema.columns WHERE table_name = '$TABLENAME'")
sleep 3

echo -e "Columns in table $TABLENAME in database $DBNAME:"
for column in $columns
do
    echo $column
done

sleep 3


echo -e "\n2. Performing 0002_add_column migration with default value:"
python manage.py migrate myapp 0002_add_column

echo -e "\n3. Connect to the database and retrieve all columns in the table"
columns=$(psql -U $USERNAME -d $DBNAME -t -c "SELECT column_name FROM information_schema.columns WHERE table_name = '$TABLENAME'")
sleep 3

echo -e "\n4. Columns in table $TABLENAME in database $DBNAME:"
for column in $columns
do
    echo $column
done

sleep 3

echo -e "\n5. Value for new_column is:"
# Run the query
RESULT=$(psql -U $USERNAME -d $DBNAME -c "SELECT new_column FROM $TABLENAME;" -t)

# Print the result
echo -e "$RESULT"
sleep 4

echo -e "\n6. Testing the endpoint:"
sleep 3

echo -e '\n7. Curl request to curl http://localhost:8001/get_score/'
curl http://localhost:8001/get_score/?user_id=100
response=$(curl http://localhost:8001/get_score/?user_id=100)
echo -e "$response"
sleep 4


echo -e "\n8. Performing 0003_remove_column migration with default value:"
python manage.py migrate myapp 0003_remove_column

echo -e "\n9. Connect to the database and retrieve all columns in the table"
columns=$(psql -U $USERNAME -d $DBNAME -t -c "SELECT column_name FROM information_schema.columns WHERE table_name = '$TABLENAME'")
sleep 1.5

echo -e "\n10. Columns in table $TABLENAME in database $DBNAME:"
for column in $columns
do
    echo $column
done
