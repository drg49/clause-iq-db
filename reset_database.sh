#!/bin/bash

# Database connection details
DB_USER="postgres"
DB_NAME="match"

# Directory containing SQL scripts
SQL_DIR="scripts"

# Iterate through SQL files in the directory and execute them
for SQL_FILE in "$SQL_DIR"/*.sql; do
  # Use psql to execute the SQL script
  psql -U $DB_USER -d $DB_NAME -a -f "$SQL_FILE"

  # Check the exit status of psql
  if [ $? -eq 0 ]; then
    echo "Script $SQL_FILE executed successfully."
  else
    echo "Script $SQL_FILE execution failed."
  fi
done
