In order for this lab to works, it needs to use java 1.7, here's the set up needed to get java and javac 1.7 working on fedora (I swear these labs are the worst I've had so far)
1. Download packages `java-1.7.0-*` from https://mirror.yandex.ru/fedora/russianfedora/russianfedora/nonfree/fedora/releases/29/Everything/x86_64/os/
2. Install them with `sudo dnf install java-*`
3. Switch java versions with `sudo alternatives --config java` and `sudo alternatives --config javac`
