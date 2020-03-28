BASEDIR=$(pwd)
CLASSPATH=".:$BASEDIR/bin:$BASEDIR/lib/ast.jar:$BASEDIR/lib/beaver-rt.jar:$BASEDIR/lib/lexer.jar:$BASEDIR/lib/parser.jar:$BASEDIR/lib/soot-2.5.0.jar:$BASEDIR/../junit/junit-4.13.jar:$BASEDIR/../junit/hamcrest-core-1.3.jar"
(cd src && javac -cp $CLASSPATH test/CompilerTests.java && java -cp $CLASSPATH org.junit.runner.JUnitCore test.CompilerTests)
