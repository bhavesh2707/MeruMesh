from fastapi import FastAPI
from mangum import Mangum


app = FastAPI()


@app.get("/test_run")
async def healthcheck():
    return {"success": "pong!"}

@app.get("/api")
async def healthcheck():
    return {"success": "pong!"}

handler = Mangum(app)