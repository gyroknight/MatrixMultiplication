Dependencies:

NumPy and Pandas python modules
nvidia-opencl-dev (if using NVIDIA GPU)

Use this command to compile the source:

g++ -Wall -o MM MM.cpp eventlist.cpp -lOpenCL -L$AMDAPPSDKROOT/lib/x86_64 -I$AMDAPPSDKROOT/include -I.

Run the program using auto_exec.sh

Things you might run into:

*If you have Bumblebee installed for NVIDIA Optimus, edit /etc/bumblebee/bumblebee.conf and set the driver to "nvidia". It will default to Nouveau if not set.
	*Also, remember to run the program using optirun <executable>.
*If you're getting an OpenCL problem when compiling, repair the link in $AMDAPPROOTSDK/lib/x86_64/libOpenCL.so. If you're using NVIDIA drivers, these are located at /usr/lib/x86_64-linux-gnu/libOpenCL.so
