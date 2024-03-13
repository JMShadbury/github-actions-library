#!/bin/sh -l

# Install dependencies
pip install -r requirements.txt

# Run Pylint
pylint $(git ls-files '*.py') > pylint_output.txt
