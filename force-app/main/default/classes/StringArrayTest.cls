public class StringArrayTest {
    public static String[] generateStringArray(Integer length) {
        String[] results = new String[length];
        for(Integer i = 0; i < length; i++) {
            results[i] = 'Test '+i;
        }
        return results;
    }
}