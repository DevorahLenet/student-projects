"""
Devorah Sachs CS21B Assignment 4
Regex Date Format Converter (Gregorian Calendar)

Regular Expression/Re functions validate and process
user-entered date: mm/dd/yyyy in range 01/01/1000-12/12/2999
Self-defined functions used to convert date into
Month dd, yyyy:
get_int() uses re to convert day and month values to ints 
convert_month() converts user mm to Gregorian month
validate_day() ensures user dd is valid for given mo and yr 
leap_year_test() tests if user year is leap (for dd validation)
Program terminates with sys.exit() if value is invalid.

Imports re and sys modules
Python 3, AWS Cloud9 IDE
"""
import re
import sys

def convert_month(month):
    month_names = ['January', 'February', 'March', 'April', 'May',\
    'June', 'July', 'August', 'September',\
    'October', 'November', 'December']
    
    index = get_int(month) - 1
    return month_names[index]
    
def get_int(date_piece):
    match = re.match(r'^0(\d)', date_piece)
    if (match is not None):
        piece_int = int(match.group(1))
    else:
        piece_int = int(date_piece)  
    return piece_int
    
def validate_day(month, day, year):
    days31 = [1,3,5,7,8,10,12]
    days30 = [4,6,9,11]
    FEB = 2
    FEB_REG_DAYS = 28
    FEB_LEAP_DAYS = 29
    MAX_DAYS = 31
    NOV_DAYS = 30
    
    if (get_int(month) == FEB):
        if (leap_year_test(year) and get_int(day) > FEB_LEAP_DAYS):
            return False
        elif (leap_year_test(year) == False and get_int(day) > FEB_REG_DAYS):
            return False
        else:
            return True
    elif (get_int(month) in days30 and get_int(day) > NOV_DAYS):
        return False
    elif (get_int(month) in days31 and get_int(day) > MAX_DAYS):
        return False #maybe not necessary
    else:
        return True
        
def leap_year_test(year):
    if (int(year) % 4 != 0):
        return False
    elif (int(year) % 100 == 0 and int(year) % 400 != 0):
        return False
    else:
        return True

ERROR_STR = "Invalid date values or format."
LOOP_COUNT = 5
for count in range(LOOP_COUNT):
    in_date = input("Please enter date as mm/dd/yyyy: ")
    
    regex = re.compile\
    ('([0][1-9]|[1][1-2])\/([0][1-9]|[1-2]\d|[3][0-1])\/([1-2]\d\d\d)')
    match = re.match(regex, in_date)
    if match is not None:
        date_list = re.split("/", in_date)
    else:
        sys.exit(ERROR_STR)
    
    str_month = convert_month(date_list[0])
    str_year = date_list[2]
    if (validate_day(date_list[0], date_list[1], str_year)):
        str_day = date_list[1]
    else:
        sys.exit(ERROR_STR)
        
    out_date = "{} {}, {}".format(str_month, str_day, str_year)
    print("Your converted date is: {}.\n".format(out_date))

"""
Test Run:

Please enter date as mm/dd/yyyy: 07/04/1776
Your converted date is: July 04, 1776.

Please enter date as mm/dd/yyyy: 08/26/1920
Your converted date is: August 26, 1920.

Please enter date as mm/dd/yyyy: 06/06/1944
Your converted date is: June 06, 1944.

Please enter date as mm/dd/yyyy: 02/29/2020
Your converted date is: February 29, 2020.

Please enter date as mm/dd/yyyy: 01/34/1096
Invalid date values or format.
"""

