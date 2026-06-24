FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 755 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir uv \
 && uv pip install --system --no-cache -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
