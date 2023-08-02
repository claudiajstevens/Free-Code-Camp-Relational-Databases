#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~~ Welcome to my Salon ~~~~~\n"



LIST_SERVICES(){
  # show all services
  echo "Here are the services we offer:"
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

LIST_SERVICES

# ask customer to pick a service
echo -e "\nWhat service would you like?"
read SERVICE_ID_SELECTED
NUMBER_OF_SERVICES=$($PSQL "SELECT COUNT(*) FROM services")

# if service is not a number
while [[ $SERVICE_ID_SELECTED > $NUMBER_OF_SERVICES ]]
do
  echo -e "\nPlease choose from the list of services.\n"
  LIST_SERVICES

  # ask customer to pick a service
  echo -e "\nWhat service would you like?"
  read SERVICE_ID_SELECTED
done

# get customer phone number
echo -e "\nWhat is your phone number?"
read CUSTOMER_PHONE

# get customer_id 
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# if customer does not exist
if [[ -z $CUSTOMER_ID ]]
then
  # get customer name
  echo -e "\nWhat is your name?"
  read CUSTOMER_NAME

  # add customer to db
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
fi

echo -e "\nWhat time would you like your appointment?"
read SERVICE_TIME

# add appointment to db
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")

# get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

# display confimation message
echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."


