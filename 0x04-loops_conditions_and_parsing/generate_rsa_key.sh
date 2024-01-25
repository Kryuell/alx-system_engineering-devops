#!/bin/bash

# Generate RSA key pair
ssh-keygen -t rsa -b 4096 -C "Kryuel17@gmail.com" -f ~/.ssh/id_rsa

# Get the public key
PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub)

# Save the public key to the specified file
echo "$PUBLIC_KEY" > 0-RSA_public_key.pub

echo "RSA public key generated and saved to 0-RSA_public_key.pub."


