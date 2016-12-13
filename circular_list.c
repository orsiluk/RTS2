#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define TABLESIZE 10	//Size of circular list

// Instruction datatype
typedef struct Instructions
{
	unsigned char type;	//0 = free, 1 = init, 2 = erase, 3 = update
	char string[35];	//String to be written
} Instruction;

Instruction* table[TABLESIZE];	//Circular list
static signed char numOfInstr = 0;	// #instructions in circular list
 
// Function to allocate memory for circular list
void InitTable(void)
{
	unsigned char i;
	for(i = 0; i < TABLESIZE; i++)
		table[i] = (Instruction*) malloc(sizeof(Instruction));
}

// Enqueue instruction in circular list
void enqueue(Instruction instr)
{
	//Make a copy of the instruction and add it to the end of the queue
	table[numOfInstr % TABLESIZE]->type = instr.type;
	strcpy(table[numOfInstr++ % TABLESIZE]->string,instr.string);
}

// Dequeues last instruction added to circular list
Instruction dequeue(void)
{
	unsigned char i;
	Instruction instr;

	for(i = 10; i > 0; i--)
	{
		if(--numOfInstr < 0)	//Ring
			numOfInstr += TABLESIZE;
		if(table[numOfInstr % TABLESIZE] != NULL)	//If there's an instruction here
			instr = *table[numOfInstr % TABLESIZE];
		if(instr.type > 0 && instr.type < 4)		//If the instruction is valid
		{
			table[numOfInstr % TABLESIZE]->type = 0; //Remove it from the list and return it
			break;
		}
	}
	return instr;	
}

void TableTest(void)
{
	//Create two instructions and add them to the circular list
	Instruction a,b;
	a.type = 1;
	b.type = 2;
	strcpy(a.string,"a");
	strcpy(b.string,"b");
	enqueue(a);
	enqueue(b);

	//Dequeue 1 instruction
	Instruction c = dequeue();
	printf("c->type = %x\n",c.type);
	printf("c->string = %s\n",c.string);

	//Enqueue the instruction that was just dequeued
	enqueue(c);

	//Dequeue it again
	Instruction d = dequeue();
	printf("d->type = %x\n",d.type);
	printf("d->string = %s\n",d.string);

	//Dequeue once more (should return instruction a)
	d = dequeue();
	printf("d->type = %x\n",d.type);
	printf("d->string = %s\n",d.string);

	//Dequeue (should return an instruction of type 0, a.k.a no action)
	d = dequeue();
	printf("d->type = %x\n",d.type);
	printf("d->string = %s\n",d.string);
}

int main(void)
{	
	InitTable();
	TableTest();
}
