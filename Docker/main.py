from fastapi import FastAPI
app = FastAPI()
@app.get("/")
async def root():
    return """
    <html>
    <head>
        <title>Hello, World!</title>
    </head>
    <body>
        <h1>Hello, World!</h1>
        <p>This is a web page.</p>
    </body>
    </html>
    """