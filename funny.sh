#!/bin/zsh

# Funny questions
questions=("Why did the chicken cross the road?" "What's the difference between ignorance and apathy?" "Why don't scientists trust atoms?" "Why couldn't the bicycle stand up by itself?" "Why was the math book sad?")
# Funny responses
responses=("To get to the other side!" "I don't know and I don't care!" "Because they make up everything!" "It was two-tired!" "Because it had too many problems!")

# Randomly select a question and its corresponding response
index=$(( RANDOM % ${#questions[@]} ))

# Display the funny question using cowsay
echo "${questions[$index]}" | cowsay -f "$(ls /usr/share/cowsay/cows/ | shuf -n 1)"

# Generate a random ASCII art using figlet or toilet for the response
response="${responses[$index]}"
if command -v figlet &> /dev/null; then
    figlet "$response"
elif command -v toilet &> /dev/null; then
    toilet -f term -F border "$response"
else
    echo "$response"
fi
