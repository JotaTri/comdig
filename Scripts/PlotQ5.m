function PlotQ5( BERBPSK,BER8PSK,BER16QAM,BER64QAM )

EsNo=0:3:30;

berbpsk = berawgn(EsNo-10*log10(log2(2)),'psk',2,'nondiff');
ber8psk = berawgn(EsNo-10*log10(log2(8)),'psk',8,'nondiff');
ber16qam = berawgn(EsNo-10*log10(log2(16)),'qam',16);
ber64qam = berawgn(EsNo-10*log10(log2(64)),'qam',64);

PlotFigQ5('BER t�orico e simulado da bpsk','Te�rica','Simulado',berbpsk,BERBPSK);
PlotFigQ5('BER t�orico e simulado da 8-psk','Te�rica','Simulado',ber8psk,BER8PSK);
PlotFigQ5('BER t�orico e simulado da 16-qam','Te�rica','Simulado',ber16qam,BER16QAM);
PlotFigQ5('BER t�orico e simulado da 64-qam','Te�rica','Simulado',ber64qam,BER64QAM);

figure();
semilogy(EsNo,berbpsk,'--');
hold on
semilogy(EsNo,BERBPSK);
semilogy(EsNo,ber8psk,'--');
semilogy(EsNo,BER8PSK);
semilogy(EsNo,ber16qam,'--');
semilogy(EsNo,BER16QAM);
semilogy(EsNo,ber64qam,'--');
semilogy(EsNo,BER64QAM);
title('Compara��o BERs para cada modula��o');
grid
legend('BPSK Te�rico','BPSK Simulado','8-PSK Te�rico','8-PSK Simulado','16-QAM Te�rico','16-QAM Simulado','64-QAM Te�rico','64-QAM Simulado');
xlabel('E_s/N_0 (dB)')
ylabel('Bit Error Rate')
ylim([10^-200,10^10])

end