#include <iostream>

#include <stdio.h>

#include <cstdlib>

using namespace std;

int main()

{
	
setvbuf(stdout, NULL,_IONBF, 0);
	for (int i = 0; i < 5; i++)

	{

	    printf("%d\n",i);

	    for(int i=0;i<200000000;i++)

		;

	}

	
	for(int i=0;i<2000000000;i++)

		;

	cout<<"Bitir: "<<endl;
	int zz;cin>>zz;
	
	for(int i=0;i<5;i++)

		cout<<i+10<<endl;

return 0;

}
