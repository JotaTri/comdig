function [ bpskrcosSig,f1 ] = PlotQ3( Nb )

array_Nb=rand(1,Nb);
array_Nb=array_Nb>0.5;

[~,~,bpsk]=separa(array_Nb,2);
[~,~,opsk]=separa(array_Nb,8);
[~,~,hexqam]=separa(array_Nb,16);
[~,~,ooqam]=separa(array_Nb,64);

bpsk=pskmod(bpsk,2);
opsk=pskmod(opsk,8);
hexqam=qammod(hexqam,16);
ooqam=qammod(ooqam,64);

sps = 16;

rcos = rcosdesign(0.25, 10, sps,'sqrt');
rect = [rectwin(sps)', zeros(1, 145)];

bpskrcosSig = upfirdn(bpsk, rcos, sps);
bpskrectSig = upfirdn(bpsk, rect, 16);

qpskrcosSig = upfirdn(opsk, rcos, sps);
qpskrectSig = upfirdn(opsk, rect, 16);

hexqamrcosSig = upfirdn(hexqam, rcos, sps);
hexqamrectSig = upfirdn(hexqam, rect, 16);

ooqamrcosSig = upfirdn(ooqam, rcos, sps);
ooqamrectSig = upfirdn(ooqam, rect, 16);

f1=PlotFigQ3(bpskrcosSig,' BPSK',bpskrectSig,Nb);
PlotFigQ3(qpskrcosSig,' 8-PSK',qpskrectSig,Nb);
PlotFigQ3(hexqamrcosSig,' 16-QAM',hexqamrectSig,Nb);
PlotFigQ3(ooqamrcosSig,' 64-QAM',ooqamrectSig,Nb);

end

