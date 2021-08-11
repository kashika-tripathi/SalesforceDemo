public with sharing class TemperatureConverter {
    public TemperatureConverter() {

    }
    public static Decimal FahrenheitToCelsius(Decimal val) {
        Decimal cs=(val-32) * 5/9;
        return cs.setScale(2);
        
    }
}
