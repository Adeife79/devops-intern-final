FROM python:3.11-slim

WORKDIR /app

COPY hello.py .

RUN chmod +x hello.py

CMD ["python3", "hello.py"]
