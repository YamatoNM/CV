#include <iostream>
using namespace std;
int a,b,i;
void pa(){
	cout<<"a) suma numerelor:"<<a+b<<endl;}
	void pb(){
	cout<<"b) produsul numerelor:"<<a*b<<endl;}
	void pc(){
		float med;
		med=(a+b)/2;
	cout<<"c) media aritmetică:"<<med<<endl;}
	void pd(){
 	for( i=a; i>0; i--){
 	if(a%i==0 and b%i==0){
 	cout<<"d) cel mai mare divizor comun:"<<i<<endl; break;}}}
 	void pe(){
cout<<"e) cel mai mic multiplu comun:"<<(a*b)/i<<endl;}
 	void pf(){
 		if(a>b){
cout<<"f) numarul maxim:"<<a<<endl;}
if(b>a){
cout<<"f) numarul maxim:"<<b<<endl;}
if(a==b){
cout<<"f) numerele sunt egale"<<endl;}}
	void pg(){
 		if(a>b){
cout<<"g) numarul maxim:"<<b<<endl;}
if(b>a){
cout<<"g) numarul maxim:"<<a<<endl;}
if(a==b){
cout<<"g) numerele sunt egale"<<endl;}}
void ph(){ i=0;
cout<<"h) divizorii comuni:";
	for( i=a; i>0; i--){
 	if(a%i==0 and b%i==0){
 	cout<<i<<"  "; }}}
void pi(){
	int s;
	s=a*b;
cout<<endl<<"i)1-multiplu:"<<s<<"  2-multipu:"<<s*2<<"  3-multiplu:"<<s*3<<"  4-multiplu:"<<s*4<<"     5-multiplu:"<<s*5<<endl;}
int main(){
cout<<"Introduceti numerele a și b:";
cin>>a>>b;
pa(); pb(); pc(); pd(); pe(); pf(); pg();  ph(); pi(); 
}
