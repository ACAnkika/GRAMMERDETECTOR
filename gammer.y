%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void yyerror(const char *s);
int yylex(void);

// Grammar Type Flags
int is_regular = 1;
int is_cfg = 1;
int is_csg = 1;

%}

%union {
    char* str;
}

%token <str> LHS RHS
%token ARROW NEWLINE

%%
grammar:
    grammar rule NEWLINE
    | rule NEWLINE
    ;

rule:
    LHS ARROW RHS {
        int lhs_len = strlen($1);
        int rhs_len = strlen($3);

        // Check for Regular Grammar
        if (lhs_len == 1 && isupper($1[0])) {
            if (!(rhs_len == 1 && islower($3[0])) &&
                !(rhs_len == 2 && islower($3[0]) && isupper($3[1]))) {
                is_regular = 0;
            }
        } else {
            is_regular = 0;
            is_cfg = 0;
        }

        // Check for Context-Free
        if (!(lhs_len == 1 && isupper($1[0]))) {
            is_cfg = 0;
        }

        // Check for Context-Sensitive
        if (lhs_len > rhs_len) {
            is_csg = 0;
        }

        free($1);
        free($3);
    }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf(" Enter grammar rules (e.g., S -> aA), one per line.\n");
    printf(" Press Ctrl+D when done.\n\n");
    yyparse();

    printf("\n📊 Grammar Type Detection Result:\n");

    if (is_regular)
        printf(" Regular Grammar (Type 3)\n");
    else if (is_cfg)
        printf(" Context-Free Grammar (Type 2)\n");
    else if (is_csg)
        printf("Context-Sensitive Grammar (Type 1)\n");
    else
        printf(" Unrestricted Grammar (Type 0)\n");

    return 0;
}
