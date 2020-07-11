%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	int yyerror();
	extern FILE *yyin;
    #include "variable.h"
%}
%locations %define api.pure full 
%token semi PUBLIC PRIVATE PROTECTED STATIC_KEY MAIN API_REF IMPORT UNTIL ID INT VOID STRING_KEY 
NUMBER STRING DO END WHILE REPEAT IF EQUAL FOR IN ELSE ELSEIF THEN BREAK RETURN THROWS NEW_KEY
LOCAL COLON DOT COMMA MINUS PLUS GREATER_THAN GREATER_THAN_EQUAL LESSER_THAN LESSER_THAN_EQUAL 
EQUALS NOT_EQUALS MOD POWER AND OR OPEN_FLOW CLOSE_FLOW OPEN_BRAC CLOSE_BRAC SQUA_OPEN CLASS SYSTEMPRINT
SQUA_CLOSE TRUE FALSE SHORT_ADD SHORT_MINUS SHORT_MUL SHORT_DIV SHORT_MOD INCREMENT DECREMENT SCANNER
%left      OR 
%left      AND 
%left      LESSER_THAN LESSER_THAN_EQUAL GREATER_THAN GREATER_THAN_EQUAL EQUALS NOT_EQUAL 
%left      PLUS MINUS 
%left      MUL DIV MOD 
%right     POWER
%%
SOURCE_CODE     : IMPORT_STMT CLASS_DCLR 
                | CLASS_DCLR
                ;

IMPORT_STMT     : IMPORT API_REF semi IMPORT_STMT
                | 
                ;

CLASS_DCLR      : ACCESS CLASS ID OPEN_FLOW CLASS_DEF CLOSE_FLOW CLASS_DCLR
                |
                ;

CLASS_DEF       : MAIN_METHOD 
                |
                ;

MAIN_METHOD     : ACCESS STATIC TYPE MAIN OPEN_BRAC PARAM CLOSE_BRAC EXCEPTIONS OPEN_FLOW STMT CLOSE_FLOW
                ;

ACCESS          : PUBLIC 
                | PRIVATE 
                | PROTECTED 
                | 
                ;

STATIC          : STATIC_KEY
                |
                ;

PARAM           : TYPE PARAM_DASH 
                |
                ;

PARAM_DASH      : ID SQUA_OPEN SQUA_CLOSE 
                | SQUA_OPEN SQUA_CLOSE ID
                ;

TYPE            : INT 
                | VOID 
                | STRING_KEY
                | SCANNER
                ;

EXCEPTIONS      : THROWS API_REF 
                |
                ;

STMT            : VAR_DCLR semi STMT 
                | CALL_STMT semi STMT 
                | ASSIGN_STMT semi STMT 
                | CTRL_STMT STMT 
                | OPEN_FLOW STMT CLOSE_FLOW 
                | OUTPUT_STATEMENT semi
                |
                ;

OUTPUT_STATEMENT: SYSTEMPRINT OPEN_BRAC STRING CSIDS CLOSE_BRAC
                ;

CSIDS           : COMMA ID CSIDS
                |
                ;

VAR_DCLR        : TYPE ID VAR_INIT MORE_VAR_DCLR 
                ;

VAR_INIT        : EQUAL VAR_INITIAL_VAL 
                | 
                ;

VAR_INITIAL_VAL : EXPR 
                | NEW
                ;

NEW             : NEW_KEY TYPE OPEN_BRAC NEW_DASH
                ;

NEW_DASH        : CLOSE_BRAC 
                | NEW CLOSE_BRAC 
                | API_REF CLOSE_BRAC
                ;

MORE_VAR_DCLR   : COMMA ID VAR_INIT MORE_VAR_DCLR
                |
                ;

CALL_STMT       : METHOD_NAME OPEN_BRAC ARGS CLOSE_BRAC
                ;

METHOD_NAME     : API_REF
                ;

ARGS            : ARG MORE_ARGS
                ;

MORE_ARGS       : COMMA ARGS 
                | PLUS ARGS 
                |
                ;

ARG             : CALL_STMT 
                | STRING 
                | ID 
                |
                ;

ASSIGN_STMT     : ID ASSIGN_STMT_DASH
                ;

ASSIGN_STMT_DASH: EQUAL ASSIGN_SRC 
                | ASSIGN_OP EXPR
                ;

ASSIGN_SRC      : CALL_STMT 
                | EXPR
                ;

ASSIGN_OP       : SHORT_ADD 
                | SHORT_MINUS
                | SHORT_MUL
                | SHORT_DIV
                | SHORT_MOD
                ;

EXPR            : TERM EXPR_DASH
                ;

EXPR_DASH       : ADD_OP TERM EXPR_DASH 
                |
                ;

ADD_OP          : PLUS 
                | MINUS
                ;

TERM            : FACTOR TERM_DASH
                ;

TERM_DASH       : MUL_OP FACTOR TERM_DASH 
                |
                ;
                 
MUL_OP          : MUL 
                | DIV
                | MOD
                ;

FACTOR          : OPEN_BRAC EXPR CLOSE_BRAC 
                | ID 
                | NUMBER
                ;

CTRL_STMT       : IF_STMT 
                | WHILE_STMT 
                | FOR_STMT
                ;

IF_STMT         : IF OPEN_BRAC TEST CLOSE_BRAC STMT_SINGLE ELSE_PART
                ;

ELSE_PART       : ELSE STMT_SINGLE 
                |
                ;

STMT_SINGLE     : VAR_DCLR semi 
                | CALL_STMT semi  
                | ASSIGN_STMT semi 
                | CTRL_STMT semi 
                | OPEN_FLOW STMT CLOSE_FLOW
                ;

TEST            : EXPR TEST_OP TEST_NORM
                ;

TEST_NORM       : ID
                | NUMBER
                | OPEN_BRAC EXPR CLOSE_BRAC
                ;

TEST_OP         : LESSER_THAN 
                | GREATER_THAN
                | GREATER_THAN_EQUAL
                | LESSER_THAN_EQUAL
                | EQUALS
                | NOT_EQUALS
                ;

WHILE_STMT      :  OPEN_BRAC TEST CLOSE_BRAC STMT_SINGLE
                ;

FOR_STMT        : FOR OPEN_BRAC ASSIGN_STMT semi TEST semi U_EXPR CLOSE_BRAC STMT_SINGLE
                ;

U_EXPR          : ID INCREMENT 
                | ID DECREMENT
                | INCREMENT ID 
                | DECREMENT ID
                ;

%%
int yyerror(YYLTYPE *locp, char const *msg){
	printf("Invalid Expression: %s \nAT LINE NUMBER %d \n", msg, lineno);
	return 1;
}
int main(){
	yyin = fopen("/home/aditcam/Desktop/JavaMiniParser/first.java", "r");
	printf("\nParsing the java program\n");
	do{
		if(yyparse()){
			exit(0);
		}
	}while(!feof(yyin));
	printf("\nNo errors, Program successefully Parsed.\n");
    return 1;
}

