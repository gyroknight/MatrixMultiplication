__kernel void matrix_mul(__global const int *A_device,__global const int *B_device, __global int *C_device, __local int *blk_a, __local int *blk_b)
{
	int dim = get_global_size(0);
	int row = get_global_id(0);
	int col = get_global_id(1);

	// Get the index of the current element to be processed
	int lrow = get_local_id(0);
	int lcol = get_local_id(1);
	int ldim = get_local_size(0);
 
	// Do the operation
	int i, j;
	int sum = 0;
	for (i=0; i< (dim/ldim); i++)
	{
		blk_a [lrow*ldim+lcol] = A_device[row*dim+(i*ldim+lcol)];
		blk_b [lrow*ldim+lcol] = B_device[(i*ldim+lrow)*dim + col];

		barrier(CLK_LOCAL_MEM_FENCE);

		for (j = 0; j<ldim ; j++)
		{
			sum += blk_a[lrow*ldim+j]*blk_b[j*ldim+lcol];
		}
		barrier(CLK_LOCAL_MEM_FENCE);
	}
	C_device[row*dim+col] = sum;
}
