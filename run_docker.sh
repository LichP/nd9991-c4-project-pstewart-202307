#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t boston-housing-prediction .

# Step 2: 
# List docker images
docker image ls -f reference=boston-housing-prediction

# Step 3: 
# Run flask app
docker run -p 8000:80 boston-housing-prediction
