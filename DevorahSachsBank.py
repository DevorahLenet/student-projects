"""
CS21B Foothill Assignment 3
This file contains the BankAccount class.
object: contains balance and last date interest was added
some functions: deposit - adds to balance
withdraw - subtracts from balance; if balance is insufficient,
charges 10$ overdraft fee.
add interest - Interest can only be added once a month, and can
only be within specified range. Tests for these, adds interest.
Can declare initial balance in constructor when intialize

imports datetime and decimal modules
Python 3 in AWS Cloud9 IDE
"""
from decimal import *
from datetime import date

class BankAccount():
    
    OVERDRAFT_FEE = Decimal('10.0')
    DEFAULT_INIT_BAL = Decimal('0.0')
    MIN_RATE = 1
    MAX_RATE = 2
   
    def __init__(self, initial_balance = DEFAULT_INIT_BAL):
        if (str(initial_balance).isdigit and initial_balance >= 0):
            self.balance = Decimal(str(initial_balance)) #str initial_b?
        self.last_interest_date = None

    
    def deposit(self, amount):
        if (str(amount).isdigit and amount > 0):
            self.balance += Decimal(str(amount))
            return True
        else:
            return False
    
    def withdraw(self, amount):
        if (str(amount).isdigit and amount > 0):
            if (amount <= self.balance):
                self.balance -= Decimal(str(amount))
                return True
            else:
                self.balance = self.balance - self.OVERDRAFT_FEE
                return False
                
    def add_interest(self, rate):
        if (self.last_interest_date != None and\
        date.today().month == self.last_interest_date.month\
        and date.today().year == self.last_interest_date.year):
            return False
        elif (self.MIN_RATE <= rate <= self.MAX_RATE):
            self.balance += Decimal(self.balance * (Decimal(rate)/100))
            self.last_interest_date = date.today()
            return True
        else:
            return False
    
    
    def get_balance(self):
        return self.balance
        
    

        

        
        
    
    