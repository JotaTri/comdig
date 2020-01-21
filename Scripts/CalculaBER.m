function [ BER ] = CalculaBER( array_Nb,Sig,rcos,M,mod )
BER=zeros(1,10);
EsN0 = 0; %dB
sps=16;
rcvFilter = fliplr(rcos);

while(EsN0<=30)
snr = EsN0 - 10*log10(sps);

noisySig = awgn(Sig, snr, 'measured');

rcvSig = upfirdn(noisySig, rcvFilter, 1, 16);
rcvSig = rcvSig(11:end-10);

scatterplot(rcvSig);
title(strcat(num2str(M),mod,' E_s/N_0=',num2str(EsN0)))

if(strcmp(mod,'psk'))
    rcv_data = pskdemod(rcvSig,M);
else
    rcv_data = qamdemod(rcvSig,M);
end

rcv_data1 = rcv_data';
rcv_data2=dec2bin(rcv_data1);
rcv_data3=reshape(rcv_data2',1,[]);
rcv_data4 = rcv_data3=='1';

rcv_data=rcv_data4;
Temp = rcv_data == array_Nb;
Temp = (length(Temp) - sum(Temp))/length(Temp);
BER(EsN0/3+1)=Temp;
EsN0=EsN0+3;
end
end

