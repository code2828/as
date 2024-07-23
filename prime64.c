#include <stdio.h>

int primes[1010]={0};
const int maxx=1827;
int number_of_primes=0;
int i=2,j=0;

int main()
{
	while(i<=1827)
	{
		j=0;
		while(j<number_of_primes && primes[j]*primes[j]<=i)
		{
			if(i%primes[j]==0)goto notaprime;
			j++;
		}
		// i is a prime!
		primes[j++]=i;
notaprime:i++;
	}
	i=0;
	while(i<j)
	{
		printf("%d, ",primes[j]);
	}

	return 0;
}
