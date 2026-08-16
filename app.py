import os
import streamlit as st
from dotenv import load_dotenv
from google import genai

load_dotenv()

api_key = os.getenv("GEMINI_API_KEY")

st.title("PolicyAI")
st.write("AI-Powered Policy Analyzer")

policy = st.text_area(
    "Paste your policy",
    height=300,
    placeholder="Paste the policy you want to analyze..."
)

if st.button("Analyze Policy"):
    if not policy.strip():
        st.warning("Please paste a policy first.")
        st.stop()
    
    if not api_key:
        st.error("GEMINI_API_KEY is missing from .env")
        st.stop()
    
    try:
        client = genai.Client(api_key=api_key)
        
        prompt = f"""You are a professional policy analyst.
Analyze the following policy:
--- POLICY ---
{policy}
--- END POLICY ---

Provide:
1. Policy Summary
2. Key Rules
3. Who It Affects
4. Potential Ambiguities
5. Potential Risks
6. Missing Information
7. Recommended Improvements
8. Clarity Score out of 10

Only analyze the provided policy. Do not invent facts.
Keep the response clear and practical."""

        response = client.models.generate_content(
            model="gemini-3.6-flash",
            contents=prompt
        )
        
        st.markdown("## Analysis")
        st.write(response.text)
        
    except Exception as e:
        st.error(f"Gemini API error: {e}")