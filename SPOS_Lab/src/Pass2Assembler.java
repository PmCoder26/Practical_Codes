import java.util.*;
import java.io.*;


public class Pass2Assembler {

    public static void readAndWriter(BufferedReader reader, BufferedWriter writer) throws IOException{
        if(reader == null || writer == null){
            System.out.println("The buffered reader/writer is null!");
        }
        else{
            String line = "";
            while((line = reader.readLine()) != null){
                if(line.contains("AD")){
                    writer.write("\n");
                }
                else if(line.contains("IS")){
                    writer.write("+"+ line.substring(5, 7) + "\n");
                }
            }
            reader.close();
            writer.close();
        }
    }

    public static void readerAndWriter2(BufferedReader reader, BufferedWriter writer) throws IOException{
        if(reader == null || writer == null){
            System.out.println("The buffered reader/writer is null!");
        }
        else{
            String line = "";
            while((line = reader.readLine()) != null){
                if(line.contains("IS")){
                    String temp = "+" + line.substring(5, 7) + "\t";
                    if(line.length() > 8){
                        temp+=line.substring(9, 10);
                    }
                    writer.write(temp + "\n");
                }
                else if(line.contains("AD") || line.contains("DL")){
                    writer.write("\n");
                }
            }
            reader.close();
            writer.close();
        }
    }

    public static void main(String[] args){
        try {
            BufferedReader reader = new BufferedReader(new FileReader(new File("/home/comp-ol-48/Desktop/assemb.txt")));
            BufferedWriter writer = new BufferedWriter(new FileWriter(new File("/home/comp-ol-48/Desktop/output.txt")));
//            readAndWriter(reader, writer);
            readerAndWriter2(reader, writer);
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }


}
