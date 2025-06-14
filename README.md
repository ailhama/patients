# 🏥 Patient Department Recommendation API

This FastAPI project recommends the **most appropriate hospital department** based on a patient's **gender**, **age**, and **symptoms**, powered by **Google Gemini AI** (model: `gemini-2.5-flash-preview-05-20`).

---

## 🚀 Features

- Input: Patient's gender, age, and list of symptoms
- Output: **Only one word** – the name of the recommended hospital department
- Departments may include: Neurology, Cardiology, Gastroenterology, Pulmonology, Orthopedics, Radiology, Psychiatry, etc.
- Powered by Google Gemini API

---

## 📦 Installation & Usage Guide

### 1. Clone the repository

```bash
git clone https://github.com/ailhama/patients.git
cd patients
```

### 2. Create and activate a virtual environment (Optional but recommended)
```bash
# Windows
python -m venv venv
venv\Scripts\Activate.ps1

# macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Set up your Gemini API Key
Create a `.env` file in the project root directory and add:
```bash
GOOGLE_API_KEY=your_google_api_key_here
```
You can get your API key from [Google AI Studio](https://aistudio.google.com/app/apikey).

### 5. Run the FastAPI app
```bash
uvicorn main:app --reload
```

### 6. Access the API
- Endpoint: `http://127.0.0.1:8000/recommend`
- Method:`POST`
- Headers: `Content-Type: application/json`

If you access it directly via a browser (click on the link or type it in the address bar), the browser will always use GET, so it will result in an error.

**Access via Swagger UI:**
- Open: `http://127.0.0.1:8000/docs`
- Click `POST /recommend`
- Click the **“Try it out”** button
- Fill in with sample data:
```json
{
  "gender": "female",
  "age": 62,
  "symptoms": ["pusing", "mual", "sulit berjalan"]
}
```
- Click the **“Execute”** button

**Response example:**
```json
{
  "recommended_department": "Neurology"
}
```

### 📝 Requirements
- Python 3.8+

**Dependencies from** `requirements.txt`:
- fastapi
- uvicorn
- python-dotenv
- google-genai

### 📬 Contact
Developer: Audi Ilham Atmaja

Email: audiatmaja@gmail.com

Feel free to reach out for questions, suggestions, or improvements!
