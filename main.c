#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <pthread.h>
#include <string.h>









int bflag = 0, hflag = 0, tflag = 0;

int filecheck (_filename)
const char *_filename;
{
	int perm = 0;

	if(!access(_filename, R_OK)) perm += 4;
	if(!access(_filename, W_OK)) perm += 2;
	if(!access(_filename, X_OK)) perm += 1;

	return perm;
}


void tloop (_ofile, _ccount, _buf)
FILE *_ofile; unsigned int _ccount; char *_buf;
{
	if(_ccount > 6) _ccount = 0;
	char c;
	c = getchar();

	if (c == 'h') *(_buf + _ccount) = '0';
	if (c == 'j') *(_buf + _ccount) = '1';
	if (c == 'k') return;

	_ccount++;
	if(_ccount == 7) {
		unsigned int dec = (unsigned int) strtol(_buf, NULL, 2);
		if (!(dec > 127)) fprintf(_ofile, "%c", dec);
	}

	if (bflag) system("clear");

	tloop(_ofile, _ccount, _buf);
}


void wloop (_ofile)
FILE *_ofile;
{
	char c;
	c = getchar();

	if (c == 'h') fprintf(_ofile, "%s", "0");
	if (c == 'j') fprintf(_ofile, "%s", "1");
	if (c == 'k') return;
	
	if (bflag) system("clear");

	wloop(_ofile);

}

void help()
{

	printf("ediac stands for ed is a crutch,\n\rand looks towards the heyday of \n\rENIAC and EDSAC, when men were \n\rmen and programmers whispered \n\rsweet nothings into the \n\rproverbial ears of machines \n\rbefore screwing the living \n\rdaylights out of them on the \n\rcold floor of the \n\rair-conditioned mainframe room. \n\rediac is obviously catered \n\rtowards the most elite \n\rprogrammers who write in binary.\n\n\r");

	printf("'h' for 0, 'j' for 1, 'k' to \n\rexit. Backspaces not supported.\n\n\r");

	printf("-b:\tbloat flag\n\n\rclears the screen after every \n\rkeypress. Although, this also \n\rrequires a system call, so tell \n\rme, which is more bloat?\n\n\r");
	
	printf("-h:\thelp flag\n\n\rprints this help message and \n\rexits with contempt.\n\n\r");

	printf("-t:\ttext flag\n\n\rallows less skilled people to \n\rtype text through binary ASCII\n\rinstead.\n\n\r");

	printf("Exiting with error code 1 \n\rbecause your need for help is \n\rthe biggest error.\n\n\r");

	exit(1);
}

void usage()
{
	printf("ediac <filename> <flags>\n\n\r");

	printf("Type \'ediac dummy -h\' if you \n\rreally need help.\n\n\r");

	printf("Exiting with error code 1 \n\rbecause your lack of knowledge \n\rabout ediac is an error.\n\n\r");

	exit(1);
}

int main (argc, argv)
int argc; char **argv;
{
	unsigned int i = 2;
	for (i = 2; i < argc; i++) {
		char *curr = *(argv + i);
		if (!strcmp(curr, "-b")) bflag = 1;
		else if (!strcmp(curr, "-h")) hflag = 1;
		else if (!strcmp(curr, "-t")) tflag = 1;
		else usage();
	}

	if(hflag) help();

	char *filename = *(argv + 1);
	printf("\rfile:\t%s\n\r", filename);

	int perm = filecheck(filename);
	printf("perm:\t%d\n\r", perm);
	
	FILE *ofile = fopen(filename, "a");
	if(!ofile) {
		perror("cannot open file\n");
		exit(1);
	}

	system("/bin/stty raw");
	

	if(tflag) {
		unsigned int ccount = 0;
		char *buf = (char *)malloc(8);
		tloop(ofile, ccount, buf);
	}
	else
		wloop(ofile);

	system("/bin/stty cooked");

	printf("\n\r");

	return 0;
}
