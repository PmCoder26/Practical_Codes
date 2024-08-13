import java.io.*;
import java.util.*;


public class FileHandling {
    public static void main(String[] args){

        try {
            BufferedReader br = new BufferedReader(new FileReader(new File("/home/comp-ol-48/Desktop/sample.txt")));
            String line = "";
            while((line=br.readLine()) != null){
                System.out.println(line);
            }
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
