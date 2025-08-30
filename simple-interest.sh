#!/usr/bin/env bash
# simple-interest.sh — calculate Simple Interest (SI = P * R * T / 100)

# Function to check if input is a number (integer or decimal)
is_number() {
  [[ "$1" =~ ^[0-9]+([.][0-9]+)?$ ]]
}

# If no arguments are provided, run interactively
if [ $# -eq 0 ]; then
  read -p "Enter Principal (P): " P
  read -p "Enter Rate of Interest (R): " R
  read -p "Enter Time (T): " T
else
  # Script should accept exactly 3 arguments
  if [ $# -ne 3 ]; then
    echo "Usage: $0 <Principal> <Rate> <Time>"
    echo "Example: $0 10000 7.5 2"
    exit 1
  fi
  P=$1
  R=$2
  T=$3
fi

# Validate inputs
if ! is_number "$P"; then
  echo "Error: Principal must be a number."
  exit 1
fi
if ! is_number "$R"; then
  echo "Error: Rate must be a number."
  exit 1
fi
if ! is_number "$T"; then
  echo "Error: Time must be a number."
  exit 1
fi

# Calculate Simple Interest
SI=$(echo "scale=2; ($P * $R * $T) / 100" | bc -l)

# Print result
echo "Simple Interest = $SI"
