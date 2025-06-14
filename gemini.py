import os
from dotenv import load_dotenv
from google import genai

load_dotenv()

api_key = os.getenv("GOOGLE_API_KEY")
client = genai.Client(api_key=api_key)

def recommendation(gender: str, age: int, symptoms: list[str]) -> str:
    prompt = f"""
    Seorang pasien memiliki data sebagai berikut:
    - Gender: {gender}
    - Umur: {age}
    - Gejala: {', '.join(symptoms)}

    Berdasarkan informasi tersebut, tentukan **satu** departemen spesialis rumah sakit yang **paling sesuai** untuk menangani pasien ini. 
    Pilihan dapat berupa: Neurology, Cardiology, Gastroenterology, Pulmonology, Orthopedics, Radiology, Psychiatry, dan lainnya.

    **Jawab hanya dengan satu kata, yaitu nama departemen saja. Tanpa penjelasan atau tambahan kata lain.**
    """

    response = client.models.generate_content(
        model="gemini-2.5-flash-preview-05-20",
        contents=prompt
    )

    return response.text.strip()
