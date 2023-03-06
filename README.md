# Simple backend algorithm
The following webserver will manipulate USER ID (integer) and add 1 as the SCORE in the backend.

e.g:
USER_ID = 20

Hence, the endpoint will return:
USER_ID: 20
SCORE: 21

The userID, score and timestamp will be recorded inside Postgresql database

# Instructions

Setup:

- (optional) Create a Python virtual environment
- ```pip -m venv venv```
- Activate the virtual environment 
```source venv/bin/activate```
- Install all the dependencies
```pip install -r requirements.txt```

Run:

- Run the webserver (port 8001)
- ```python manage.py runserver 8001```

Test #1: 
- Test the endpoint point via bash script
```bash test.sh```

Test #2:
- Test the endpoint via web browser
```http://127.0.0.1:8001/get_score/?user_id=33```


# Admin panel

To access admin panel:
- create Django superuser and enter ID and password
```python manage.py createsuperuser```

- through web browser:
```http://127.0.0.1:8001/admin```

- Complete the login
