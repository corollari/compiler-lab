/* You do not need to change anything up here. */
package lexer;

import frontend.Token;
import static frontend.Token.Type.*;
import java.util.HashMap;
import java.util.Map;

%%

%public
%final
%class Lexer
%function nextToken
%type Token
%unicode
%line
%column

%{
	/* These two methods are for the convenience of rules to create toke objects.
	* If you do not want to use them, delete them
	* otherwise add the code in 
	*/


	private Token.Type getIdentifier(String text){
	Map<String, Token.Type> map = new HashMap<String, Token.Type>();
	map.put("boolean", BOOLEAN);
	map.put("break", BREAK);
	map.put("else", ELSE);
	map.put("false", FALSE);
	map.put("if", IF);
	map.put("import", IMPORT);
	map.put("int", INT);
	map.put("module", MODULE);
	map.put("public", PUBLIC);
	map.put("return", RETURN);
	map.put("true", TRUE);
	map.put("type", TYPE);
	map.put("void", VOID);
	map.put("while", WHILE);
		Token.Type type = map.get(text);
		if(type == null){
			type = ID;
		}
		return type;
	}
	
	private Token token(Token.Type type) {
		return new Token(type, yyline, yycolumn, yytext()); 	
	}
	
	/* Use this method for rules where you need to process yytext() to get the lexeme of the token.
	 *
	 * Useful for string literals; e.g., the quotes around the literal are part of yytext(),
	 *       but they should not be part of the lexeme. 
	*/
	private Token token(Token.Type type, String text) {
		return new Token(type, yyline, yycolumn, text.substring(1, text.length()-1));	
	}
%}

/* This definition may come in handy. If you wish, you can add more definitions here. */
WhiteSpace = [ ] | \t | \f | \n | \r
Digit = [0-9]
Alpha = [a-zA-Z_]

%%
/* put in your rules here.    */
"/"								{return token(DIV);}
"=="							{return token(EQEQ);}
"="								{return token(EQL);}
">="							{return token(GEQ);}
">"								{return token(GT);}
"<="							{return token(LEQ);}
"<"								{return token(LT);}
"-"								{return token(MINUS);}
"!="							{return token(NEQ);}
"+"								{return token(PLUS);}
"*"								{return token(TIMES);}
","								{return token(COMMA);}
"["								{return token(LBRACKET);}
"{"								{return token(LCURLY);}
"("								{return token(LPAREN);}
"]"								{return token(RBRACKET);}
"}"								{return token(RCURLY);}
")"								{return token(RPAREN);}
";"								{return token(SEMICOLON);}
{Alpha}({Alpha}|{Digit}|"_")*		{return token(getIdentifier(yytext()));}
"\""[^\n\"]*"\""		{return token(STRING_LITERAL, yytext());}
{Digit}+						{return token(INT_LITERAL);}
{WhiteSpace}					{}

/* You don't need to change anything below this line. */
.							{ throw new Error("unexpected character '" + yytext() + "'"); }
<<EOF>>						{ return token(EOF); }
