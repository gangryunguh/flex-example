/* for each occurrence of string "hell" print "hello cop4620" */
%{
 #include <stdio.h>
 #define id 256
 int lineno;
%}
%%
[ \t]+ {;}
\n       { lineno++; }
hell     { fprintf(yyout, "hello cop4620 : lineno %d \n", lineno);
           return id;
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
       case id:
           // do something
           printf("i found the pattern\n");
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