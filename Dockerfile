# Stage 1: Install dependencies using a regular Python image
FROM python:3.13-slim AS builder

RUN pip install --no-cache-dir requests==2.31.0

# Stage 2: Copy installed packages into the DHI base
FROM dhi.io/python:3.13

COPY --from=builder /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages

WORKDIR /app

CMD ["python", "--version"]
