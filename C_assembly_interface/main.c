#include "assemblyMethods.h"

int main()
{

	//char str[] = "Hello world \n";	
	//printS(str);
	
	//char * x = inputS();	
	//printS("Hello ");
	//printS(x);
	
	
	char FileName[] = "testFile.txt";
	//char text[] = "Randy";	
	//writeS(FileName,text,5);
	
	char * text = readS(FileName, 5);
	printS(text);
	
	;char EOF[] = "\n";
	;printS(EOF);

 	return 0;
}
