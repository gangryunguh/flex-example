%{
#include <stdio.h>
#include <stdbool.h>
int ncomments;
bool string_context;
bool line_context;
int lineno;
%}

%%
\/\/    {
          if (!string_context)
             line_context = true;
        }
\n      {
          if (line_context) {
             ncomments++;
             line_context = false;
          }
        }
\\\"    ;
\"      {
           if (!line_context)
              string_context = !string_context;
        }
.       ;

%%
int main(void) {

  yylex();
  printf("number of line comments = %d\n", ncomments);
  return 0;
}

int
yywrap() {
   // add code if anything needs to be done before exiting
   return 1;
}