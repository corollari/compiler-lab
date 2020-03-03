mkdir -p gen
mkdir -p bin
mkdir -p bin/frontend
ant
BASEDIR=$(pwd)
CLASSPATH=".:$BASEDIR/lib/beaver-ant.jar:$BASEDIR/lib/beaver-rt.jar:$BASEDIR/../junit/junit-4.13.jar:$BASEDIR/../junit/hamcrest-core-1.3.jar"
(cd src && javac -cp $CLASSPATH test/ParserTests.java && java -cp $CLASSPATH org.junit.runner.JUnitCore test.ParserTests)
