#!/bin/bash

# Render remote database reset script
# Asks for the full external DATABASE URL. URL is not stored.

echo "Paste your Render external DATABASE URL:"
read -s DB_URL

echo ""
echo "Starting database reset..."

SQL_DIR="scripts"

# Check scripts directory
if [ ! -d "$SQL_DIR" ]; then
  echo "Error: SQL directory '$SQL_DIR' does not exist."
  read -p "Press Enter to close..."
  exit 1
fi

# Check SQL files exist
if ! ls "$SQL_DIR"/*.sql >/dev/null 2>&1; then
  echo "No SQL files found in $SQL_DIR."
  read -p "Press Enter to close..."
  exit 1
fi

for SQL_FILE in "$SQL_DIR"/*.sql; do

  echo ""
  echo "Executing $SQL_FILE..."

  "C:/Program Files/PostgreSQL/18/pgAdmin 4/runtime/psql.exe" "$DB_URL" \ \
    -a \
    -v ON_ERROR_STOP=1 \
    -f "$SQL_FILE"

  if [ $? -eq 0 ]; then
    echo "✓ $SQL_FILE executed successfully."
  else
    echo "✗ $SQL_FILE failed."
    read -p "Press Enter to close..."
    exit 1
  fi

done

echo ""
echo "Database reset completed successfully."

read -p "Press Enter to close..."