FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt --upgrade

RUN pip install gdown

RUN gdown -O leaf_model.pkl --id 1E2v1kURSb_5jgWM-2fASBBSyQxlKy_y1

# COPY leaf_model.pkl app/

COPY app app/

RUN python app/server.py

EXPOSE 5042

CMD ["python", "app/server.py", "serve"]