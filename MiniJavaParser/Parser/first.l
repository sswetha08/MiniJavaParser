%{
#include <stdio.h>
#include <stdlib.h>
#include "a.tab.h"
#include "variable.h"
lineno = 0;
%}
%%
\n {lineno++;}
"--"(.)*\n {printf("This is a single line comment and will be ignored: %s\n", yytext); } 
"--[["(.|[\n])*"]]" {printf("This is a multi line comment and will be ignored: %s\n", yytext); }
\"(.)*\" {printf("%s\n", yytext);return STRING;}
[0-9]+ {printf("%s\n", yytext); return NUMBER;}
";" {printf("%s\n", yytext); return semi;}
"import" {printf("%s\n", yytext); return IMPORT;}
"main" {printf("%s\n", yytext); return MAIN;}
"public" {printf("%s\n", yytext); return PUBLIC;}
"private" {printf("%s\n", yytext); return PRIVATE;}
"protected" {printf("%s\n", yytext); return PROTECTED;}
"static" {printf("%s\n", yytext); return STATIC_KEY;}
"int" {printf("%s\n", yytext); return INT;}
"void" {printf("%s\n", yytext); return VOID;}
"String" {printf("%s\n", yytext); return STRING_KEY;}
"Scanner" {printf("%s\n", yytext); return SCANNER;}
"new" {printf("%s\n", yytext); return NEW_KEY;}
"throws" {printf("%s\n", yytext); return THROWS;}
"System.out.print" {printf("%s\n", yytext); return SYSTEMPRINT;}
"," {printf("%s\n", yytext); return COMMA;}
"=" {printf("=\n"); return EQUAL;}
"+=" {printf("%s\n", yytext); return SHORT_ADD;}
"-=" {printf("%s\n", yytext); return SHORT_MINUS;}
"*=" {printf("%s\n", yytext); return SHORT_MUL;}
"/=" {printf("%s\n", yytext); return SHORT_DIV;}
"%=" {printf("%s\n", yytext); return SHORT_MOD;}
"++" {printf("%s\n", yytext); return INCREMENT;}
"--" {printf("%s\n", yytext); return DECREMENT;}
"while" {printf("%s\n", yytext); return WHILE;};
"if" {printf("%s\n", yytext); return IF;};
"for" {printf("%s\n", yytext); return FOR;};
"else" {printf("%s\n", yytext); return ELSE;}
\[ {printf("[\n"); return SQUA_OPEN;}
\] {printf("]\n"); return SQUA_CLOSE;}
"-" {printf("-\n"); return MINUS;}
"+" {printf("+\n"); return PLUS;}
"*" {printf("*\n"); return MUL;}
"/" {printf("/\n"); return DIV;}
"%" {printf("%\n"); return MOD;}
">" {printf(">\n"); return GREATER_THAN;}
">=" {printf(">=\n"); return GREATER_THAN_EQUAL;}
"<" {printf("<\n"); return LESSER_THAN;}	
"<=" {printf("<=\n"); return LESSER_THAN_EQUAL;}
"==" {printf("==\n"); return EQUALS;}
"!=" {printf("!=\n"); return NOT_EQUALS;}
"(" {printf("(\n"); return OPEN_BRAC;}
")" {printf(")\n"); return CLOSE_BRAC;}
"{" {printf("{\n"); return OPEN_FLOW;}
"}" {printf("}\n"); return CLOSE_FLOW;}
"class" {printf("%s\n", yytext); return CLASS;}
([a-zA-Z]*\.)+([a-zA-Z]*) {printf("%s\n", yytext); return API_REF;}
([a-zA-Z]*\.)+(\*) {printf("%s\n", yytext); return API_REF;}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s\n", yytext); return ID;}
%%
int yywrap(){
	return 1;
}