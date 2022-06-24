%{
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
void yyerror(char* s){
	fprintf(stderr,"%s\n",s);
}
int line_number = 1;
#define YYSTYPE double
void add_entry(int ln,char type);
char id_name[100];
char id_value[100];
char dtype[10];
int flag =0;
int start_line = 1;
int start_flag = 0; 
%}
%token FUNCTION HEADER INT SEPARATOR MAIN ID INT_NUM EQUAL CHAR ARRAY FOR INCREMENT_OP LT ADD SUB IF ELSE CMP
%%

S : headers datatype SEPARATOR MAIN{line_number++;} SEPARATOR SEPARATOR SEPARATOR body SEPARATOR 
{printf("\t--------Syntactically Correct!!------\n\n");};

headers : headers headers
	| HEADER {add_entry(line_number,'H');line_number++;}	;
	
body : declaration SEPARATOR{line_number++;}
|body body
|function {line_number++;}
|array_declaration {line_number++;}
|for_loop {line_number++;}
|array_assignment{line_number++;}
|assignment{line_number++;}
|control {line_number++;};

control : IF{add_entry(line_number,'I');} conditional SEPARATOR {line_number++;}body SEPARATOR 
{line_number++;add_entry(line_number,'S');}ELSE {line_number++;} SEPARATOR body {line_number++;}SEPARATOR ;

assignment : {add_entry(line_number,'B');}ID SEPARATOR EQUAL SEPARATOR {add_entry(line_number,'A');}expression sep sep;

expression: expression arithmetic expression
| value
| ID
;

arithmetic: ADD 
| SUB
|
;

array_declaration : datatype SEPARATOR  {add_entry(line_number,'K');}ARRAY sep SEPARATOR;

array_assignment: ARRAY SEPARATOR EQUAL SEPARATOR ARRAY SEPARATOR;

for_loop: FOR{start_line = line_number;} SEPARATOR declaration SEPARATOR SEPARATOR conditional SEPARATOR 
SEPARATOR ID INCREMENT_OP SEPARATOR SEPARATOR {add_entry(line_number,'L'); line_number++;} body SEPARATOR;

conditional:SEPARATOR ID SEPARATOR relop SEPARATOR value SEPARATOR;

relop: LT {add_entry(line_number,'<');}
|CMP {add_entry(line_number,'E');};

datatype : INT {add_entry(line_number,'K'); strcpy(dtype,"INT");}|
CHAR{add_entry(line_number,'C'); strcpy(dtype,"CHAR");};

declaration : datatype sep {add_entry(line_number,'D');}ID sep optional_assignment;

optional_assignment :  EQUAL sep {add_entry(line_number,'A');}value {add_entry(line_number,'=');}
| 
;

sep : SEPARATOR
|;

function: FUNCTION{add_entry(line_number,'F');};


value: INT_NUM 
| FUNCTION
|ID 
;
%%

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "lex.yy.c"
struct entry{
        int  line_no;
        char name[100];
        char type[100];
} symbol_table[40];
int entry_number = 0;
int search(){
	for(int i =0;i<entry_number;i++){
		if(strcmp(symbol_table[i].name,id_name)==0){
			return i;
		}
	}
	return -1;
}

void print_symboltable(){
	printf("\t--------Symbol Table------\n\n");
	printf("NAME\t\t    TYPE\t\tLINE NO\n\n");
	for(int i =0;i<entry_number;i++){
		int len =20;
		printf("%s",symbol_table[i].name);
		for(int j = len-strlen(symbol_table[i].name);j>0;j--){
			printf(" ");
		}
		printf("%s",symbol_table[i].type);
		for(int j = len-strlen(symbol_table[i].type);j>0;j--){
			printf(" ");
		}
		printf("%d\n",symbol_table[i].line_no);
		
	}
}
void add_entry(int ln,char type){
	if(type == 'H'){
		strcpy(symbol_table[entry_number].name,"Header");
		strcpy(symbol_table[entry_number].type,"Null");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'I'){
		strcpy(symbol_table[entry_number].name,"IF");
		strcpy(symbol_table[entry_number].type,"KEYWORD");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'L'){
		strcpy(symbol_table[entry_number].name,"FOR");
		strcpy(symbol_table[entry_number].type,"KEYWORD");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'K'){
		strcpy(symbol_table[entry_number].name,"INTEGER");
		strcpy(symbol_table[entry_number].type,"KEYWORD");

		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'C'){
		strcpy(symbol_table[entry_number].name,"CHAR");
		strcpy(symbol_table[entry_number].type,"KEYWORD");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == '='){
		strcpy(symbol_table[entry_number].name,"=");
		strcpy(symbol_table[entry_number].type,"OP");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == '<'){
		strcpy(symbol_table[entry_number].name,"<");
		strcpy(symbol_table[entry_number].type,"RELATIONAL OP");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'E'){
		strcpy(symbol_table[entry_number].name,"==");
		strcpy(symbol_table[entry_number].type,"RELATIONAL OP");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'F'){
		strcpy(symbol_table[entry_number].name,"fun");
		strcpy(symbol_table[entry_number].type,"FUNCTION");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
	}
	else if(type == 'B'){
		strcpy(id_name,yytext);
	}
	else if(type == 'A'){
		int temp = search();
		if(temp!=-1){

		}else{
			flag =1;
		}
	}
	else if(type == 'D'){
		strcpy(id_name,yytext);
		int temp = search();
		if(temp==-1){
			strcpy(symbol_table[entry_number].name,yytext);
			strcpy(symbol_table[entry_number].type,dtype);
			symbol_table[entry_number].line_no = ln;
			entry_number++;
		}else{
			flag =1;
		}
		
	}
	else if(type == 'S'){
		strcpy(symbol_table[entry_number].name,"ELSE");
		strcpy(symbol_table[entry_number].type,"KEYWORD");
		symbol_table[entry_number].line_no = ln;
		entry_number++;
		
	}
}
int main()
{
    yyparse();
    if(flag ==1){
    	printf("\t--------Semantically Wrong!!------\n\n");
    }
    else{
    	printf("\t--------Semantically Correct!!------\n\n");
    }
    print_symboltable();
}

