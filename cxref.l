/* Scale down version of Simple cxref */
%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int lineno;
bool linecomment;
bool blockcomment;
bool stringcontext;
%}

%%
\\\n                        { /* escaped newline */ ; }
\n                          { lineno++; linecomment = false;}
\/\/                        {
                              if (!blockcomment && !stringcontext)
                                 linecomment = true; }
\"                          {
                              if (!linecomment && !blockcomment)
                               stringcontext = !stringcontext; }

\/\*                        { if (!linecomment && !stringcontext )
                                 blockcomment = true;
                            }
\*\/                        { if (!linecomment && !stringcontext)
                                 blockcomment = false;
                            }

[a-zA-Z_][a-zA-Z_0-9]*      {
                              if (!linecomment && !blockcomment &&
                                  !stringcontext) {
                                   return -256;
                              }
                            }
<<EOF>>  { return EOF; }
.
%%
int main(void) {
   lineno = 1;
   linecomment = blockcomment = stringcontext = false;
   int returnval;
   while ((returnval = yylex()) != EOF) {
      if (returnval == -256)
         printf("Identifier : %s %d\n",  yytext, lineno);
   }
   return 0;
}

int
yywrap() {
   // add code if anything needs to be done before exiting
   return 1;
}