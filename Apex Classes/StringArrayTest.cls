/*
Create an Apex class with a method that returns an array (or list) of formatted strings ('Test 0', 'Test 1', ...). 
The length of the array is determined by an integer parameter.
    •	The Apex class must be called StringArrayTest and be in the public scope
    •	The Apex class must have a public static method called generateStringArray
    •	The generateStringArray method must return an array (or list) of strings
    •	The method must accept an incoming Integer as a parameter, which will be 
        used to determine the number of returned strings
    •	The method must return a string value in the format Test n where n is the 
        index of the current string in the array
*/
public class StringArrayTest {
    public static List<String>generateStringArray(Integer n){
      List<String>formattedArray = new List<String>();
        for(integer i = 0; i < n; i++){
           formattedArray.add('Test '+i); 
        }
        return formattedArray;
    }
}