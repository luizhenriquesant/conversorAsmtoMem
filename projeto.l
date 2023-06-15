%%
[ \t\n\r]+ {



}
LDA {
	unsigned char byte=0x20;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
} 

STA {
	unsigned char byte=0x10;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

ADD {
	unsigned char byte=0x30;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

OR {
	unsigned char byte=0x40;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

AND {
	unsigned char byte=0x50;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

NOT {
	unsigned char byte=0x60;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}


JMP {
	unsigned char byte=0x80;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

JN {
	unsigned char byte=0x90;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

JZ {
	unsigned char byte=0xA0;	
	fputc(byte,yyout);

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

HLT {

	unsigned char byte=0xF0;	
	fputc(byte,yyout);
}
[0-9A-F]{2} {
	unsigned char byte;

	byte =(unsigned char)strtol(yytext,NULL,16);

	fputc(byte,yyout);	

	unsigned char byte0=0x00;
	fputc(byte0,yyout);
}

<<EOF>> return 0;
%%

int main(int argc,char *argv[]){
	yyout = fopen("saida.mem","wb");
	if(!yyout){
		printf("Erro ao abrir o arquivo\n");
		return 1;
	}
	FILE *fin;
	char nome[100];
	printf("Digite o nome do arquivo a ser lido: ");
	scanf("%s", nome);
	fin=fopen(nome,"r");
	yyin=fin;
	
	unsigned char byte=0x03;	
	fputc(byte,yyout);

	unsigned char byte1=0x4E;	
	fputc(byte1,yyout);

	unsigned char byte2=0x44;	
	fputc(byte2,yyout);

	unsigned char byte3=0x52;	
	fputc(byte3,yyout);
	
	yylex();
	
	fclose(yyout);
	
	return 0;
}