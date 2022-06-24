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
    
## Commands to Executing LEX Program
    lex lexfile.l
    cc lex.yy.c -lfl
    ./a.out

## Commands to Execute YACC Program
    yacc yaccfile.y
    gcc lex.yy.c y.tab.c -o a.exe
    ./a.exe

## SCREENSHOTS

|![image](https://user-images.githubusercontent.com/86526347/175648976-a1584f93-bb3b-44fb-ae89-e89380d28671.png)
|:--:|
| *syntactically and semantically correct C file* |

|![image](https://user-images.githubusercontent.com/86526347/175649456-57f63daf-335d-4221-a569-e006e67759c0.png)
|:--:|
| *Output syntactically and semantically correct C file* |

|![image](https://user-images.githubusercontent.com/86526347/175649559-173a81c3-2265-4ffe-b050-dc9196d00247.png)
|:--:|
| *Output - LEX Program* |

|![image](https://user-images.githubusercontent.com/86526347/175649678-0a0476f9-815e-4131-a9f3-a208ac87cbc8.png)
|:--:|
| *Output - Symbol Table* |

|![image](https://user-images.githubusercontent.com/86526347/175649748-3ad2ee8e-ff91-4f3c-8754-27a099ab71d0.png)
|:--:|
| *Output - Evaluation program* |
