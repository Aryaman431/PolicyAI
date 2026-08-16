#!/bin/bash

echo "PolicyAI Setup Script"
echo "===================="
echo

echo "1. Installing Python dependencies..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo
echo "✅ Dependencies installed successfully!"
echo
echo "2. Next steps:"
echo "   a) Get a Gemini API key from: https://aistudio.google.com/app/apikey"
echo "   b) Edit the .env file and replace 'your_gemini_api_key_here' with your actual key"
echo "   c) Run the app with: streamlit run app.py"
echo
echo "3. For testing, see example_policies.md for sample policies"
echo
read -p "Press Enter to continue..."