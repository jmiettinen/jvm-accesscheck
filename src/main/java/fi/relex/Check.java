package fi.relex;

import java.lang.reflect.Constructor;

/**
 * Hello world!
 */
public final class Check {
    private Check() {
    }

    /**
     * Says hello to the world.
     * @param args The arguments of the program.
     */
    public static void main(String[] args) throws ClassNotFoundException {
        final String className = "com.sun.management.internal.HotSpotThreadImpl";
        Class<?> klass = Class.forName(className);
        for (Constructor<?> constructor : klass.getDeclaredConstructors()) {
            constructor.setAccessible(true);
        }
        System.out.println("All want better than expected.");
    }
}
