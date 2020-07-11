/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_A_TAB_H_INCLUDED
# define YY_YY_A_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    semi = 258,
    PUBLIC = 259,
    PRIVATE = 260,
    PROTECTED = 261,
    STATIC_KEY = 262,
    MAIN = 263,
    API_REF = 264,
    IMPORT = 265,
    UNTIL = 266,
    ID = 267,
    INT = 268,
    VOID = 269,
    STRING_KEY = 270,
    NUMBER = 271,
    STRING = 272,
    DO = 273,
    END = 274,
    WHILE = 275,
    REPEAT = 276,
    IF = 277,
    EQUAL = 278,
    FOR = 279,
    IN = 280,
    ELSE = 281,
    ELSEIF = 282,
    THEN = 283,
    BREAK = 284,
    RETURN = 285,
    THROWS = 286,
    NEW_KEY = 287,
    LOCAL = 288,
    COLON = 289,
    DOT = 290,
    COMMA = 291,
    MINUS = 292,
    PLUS = 293,
    GREATER_THAN = 294,
    GREATER_THAN_EQUAL = 295,
    LESSER_THAN = 296,
    LESSER_THAN_EQUAL = 297,
    EQUALS = 298,
    NOT_EQUALS = 299,
    MOD = 300,
    POWER = 301,
    AND = 302,
    OR = 303,
    OPEN_FLOW = 304,
    CLOSE_FLOW = 305,
    OPEN_BRAC = 306,
    CLOSE_BRAC = 307,
    SQUA_OPEN = 308,
    CLASS = 309,
    SYSTEMPRINT = 310,
    SQUA_CLOSE = 311,
    TRUE = 312,
    FALSE = 313,
    SHORT_ADD = 314,
    SHORT_MINUS = 315,
    SHORT_MUL = 316,
    SHORT_DIV = 317,
    SHORT_MOD = 318,
    INCREMENT = 319,
    DECREMENT = 320,
    SCANNER = 321,
    NOT_EQUAL = 322,
    MUL = 323,
    DIV = 324,
    NOT = 325,
    HASH = 326
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif



int yyparse (void);

#endif /* !YY_YY_A_TAB_H_INCLUDED  */
