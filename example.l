/* for each occurrence of string "hell" print "hello cop4020" */
%{
 #include <stdio.h>
 #define id 256
 int lineno;
%}
%%
[ \t]+ {;}
\n       { lineno++; }
hell     { fprintf(yyout, "hello cop4020 : lineno %d \n", lineno);
           return id;
         }
<<eof>>  { return eof; }
.        { ; }
%%
int main(void) {
  lineno = 0;
  int type;
  extern file *yyin, *yyout;
  yyin = fopen("mobydick.txt", "r");
  yyout = fopen("mobydick-out.txt", "w");

  while ((type = yylex()) != eof) {
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


