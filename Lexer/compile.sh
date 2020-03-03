mkdir -p gen
mkdir -p bin
mkdir -p bin/frontend
ant
BASEDIR=$(pwd)
CLASSPATH=".:$BASEDIR/lib/junit-4.13.jar:$BASEDIR/lib/hamcrest-core-1.3.jar"
(cd src && javac -cp $CLASSPATH test/LexerTests.java && java -cp $CLASSPATH org.junit.runner.JUnitCore test.LexerTests)
