/* for each occurrence of string "hell" print "hello cop4620" */
%{
 #include <stdio.h>
 #define id 256
 int lineno;
%}
%%
\n       { putc('\n', yyout);
           lineno++; }
hell     {
           fprintf(yyout, "hello cop4620 : lineno %d \n", lineno);
           return id;
         }
<<EOF>>  { return EOF; }
.        { putc(*yytext,yyout); }
%%
int main(void) {
  lineno = 0;
  int type;
  extern FILE *yyin, *yyout;
  yyin = fopen("mobydick.txt", "r");
  yyout = fopen("mobydick-out.txt", "w");

  while ((type = yylex()) != EOF) {
     switch (type) {
       case id:
           // do something
           printf("\033[0;33m");
           printf("i found the pattern in %d\n", lineno);
           printf("\033[0m");
           break;
       default:
           break;
     }
  }
  return 0;
}

int
yywrap() {
   // add code if anything needs to be done before exiting
   return 1;
}