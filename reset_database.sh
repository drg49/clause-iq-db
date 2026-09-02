#!/bin/bash

# Database connection details
DB_USER="postgres"
DB_NAME="clause-iq"

# Ask for the password once
read -s -p "Enter PostgreSQL password: " DB_PASSWORD
echo

# Directory containing SQL scripts
SQL_DIR="scripts"

# Iterate through SQL files in the directory and execute them
for SQL_FILE in "$SQL_DIR"/*.sql; do
  echo "Executing $SQL_FILE..."

  PGPASSWORD="$DB_PASSWORD" psql \
    -U "$DB_USER" \
    -d "$DB_NAME" \
    -a \
    -f "$SQL_FILE"

  # Check the exit status of psql
  if [ $? -eq 0 ]; then
    echo "Script $SQL_FILE executed successfully."
  else
    echo "Script $SQL_FILE execution failed."
    exit 1
  fi
done

echo "All SQL scripts executed successfully."

read -p "Press Enter to close..."