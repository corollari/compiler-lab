BASEDIR=$(pwd)
mkdir -p gen
mkdir -p bin
mkdir -p bin/frontend
ant
(cd src && javac test/LexerTests.java && java -cp .:$BASEDIR/lib/junit-4.13.jar:$BASEDIR/lib/hamcrest-core-1.3.jar org.junit.runner.JUnitCore test.LexerTests)
