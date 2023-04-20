#!/bin/bash

# Fetch the list of templates
curl https://api.github.com/repos/givinghawk/TemplateWizard/contents/templates | jq '.[].name' | sed 's/"//g' > templates.txt

# Prompt the user to select a template
template=$(cat templates.txt | fzf)

# Download the template files
curl -L https://api.github.com/repos/givinghawk/TemplateWizard/contents/templates/${template} | jq -r '.[].download_url' | xargs -n 1 curl -O

# Install dependencies (example for npm)
npm install
