FROM python:3.9\nCOPY . /app\nWORKDIR /app\nCMD ["python", "app.py"]
