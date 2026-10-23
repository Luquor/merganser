"""
GET  /
GET  /decks
GET  /decks/{deck_id}
POST /decks
POST /decks/{deck_id}/cards
GET  /review
GET  /review/{card_id}/answer
POST /review/{card_id}/rate
"""
from fastapi import APIRouter

from ..database import SessionLocal
from sqlalchemy import text


router = APIRouter()


@router.get("/health/api")
async def home():
  return { "application": "Merganser", "status": "ok" }


@router.get("/health/db")
def database_health() -> dict[str, str]:
    with SessionLocal() as db:
        db.execute(text("SELECT 1"))
    return {"database": "ok"}


@router.get("/decks")
def database_list_decks():
  with SessionLocal() as db:
    data = db.execute(text("SELECT * FROM decks"))
  for record in data:
    print("\n", record)
  return True