FROM PYTHON:3.11-slim

RUN pip instal --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python","app.py"]
