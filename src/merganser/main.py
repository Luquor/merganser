from fastapi import FastAPI
from .routes.routes import router

from sqlalchemy import text
from .database import SessionLocal


app = FastAPI(title="Merganser")
app.include_router(router)