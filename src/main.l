%{

#include <stdio.h>
#include <string.h>

 int nbEmail = 0;
 int nbUnicampEmail = 0;
 int nbFeeEmail = 0;

%}

LETRA   [a-zA-Z]
DIGITO  [0-9]
LETRAENUMERO [a-zA-Z0-9]

PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+
PALAVRAEINTEIRO {LETRAENUMERO}+

%%

{PALAVRAEINTEIRO}[@]({PALAVRA}[.])*(fee.unicamp.br) {
  nbEmail++;
  nbUnicampEmail++;
  nbFeeEmail++;
  }

{PALAVRAEINTEIRO}[@]({PALAVRA}[.])*(unicamp.br) {
  nbEmail++;
  nbUnicampEmail++;
  }

{PALAVRAEINTEIRO}[@]{PALAVRA}([.]{PALAVRA})* {
  nbEmail++;
  }

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;


%%

int main() {
  yylex();
  printf("%d %d %d\n", nbEmail, nbUnicampEmail, nbFeeEmail);
  return 0;
}