#!/bin/bash

# Variables (replace with your GitHub details)
GITHUB_USERNAME="your_username"
REPO_NAME="your_repo_name"
ACCESS_TOKEN="your_token"  # GitHub token with repo creation permissions
DESCRIPTION="This is my new project."
PRIVATE=false  # Set to true if you want the repo to be private

# Create a new GitHub repository using GitHub API
echo "Creating GitHub repository $REPO_NAME..."
curl -H "Authorization: token $ACCESS_TOKEN" \
    -d "{\"name\": \"$REPO_NAME\", \"description\": \"$DESCRIPTION\", \"private\": $PRIVATE}" \
    https://api.github.com/user/repos

# Initialize a new git repository
echo "Initializing local git repository..."
git init
git add .
git commit -m "Initial commit"

# Add remote origin and push to GitHub
echo "Pushing to GitHub..."
git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git
git branch -M main
git push -u origin main

echo "Repository $REPO_NAME created and code pushed to GitHub."

