package test;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.StringReader;

import lexer.Lexer;

import org.junit.Test;

import frontend.Token;
import frontend.Token.Type;
import static frontend.Token.Type.*;

/**
 * This class contains unit tests for your lexer. Currently, there is only one test, but you
 * are strongly encouraged to write your own tests.
 */
public class LexerTests {
	// helper method to run tests; no need to change this
	private final void runtest(String input, Token... output) {
		Lexer lexer = new Lexer(new StringReader(input));
		int i=0;
		Token actual=new Token(MODULE, 0, 0, ""), expected;
		try {
			do {
				assertTrue(i < output.length);
				expected = output[i++];
				try {
					actual = lexer.nextToken();
					assertEquals(expected, actual);
				} catch(Error e) {
					if(expected != null)
						fail(e.getMessage()+"\nExpected "+expected+" but got "+actual);
					/* return; */
				}
			} while(!actual.isEOF());
		} catch (IOException e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}

	/** Example unit test. */
	@Test
	public void testKWs() {
		// first argument to runtest is the string to lex; the remaining arguments
		// are the expected tokens
		runtest("module false return while",
				new Token(MODULE, 0, 0, "module"),
				new Token(FALSE, 0, 7, "false"),
				new Token(RETURN, 0, 13, "return"),
				new Token(WHILE, 0, 20, "while"),
				new Token(EOF, 0, 25, ""));
	}

	@Test
	public void testStringLiteralWithDoubleQuote() {
		runtest("\"\"\"",
				new Token(STRING_LITERAL, 0, 0, ""),
				(Token)null,
				new Token(EOF, 0, 3, ""));
	}

	@Test
	public void testStringLiteral() {
		runtest("\"\\n\"", 
				new Token(STRING_LITERAL, 0, 0, "\\n"),
				new Token(EOF, 0, 4, ""));
	}

	@Test
	public void testInvalidString() {
		runtest("\"\n\"", 
				(Token)null,
				new Token(EOF, 0, 4, ""));
	}

	@Test
	public void testIdentifier() {
		runtest("abc_1", 
				new Token(ID, 0, 0, "abc_1"),
				new Token(EOF, 0, 5, ""));
	}

	@Test
	public void testEmptyString() {
		runtest("\"\"", 
				new Token(STRING_LITERAL, 0, 0, ""),
				new Token(EOF, 0, 2, ""));
	}

	@Test
	public void testIdentifiersAndKWs() {
		runtest("Boolean \t boolean if booleanif", 
				new Token(ID, 0, 0, "Boolean"),
				new Token(BOOLEAN, 0, 10, "boolean"),
				new Token(IF, 0, 18, "if"),
				new Token(ID, 0, 21, "booleanif"),
				new Token(EOF, 0, 30, ""));
	}

	@Test
	public void testIntLiteral() {
		runtest("0000111000",
				new Token(INT_LITERAL, 0, 0, "0000111000"),
				new Token(EOF, 0, 10, ""));
	}

	@Test
	public void testWhole() {
		runtest("while i < 10 return i",
				new Token(WHILE, 0, 0, "while"),
				new Token(ID, 0, 6, "i"),
				new Token(LT, 0, 8, "<"),
				new Token(INT_LITERAL, 0, 10, "10"),
				new Token(RETURN, 0, 13, "return"),
				new Token(ID, 0, 20, "i"),
				new Token(EOF, 0, 21, ""));
	}

}
