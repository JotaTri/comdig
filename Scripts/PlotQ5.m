function PlotQ5( BERBPSK,BER8PSK,BER16QAM,BER64QAM )

EsNo=0:3:30;

berbpsk = berawgn(EsNo-10*log10(log2(2)),'psk',2,'nondiff');
ber8psk = berawgn(EsNo-10*log10(log2(8)),'psk',8,'nondiff');
ber16qam = berawgn(EsNo-10*log10(log2(16)),'qam',16);
ber64qam = berawgn(EsNo-10*log10(log2(64)),'qam',64);

PlotFigQ5('BER téorico e simulado da bpsk','Teórica','Simulado',berbpsk,BERBPSK);
PlotFigQ5('BER téorico e simulado da 8-psk','Teórica','Simulado',ber8psk,BER8PSK);
PlotFigQ5('BER téorico e simulado da 16-qam','Teórica','Simulado',ber16qam,BER16QAM);
PlotFigQ5('BER téorico e simulado da 64-qam','Teórica','Simulado',ber64qam,BER64QAM);

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
title('Comparação BERs para cada modulação');
grid
legend('BPSK Teórico','BPSK Simulado','8-PSK Teórico','8-PSK Simulado','16-QAM Teórico','16-QAM Simulado','64-QAM Teórico','64-QAM Simulado');
xlabel('E_s/N_0 (dB)')
ylabel('Bit Error Rate')
ylim([10^-200,10^10])

end