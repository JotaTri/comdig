close all
clear
clc
Nb=120;

%%%%%%%%%%Quest�o 1
array_Nb=rand(1,Nb);
array_Nb=array_Nb>0.5;

%%%%%%%%%%Quest�o 2

%Para a linha n�o ficar grande
a='ModulationOrder';                                                       
b='SymbolMapping';                                                         
c='Binary';   
d='BitInput';

%Define modula��es
bpsk = comm.PSKModulator(2,0,b,c);                                             
opsk = comm.PSKModulator(8,0,b,c);                                         
hexqam = comm.RectangularQAMModulator(a,16,b,c);                           
ooqam = comm.RectangularQAMModulator(a,64,b,c);                            

%Plota 
constellation(bpsk);
constellation(opsk);
constellation(hexqam);
constellation(ooqam);

%Mapeia
[~,~,bpsk]=separa(array_Nb,2);
[~,~,opsk]=separa(array_Nb,8);
[~,~,hexqam]=separa(array_Nb,16);
[~,~,ooqam]=separa(array_Nb,64);

bpsk=pskmod(bpsk,2);
opsk=pskmod(opsk,8);
hexqam=qammod(hexqam,16);
ooqam=qammod(ooqam,64);

%%%%%%%%%%Quest�o 3

PlotQ3(12);
PlotQ3(120);
PlotQ3(1200);
[bpskrcosSig,qpskrcosSig,hexqamrcosSig,ooqamrcosSig, f1, rcos, array_Nb]=PlotQ3(120000);

%%%%%%%%%%Quest�o 4

%Es/N0 (dB)=10log10(Tsym/Tsamp)+SNR? (dB)   for complex input signals

sps=16;
EsN0 = 3; %dB

snr = EsN0 - 10*log10(sps);

noisySig = awgn(bpskrcosSig, snr, 'measured');

PlotFigQ4(noisySig,num2str(EsN0));

EsN0 = 10; %dB

snr = EsN0 - 10*log10(sps);

noisySig = awgn(bpskrcosSig, snr, 'measured');

PlotFigQ4(noisySig,num2str(EsN0));

%%%%%%%%%%Quest�o 5

BERBPSK = CalculaBER(array_Nb,bpskrcosSig,rcos,2,'psk');
BER8PSK = CalculaBER(array_Nb,qpskrcosSig,rcos,8,'psk');
BER16QAM = CalculaBER(array_Nb,hexqamrcosSig,rcos,16,'qam');
BER64QAM = CalculaBER(array_Nb,ooqamrcosSig,rcos,64,'qam');

PlotQ5(BERBPSK,BER8PSK,BER16QAM,BER64QAM);