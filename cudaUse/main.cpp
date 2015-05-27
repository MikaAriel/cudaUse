#include <stdio.h>
#include <memory>

extern "C" bool runKernel(int* data, int size);

int main()
{
	int* data = new int[10];

	memset(data, 0, sizeof(data));

	runKernel(data, 10);
	
	for (int i = 0; i < 10; i++)
	{
		printf("%d ", data[i]);
	}
	return 0;
}