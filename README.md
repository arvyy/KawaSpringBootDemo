# KawaSpringBootDemo
java and kawa interpo demo using maven

Download & install kawa as a maven artefact
```
wget ftp://ftp.gnu.org/pub/gnu/kawa/kawa-3.0.zip
unzip kawa-3.0.zip
rm kawa-3.0.zip
mvn install:install-file -Dfile=kawa-3.0/lib/kawa.jar -DgroupId=gnu -DartifactId=kawa -Dversion=3.0.0 -Dpackaging=jar 
rm -r kawa-3.0
```

clone this repository
```
git clone https://github.com/arvyy/KawaSpringBootDemo
cd KawaSpringBootDemo
```

launch
```
mvn spring-boot:run
```

Look at the result
http://localhost:8080/mandelbrot.svg
