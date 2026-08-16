@echo off
echo PolicyAI Setup Script
echo ====================
echo.

echo 1. Installing Python dependencies...
pip install -r requirements.txt

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ✅ Dependencies installed successfully!
echo.
echo 2. Next steps:
echo    a) Get a Gemini API key from: https://aistudio.google.com/app/apikey
echo    b) Edit the .env file and replace "your_gemini_api_key_here" with your actual key
echo    c) Run the app with: streamlit run app.py
echo.
echo 3. For testing, see example_policies.md for sample policies
echo.
pause