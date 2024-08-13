#include<iostream>
#include<bits/stdc++.h>
#include<ctime>
using namespace std;
#define ll long long int


void transmissionMeth(ll &i, ll &N, ll &tf, ll &tt){
  while(i <= tf){
    int z = 0;
    for(int k = i; k < i+N && k<= tf; k++){
      cout<<"Sending Frame "<<k<<"..."<<endl;
      tt++;
    }
    for(int k = i; k < i+N && k <= tf; k++){
      int f = rand() % 2;
      if(!f){
        cout<<"Acknowledgment for Frame "<<k<<"Not Received"<<endl;
        cout<<"Retransmitting Window..."<<endl;
        z++;
      }
      else{
         cout<<"Timeout!! Frame number: "<<k<<"Not received"<<endl;
      	 cout<<"Retransmitting Window..."<<endl;
      	 break;
      }
    }
    cout<<endl;
    i += z;
  }
}

int main() 
{
  ll tf, N, tt = 0;
  srand(time(NULL));
  cout<<"Enter the total number of frames: ";
  cin>>tf;
  cout<<"Enter the window size: ";
  cin>>N;
  ll i = 1;
  transmissionMeth(i, N, tf, tt);
  cout<<"Total no.of frames which were sent and resent are: "<<tt<<endl;
    
    return 0;
}
