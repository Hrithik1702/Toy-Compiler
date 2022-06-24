
%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
%}
%%

#.* 							{return HEADER;}
[a-zA-z][A-Za-z0-9_]*\[[a-zA-z][A-Za-z0-9_]*\]	{return ARRAY;}
"if"							{return IF;}
"else"							{return ELSE;}
"=="							{return CMP;}
"<"							{return LT;}
"++"							{return INCREMENT_OP;}
"for"							{return FOR;}
"char"							{return CHAR;}
"int"							{return INT;}
"main"							{return MAIN;}
[a-z][a-z]*\((.|\\n)*\);				{return FUNCTION;}
[(){}|, ;] 						{return SEPARATOR;}
[a-zA-z][A-Za-z0-9_]* 					{return ID;}
"="							{return EQUAL;}
[+|-]?[0-9][0-9]*					{return INT_NUM;}
"+"							{return ADD;}
"-"							{return SUB;}

%%
int yywrap(void){
	return 1;
}
