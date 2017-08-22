# jvm-accesscheck

Ultimately, I am trying to get JRuby working with Java 9. One problem en route there is that JRuby tries to make some very JVM internal class constructors visible.

This repository tries to reproduce and isolate the issue. When running this at least with incorrect command line parameters, you should get error stating:
```
Exception in thread "main" java.lang.reflect.InaccessibleObjectException: Unable to make public com.sun.management.internal.HotSpotThreadImpl(sun.management.VMManagement) accessible: module jdk.management does not "exports com.sun.management.internal" to unnamed module @1c53fd30
	at java.base/java.lang.reflect.AccessibleObject.checkCanSetAccessible(AccessibleObject.java:337)
	at java.base/java.lang.reflect.AccessibleObject.checkCanSetAccessible(AccessibleObject.java:281)
	at java.base/java.lang.reflect.Constructor.checkCanSetAccessible(Constructor.java:192)
	at java.base/java.lang.reflect.Constructor.setAccessible(Constructor.java:185)
	at fi.relex.Check.main(Check.java:20)
```

I am currently wondering if I've understood the Jigsaw [discussion about `--illegal-access=permit`](http://mail.openjdk.java.net/pipermail/jigsaw-dev/2017-May/012673.html) wrong together with the Oracle [migration guide](https://docs.oracle.com/javase/9/migrate/toc.htm#JSMIG-GUID-7BB28E4D-99B3-4078-BDC4-FC24180CE82B) (which does advocate a different switch which build 9+181 does not understand).


To reproduce:
```
mvn clean package
./run.sh
```
