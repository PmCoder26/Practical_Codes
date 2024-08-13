#include <iostream>
using namespace std;

int main()
{
    
    int i, j, k, l;
    
    // getting the frame.
    int frameSize;
    cout<<"Enter the frame size: ";
    cin>>frameSize;
    cout<<endl;
    
    int frames[20];
    
    cout<<"Enter frame: ";
    for(i = 0; i < frameSize; i++){
        cin>>frames[i];
    }
    
    // get the generator.
    int genSize;
    cout<<"Enter the generator size: ";
    cin>>genSize;
    
    int gen[20];
    
    cout<<"Enter the generator: ";
    for(i = 0; i < genSize; i++){
        cin>>gen[i];
    }
    
    cout<<"Sender Side!"<<endl;
    cout<<"Frame: ";
    for(i = 0; i < frameSize; i++){
        cout<<frames[i];
    }
    cout<<endl;
    cout<<"Generator: ";
    
    for(i = 0; i < genSize; i++){
        cout<<gen[i];
    }
    cout<<endl;
    // Apending the 0's.
    int remSize = genSize - 1;
    cout<<"Number of 0's to be appended: "<<remSize;
    for(i = frameSize; i < frameSize + remSize; i++){
        frames[i] = 0;
    }
    cout<<endl;
    int temp[20];
    
    for(i = 0; i < 20; i++){
        temp[i] = frames[i];
    }
    
    cout<<"Message after appending 0's: ";
    for(i = 0; i < frameSize + remSize; i++){
        cout<< temp[i];
    }
    
    // Division.
    for(i=0; i<frameSize; i++){
        j = 0;
        k = i;
        if(temp[k] >= gen[i]){
            for(j = 0, k = i; j < genSize; j++, k++){
                if((temp[k] == 1 && gen[j] == 1) || (temp[k] == 0 && gen[j] == 0)){
                    temp[k] = 0;
                }
                else{
                    temp[k] = 1;
                }
            }
        }
    }
    
    // CRC.
    int crc[15];
    for(i = 0, j = frameSize; i < remSize; i++, j++){
        crc[i] = temp[j];
    }
    
    cout<<"\n CRC bits: ";
    for(i = 0; i < remSize; i++){
        cout<<crc[i];
    }
    cout<<endl;
    
    cout<<"Transmitted Frame: ";
    int transFrame[15];
    for(i = 0; i < frameSize; i++){
        transFrame[i]=frames[i];
    }
    for(i = frameSize ,j = 0; i < frameSize+remSize; i++ ,j++) {
        transFrame[i] = crc[j];
    }
    for(i = 0; i < frameSize + remSize; i++){
        cout<<transFrame[i]<<endl;
    }
    
    cout<<"Receiver side : "<<endl;
    cout<<"Received Frame: "; 
    for(i = 0; i < frameSize + remSize; i++){
        cout<<transFrame[i];
    }
    for(i = 0; i < frameSize + remSize; i++){
        temp[i] = transFrame[i];
    }
    
    //Division
    for(i = 0;i < frameSize + remSize; i++){
        j=0;
        k=i;
        if (temp[k]>=gen[j]){
            for(j = 0,k = i; j < genSize; j++, k++){
                if((temp[k] == 1 && gen[j] == 1) || (temp[k] == 0 && gen[j]==0)) {
                    temp[k]=0;
                }
                else{
                    temp[k]=1;
                }
            }
        }
    }
    cout<<endl;
    cout<<"Remainder: ";
    int recRem[15];
    
    for (i = frameSize, j = 0; i < frameSize + remSize; i++, j++) {
        recRem[j]= temp[i];
    }
    for(i=0;i<remSize;i++){
       cout<<recRem[i];
    }
    cout<<endl;
    
    int flag=0;
    for(i = 0; i < remSize; i++){
        if(recRem[i] != 0){
            flag=1;
        }
    }
    
    if(flag==0){
        cout<<"Since Remainder is 0 Hence Message Transmitted From Sender To Receriver is correct"<<endl;
    }
    else{
        cout<<"Since Remainder is Not 0 Hence Message Transmitted From Sender To Receriver contains error"<<endl;
    }
    
    return 0;
}