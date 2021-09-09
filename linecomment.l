%{
#include <stdio.h>
int ncomments = 0;
int string_context = 0;
int line_context = 0;
%}

%%

\/\/ { if (!string_context)
         line_context = 1; }

\n   { if (line_context) {
         ncomments++;
         line_context = 0;
       }
     }

\\\" {;}
\"   { if (!line_context)
         string_context = ~string_context; }
.    {;}
%%

int main() {
  yylex();
  printf("number of line comments = %d\n", ncomments);
  return 0;
}

int
yywrap() {
   // add code if anything needs to be done before exiting
   return 1;
}