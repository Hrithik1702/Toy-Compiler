#include<stdlib.h>
#include<stdio.h>
#include<string.h>
int main(){
int l = 0;
int n ;
int j=;
scanf("%d",&n);
char str[n] ;
scanf("%s",str);
char temp[n] ;
int k ;
for(int i = 0 ; i < n ; i++){
k = n-i-1 ;
temp[i] = str[k];
}
int result = strcmp(str,temp); 
if(result == 0){
printf("Yes it is a palindrome");
}
else{
printf("No it is not a palindrome");
}
}


