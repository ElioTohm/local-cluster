#!/bin/bash

# --- CONFIGURATION ---
# Define the list of repository names in an array
REPO_NAMES=(cross-plane)

# Define the shared repository URL
REPO_URL="https://charts.crossplane.io/stable" # Assuming this is the URL for all of them
# If each repo has a different URL, this script would need to be modified.

echo "Processing Helm repositories..."

# --- SCRIPT LOGIC ---
# Loop through each repository name in the array
for repo_name in "${REPO_NAMES[@]}"; do
    echo "---"
    echo "Checking for repository: $repo_name"

    # Check if the repository name already exists in the list
    if helm repo list -o json | jq -e ".[] | select(.name == \"$repo_name\")" > /dev/null; then
        # If found, print a confirmation message
        echo "✅ Helm repository '$repo_name' already exists."
    else
        # If not found, add it
        echo "🔎 Helm repository '$repo_name' not found. Adding it now..."
        helm repo add "$repo_name" "$REPO_URL"
    fi
done

echo "---"
echo "All repositories processed."

echo "---"
echo "install crossplane"
echo "---"
helm upgrade --install crossplane \
--namespace crossplane-system \
--create-namespace crossplane-stable/crossplane --wait --atomic

echo "---"
echo "install providers"
echo "---"
kubectl apply -f ./bootstrap/crossplane/provider.yaml
sleep 10
kubectl apply -f ./bootstrap/crossplane/provider-config.yaml




