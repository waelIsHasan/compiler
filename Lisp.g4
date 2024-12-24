grammar Lisp;

// Root rule
program: expression* EOF ;

expression
    : NUMBER                   
    | SYMBOL
    | STRING 
    | WRITE_LINE STRING 
    | FORMAT 't' STRING SYMBOL* // The `format` function with multiple variables                  
    | PLUS expression+        
    | MINUS expression+        
    | MULTIPLY expression+     
    | DIVIDE expression+       
    | AND expression+          
    | OR expression+           
    | NOT expression           
    | EQUAL expression+        
    | LESS expression+         
    | GREATER expression+      
    | IF expression expression expression 
    | COND '(' cond_branch+ ')' 
    | DEFUN SYMBOL '(' parameters? ')' expression // function definition
    | SETQ SYMBOL expression   
    | CAR expression           
    | CDR expression           
    | CONS expression expression
    | list
    ; 
    
// Define a list as a sequence of expressions in parentheses
list: '(' expression* ')' ;
parameters: SYMBOL+ ;
cond_branch: '(' expression expression ')' ;
STRING: '"' ( '\\' [nrt"'\\] | ~["\\] )* '"';
// Keywords 
IF: [iI] [fF] ;
DEFINE: [dD] [eE] [fF] [iI] [nN] [eE] ;
LAMBDA: [lL] [aA] [mM] [bB] [dD] [aA] ;
FUNCALL: [Ff] [Uu] [Nn] [Cc] [Aa] [Ll] [Ll];
WRITE: [wW] [rR] [iI] [tT] [eE] ;
WRITE_LINE: [wW] [rR] [iI] [tT] [eE] '-' [lL] [iI] [nN] [eE] ;
SETQ: [sS] [eE] [tT] [qQ] ;
DEFPARAMETER: [Dd] [eE] [fF] [pP] [aA] [rR] [aA] [mM] [eE] [tT] [eE] [rR];
DEFUN: [dD] [eE] [fF] [uU] [nN] ;
PRINT: [Pp] [Rr] [Ii] [Nn] [Tt] ;
FORMAT: [Ff] [Oo] [Rr] [Mm] [Aa] [tT];
DOTIMES: [dD] [oO] [Tt] [iI] [mM] [eE] [sS];
COND: [cC] [oO] [nN] [dD] ;
AND: [aA] [nN] [dD] ;
OR: [oO] [rR] ;
NOT: [nN] [oO] [tT] ;
CAR: [cC] [aA] [rR] ;
CDR: [cC] [dD] [rR] ;
CONS: [cC] [oO] [nN] [sS] ;
ABS: [aA] [bB] [sS] ;
LOG : [lL] [oO] [gG];
GCD: [gG] [cC] [dD];
FLOOR : [Ff] [lL] [Oo] [Oo] [Rr];
SIN : [sS] [iI] [nN];
SINH : [sS] [iI] [nN] [hH];
ROUND: [rR] [oO] [uU] [nN] [dD];
ICM: [iI] [cC] [mM];
T : [Tt];
NIL: [Nn] [Ii] [Ll];



// Define a conditional branch for `COND`
LPAREN: '('; 
RPAREN: ')';
COMMENT: ';' ~[\r\n]* -> skip ;
MULTILINE_COMMENT: '#|' .*? '|#' -> skip ;


// Operator tokens
PLUS: '+' ;
MINUS: '-' ;
MULTIPLY: '*' ;
DIVIDE: '/' ;
EQUAL: '=' ;
LESS: '<' ;
GREATER: '>' ;

// Symbol 
SYMBOL: ('*'  |  '?' | '\\' | [a-zA-Z!<>_-]) ([a-zA-Z0-9_-] | '*' | '?') * ;


NUMBER: '-'? [0-9]+ ('.' [0-9]+)?;

WS: [ \t\r\n]+ -> skip ; 
