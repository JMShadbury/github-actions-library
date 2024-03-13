FROM python
WORKDIR /app
COPY . /app
RUN pip install pylint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
