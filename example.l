/* for each occurrence of string "hell" print "Hello COP4020" */
%{
 #include <stdio.h>
 #define ID 256
 int lineno;
%}
%%
[ \t]+ {;}
\n       { lineno++; }
hell     { fprintf(yyout, "Hello COP4020 : lineno %d \n", lineno);
           return ID;
         }
<<EOF>>  { return EOF; }
.        { ; }
%%
int main(void) {
  lineno = 0;
  int type;
  extern FILE *yyin, *yyout;
  yyin = fopen("mobydick.txt", "r");
  yyout = fopen("mobydick-out.txt", "w");

  while ((type = yylex()) != EOF) {
     switch (type) {
       case ID:
           // do something
           printf("I found the pattern\n");
           break;
       default:
           break;
     }
  }
  return 0;
}


