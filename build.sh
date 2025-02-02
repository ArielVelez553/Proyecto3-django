#!/usr/bin/env bash

# exit on error
set -o errexit
# poetry install
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py makemigrations --no-input
python manage.py migrate




if [[ $CREATE_SUPERUSER ]];
then
  python manage.py createsuperuser --no-input
fi