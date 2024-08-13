import java .util.*;




public class Main {

    private static Scanner sc = new Scanner(System.in);

//    private static void calcStartTimeAndWaitingTime(int[] arriveTime, int[] burstTime, int[] ){
//        for(int x=0; x<)
//    }

    private void sortProcesses(int[] arriveTime, int[] burstTime, int[] processId){

    }

    public static void main(String[] args) {
        int[] arriveTime = new int[0];
        int[] burstTime = new int[0];
        int[] processId = new int[0];
        int[] startTime = new int[0];
        int[] waitingTime = new int[0];
        int n = 0;
        System.out.print("Enter the input size of arrays: ");
        n = sc.nextInt();
        for(int x=0; x < n; x++){
            arriveTime = new int[n];
            burstTime = new int[n];
            processId = new int[n];
            startTime = new int[n];
            waitingTime = new int[n];
        }
        System.out.println("Now starting taking the inputs for the arrays.");
        for(int x=0; x<n; x++){
            processId[x] = x;
            System.out.println("For process " + x);
            System.out.print("Enter the arrive time: ");
            arriveTime[x] = sc.nextInt();
            System.out.print("Enter the burst time: ");
            burstTime[x] = sc.nextInt();
        }


//        calcStartTimeAndWaitingTime(arriveTime);
//
        System.out.println("Now printing the details.");
        System.out.println("Process Id | Arrival Time | Burst Time");
        for(int x=0; x<n; x++){
            System.out.println("\t" +processId[x] + "\t\t\t\t" + arriveTime[x] + "\t\t\t" + burstTime[x]);
        }

    }
}