# TOY COMPILER
A Compiler with syntax analyser and semantic analyser for C-like Language.

## Features
- ### Syntax Analyser
    -  Declaration Statement (with optional Assignment and multiple declaration)
    - Assisgnment Statement 
    - Array Declaration Statement Assignment
    - Control Statement (if,else)
    - Iterative Statement (for)
    - Function calls
- ### Semantic Analyser 
    - Multiple Declaration of same variable is validated
    - Reference before declaration validated
 - ### Symbol Table
    - Stores variable names
    - user defined functions
    - Keywords with line number 
- ### Palindrome Program 
    - Given a string checks if it is palindrome using YACC (Productions)

## Installation of LEX and YACC
    sudo apt-get install bison flex
    
## Executing LEX Program
    lex lexfile.l
    cc lex.yy.c -lfl
    ./a.out

## Executing YACC Program
    yacc yaccfile.y
    gcc lex.yy.c y.tab.c -o a.exe
    ./a.exe

## SCREENSHOTS

|![image](https://user-images.githubusercontent.com/86526347/175648976-a1584f93-bb3b-44fb-ae89-e89380d28671.png)
|:--:|
| *syntactically and semantically correct C file* |
