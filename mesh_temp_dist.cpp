#include "stdafx.h"
#include "iostream"
using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	double h,k,dx,dy,Ta,Tb,T[19]={0};
	cout <<"h = ";
	cin >>h;
	cout <<"k = ";
	cin >>k;
	cout <<"dx = ";
	cin >>dx;
	cout <<"dy = ";
	cin >>dy;
	cout <<"Ta = ";
	cin >>Ta;
	cout <<"Tb = ";
	cin >>Tb;
	cout <<endl;
	T[0]=Tb,T[3]=Tb,T[11]=Tb;
	for(;;)
	{
		if(abs(T[1]-(T[0]+T[2]+2*T[4])/4)<1.0e-5)
			break;
		T[1] = (T[0]+T[2]+2*T[4])/4;
		T[2] = (T[1]+T[5]+h*dx/k*Ta)/(2+h*dy/k);
		T[4] = (T[3]+T[5]+T[1]+T[12])/4;
		T[5] = (2*T[4]+T[6]+2*T[13]+T[2]+2*h*dx/k*Ta)/(6+2*h*dx/k);
		T[6] = (T[5]+T[7]+2*T[14]+2*h*dx/k*Ta)/(4+2*h*dx/k);
		T[7] = (T[6]+T[8]+2*T[15]+2*h*dx/k*Ta)/(4+2*h*dx/k);
		T[8] = (T[7]+T[9]+2*T[16]+2*h*dx/k*Ta)/(4+2*h*dx/k);
		T[9] = (T[8]+T[10]+2*T[17]+2*h*dx/k*Ta)/(4+2*h*dx/k);
		T[10] = (T[9]+T[18]+2*h*dx/k*Ta)/(2+2*h*dx/k);
		T[12] = (T[11]+T[13]+2*T[4])/4;
		T[13] = (T[12]+T[14]+2*T[5])/4;
		T[14] = (T[13]+T[15]+2*T[6])/4;
		T[15] = (T[14]+T[16]+2*T[7])/4;
		T[16] = (T[15]+T[17]+2*T[8])/4;
		T[17] = (T[16]+T[18]+2*T[9])/4;
		T[18] = (T[17]+T[10]+h*dy/k*Ta)/(2+h*dy/k);
	}
	for(int i = 0;i <19;i++)
	{
		cout <<"T"<<i+1<<" = "<<T[i]<<endl;
	}
	system("pause");
	return 0;
}
