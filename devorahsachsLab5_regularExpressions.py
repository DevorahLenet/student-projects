"""
Devorah Sachs CS21B Assignment 5
Application reads in a url's webpage and decodes it to str,
then uses regular expression to find the number of times
given words appear on the webpage.

Imports: urllib.request.urlopen, urllib.error...,
datetime.date, re.

Python 3, AWS Cloud9 IDE
"""
from urllib.request import urlopen
from urllib.error import URLError, HTTPError
from datetime import date
import re

url = 'http://www.nasonline.org'

try:
    req = urlopen(url)
    resp = req.read()
    res_data = resp.decode('utf-8')
    req.close()
except HTTPError as htmlerror:
    print(htmlerror)
except URLError as urlerror:
    print(urlerror)
except UnicodeDecodeError as decodeerror:
    print(decodeerror)

topics = ['research', 'climate', 'evolution', 'cultural', 'leadership',\
'nation', 'physical', 'science', 'biological', 'biographical'] 

dt = date.today()
print(f"Today's date is {dt}.\n") 

for word in topics:
    ex = re.compile('\\b' + word + '\\b', re.IGNORECASE)
    num_occurences = len(re.findall(ex, res_data))
    if (num_occurences == 1):
        print(f"{word.capitalize()} appears {num_occurences} time.")
    else:
        print(f"{word.capitalize()} appears {num_occurences} times.")
        
        
"""
Sample Test Run:

Today's date is 2020-05-27.

Research appears 11 times.
Climate appears 2 times.
Evolution appears 4 times.
Cultural appears 8 times.
Leadership appears 4 times.
Nation appears 1 time.
Physical appears 1 time.
Science appears 29 times.
Biological appears 1 time.
Biographical appears 7 times.
"""





