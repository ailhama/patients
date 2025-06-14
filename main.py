from fastapi import FastAPI
from pydantic import BaseModel
from typing import List
from gemini import recommendation

app = FastAPI(title="Patient Recommendation API")

class PatientInfo(BaseModel):
    gender: str
    age: int
    symptoms: List[str]

@app.post("/recommend")
def recommend_department(info: PatientInfo):
    department = recommendation(info.gender, info.age, info.symptoms)
    return {"recommended_department": department}
