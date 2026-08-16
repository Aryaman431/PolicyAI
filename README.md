# PolicyAI - AI-Powered Policy Analyzer

A simple, beginner-friendly Streamlit application that uses Google's Gemini AI to analyze policy documents. Get instant feedback on policy clarity, completeness, and potential issues.

## Features

- **Simple AI Analysis**: Uses Google Gemini 3.6 Flash model for fast policy analysis
- **Structured Output**: Provides analysis in 8 key categories:
  1. Policy Summary
  2. Key Rules
  3. Who It Affects
  4. Potential Ambiguities
  5. Potential Risks
  6. Missing Information
  7. Recommended Improvements
  8. Clarity Score (1-10)
- **Minimal Interface**: Clean, straightforward Streamlit UI
- **Error Handling**: Friendly error messages for common issues
- **Beginner-Friendly**: Simple code structure with only essential dependencies

## Installation

### 1. Clone or download the project
```bash
git clone <repository-url>
cd policy-analyzer
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Get a Gemini API Key
1. Go to [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Create an API key (free tier available)
3. Copy your API key

### 4. Configure environment
Create or edit the `.env` file:
```bash
GEMINI_API_KEY=your_actual_api_key_here
```

**Important**: Never commit the `.env` file to version control!

## Usage

### Run the application
```bash
streamlit run app.py
```

The application will open in your default browser at `http://localhost:8501`

### How to Use
1. **Paste Policy Text**: Copy and paste your policy document into the text area
2. **Click Analyze**: Press the "Analyze Policy" button
3. **Review Results**: The AI analysis will appear below with all 8 sections clearly displayed
4. **Try Different Policies**: Use the example policies in `example_policies.md` for testing

## Example Policy
You can test with this sample policy:
```
Employees must submit expense reports within 30 days of purchase. All expenses over $500 require manager approval. Failure to comply may result in disciplinary action. Receipts must be original and itemized. Travel expenses require pre-approval for trips over 100 miles. Company credit cards are for business use only.
```

## Project Structure
```
policy-analyzer/
├── app.py              # Main Streamlit application (single file, simple structure)
├── .env               # Environment variables (API key) - DO NOT COMMIT
├── .env.example       # Environment template - safe to commit
├── .gitignore         # Git ignore rules - protects sensitive files
├── requirements.txt   # Python dependencies (only 3 packages)
├── README.md         # This file
├── example_policies.md # Sample policies for testing
├── setup.bat         # Windows setup script
└── setup.sh          # Linux/macOS setup script
```

### Simple Code Structure
The main application (`app.py`) follows a minimal, beginner-friendly structure:
```python
import os
import streamlit as st
from dotenv import load_dotenv
from google import genai

load_dotenv()

api_key = os.getenv("GEMINI_API_KEY")

st.title("PolicyAI")
st.write("AI-Powered Policy Analyzer")

# Simple text area for policy input
policy = st.text_area("Paste your policy", height=300)

if st.button("Analyze Policy"):
    # Validation and Gemini API call
    # Returns structured analysis in 8 categories
```

## Dependencies
- `streamlit`: Web application framework
- `google-genai`: Google Gemini AI Python SDK
- `python-dotenv`: Environment variable management

## Limitations
- Maximum policy length: ~10,000 characters (Gemini API limit)
- Requires internet connection for Gemini API calls
- Analysis quality depends on the Gemini model

## Privacy & Security
- Policy text is sent to Google's Gemini API for analysis
- No data is stored locally
- API keys should be kept secret
- Use the `.env` file for sensitive configuration

## Version Control
This project includes a `.gitignore` file to protect sensitive information:

### Files to NEVER commit:
- `.env` - Contains your API key
- Virtual environment directories (`venv/`, `.venv/`, `env/`)
- Python cache files (`__pycache__/`, `*.pyc`)
- IDE files (`.vscode/`, `.idea/`)

### Safe to commit:
- `.env.example` - Template for environment variables
- All source code files
- Documentation
- Setup scripts

### Initial Git setup:
```bash
# Clone or initialize repository
git init

# Add all safe files
git add .

# Check what will be committed (should NOT show .env)
git status

# Commit
git commit -m "Initial commit: PolicyAI project"

# Create .env file from template
cp .env.example .env
# Edit .env with your actual API key
```

## Troubleshooting

### Common Issues
1. **"API Key not found"**: Make sure your `.env` file contains `GEMINI_API_KEY=your_key`
2. **Gemini API errors**: Check your internet connection and API key validity
3. **Empty analysis**: Try a different policy text or check for special characters

### Getting Help
If you encounter issues:
1. Verify your API key is valid
2. Check that dependencies are installed
3. Ensure you have internet connectivity

## License
This project is for educational and demonstration purposes. Use at your own risk.

## Acknowledgments
- Built with [Streamlit](https://streamlit.io/)
- Powered by [Google Gemini AI](https://deepmind.google/technologies/gemini/)
- Simple, beginner-friendly design