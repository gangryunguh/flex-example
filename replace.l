/* for each occurrence of string "hell" print "hello cop4620" */
%{
#include <stdio.h>
int lineno;
%}

%%
shell     { fprintf(yyout, "shell"); }
hell      { fprintf(yyout, "heaven");}
[a-zA-Z0-9_]+hell[a-zA-Z0-9_]+ { fprintf(yyout, "%s", yytext); }

%%
int main(void) {
  extern FILE *yyin, *yyout;
  yyin = fopen("mobydick.txt","r");
  yyout = fopen("mobydick-out.txt", "w");

  yylex();
  return 0;
}

int
yywrap() {
   // add code if anything needs to be done before exiting
   return 1;
}
