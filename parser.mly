 /* File parser.mly */
%token <int> INT
%token PLUS MINUS MUL DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left MUL DIV         /* medium precedence */
%start main             /* the entry point */
%type <int> main
%%
main:
    expr EOL                { $1 }
;
expr:
    INT                     { $1 }
  | LPAREN expr RPAREN      { $2 }
  | expr PLUS expr          { $1 + $3 }
  | expr MINUS expr         { $1 - $3 }
  | expr MUL expr         { $1 * $3 }
  | expr DIV expr           { $1 / $3 }
;