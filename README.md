Ruby exercise: Budget management project
The project goal: Build a simple budget management program that runs inside the terminal using everything you’ve learned about Ruby. Please note you are expected to complete any missing knowledge by searching around the internet.

Project Spec:

When first running the program, the user will be promoted to enter a name as a string and a budget as a float.
The name and budget should be save inside a data JSON file for later use. The JSON structure and filename is up to you. Example:
# user.json
{
"name": "Yossi",
"budget": 25.5
}
Upon returning to the program, if a data JSON file exists, the user should be greeted by his name and current budget and should not be promoted to enter a name and budget again.
Hello Yossi! Your budget is 25.5$
After saving a new user to the data file or greeting the existing user a menu should be displayed in the terminal.
The main menu should display the user current balance and a list of options:
*** Current balance: 25.5$ ***

1) New income
2) New expanse
3) Search a record
4) List all records
   The user should be promoted to make a selection based on the menu number.
   At any point, if the user enters “menu” as a selection the program will return to the main menu.
   At any point, if the user enters “exit” as a selection the program will should exit.
   The new income and new expanse options
   The user will be promoted to enter an amount and an optional description with a “None” default.
   Once finished a new record should be persisted inside a JSON file. Example:
# records.json
{
"records": [
{
"type": "expanse",
"description": "Coffee on my way to work",
"amount": 1.25
},
{
"type": "income",
"description": "None",
"amount": 12
}
]
}
Any new record should update the current user budget.
Upon saving the new record the user should be redirected to the main menu.
The search option
The user should be promoted to enter a search term.
The program will list any records with description that contains the search term, in case of income the amount will be prefixed with a “+” sign, in case of an expanse the amount should be prefix with a “-“ sign. The total number of results and the search term should be displayed as well.
Example for the search term “blue”:

Found 3 records for "blue":
-------------------------------
Blue beachball | -2.34$
Sold my blue headphones | +21$
Brought a new bluegrass record | -7$
After displaying the results the user should be redirected to the main menu.
List all records
Should list all records Example:
Found 3 records:
-------------------------------
Blue beachball | -2.34$
Sold my blue headphones | +21$
Brought a new bluegrass record | -7$
After listing all the records the user should be redirected to the main menu.
# BudgetProject
