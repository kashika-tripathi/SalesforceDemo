@isTest
public with sharing class TestVerifyDate {
   
    @isTest static void test1(){
      Date day1=system.today();
      Date day2=system.today()+20;
      date x=VerifyDate.CheckDates(day1,day2);
    }

    @isTest static void test2(){
        Date day1=system.today();
        Date day2=system.today()-20;
        date x=VerifyDate.CheckDates(day1,day2);
      }

      @isTest static void test3(){
        Date day1=system.today();
        Date day2=system.today()+120;
        date x=VerifyDate.CheckDates(day1,day2);
      }
}
