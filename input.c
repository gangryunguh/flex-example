// Created by Gang-Ryung Uh on 9/8/21.

int main() {
   yylex();
   printf("// this shouldn't be \" // is it a line comment \" counted as line comment");
   // don't double count // this as another line comment
   return 0;
}
