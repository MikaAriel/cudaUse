// CUDA runtime
#include <cuda_runtime.h>

// helper functions and utilities to work with CUDA
#include <helper_cuda.h>
#include <helper_functions.h>

__global__ void kernel(int* data, int size)
{
	int id = blockDim.x * blockIdx.x + threadIdx.x;
	data[id] = id;
}

extern "C"
bool runKernel(int* data, int size)
{
	int* d_data;
	cudaMalloc((void**)&d_data, size * sizeof(int));

	cudaMemcpy(d_data, data, size * sizeof(int), cudaMemcpyHostToDevice);
	kernel << < 1, size >> >(d_data, size);

	cudaMemcpy(data, d_data, size * sizeof(int), cudaMemcpyDeviceToHost);

	cudaFree(d_data);
	return true;
}