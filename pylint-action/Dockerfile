FROM python:${{ inputs.python-version }}

RUN pip install pylint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
