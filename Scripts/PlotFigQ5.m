function PlotFigQ5( str0,str1,str2,ber,BER )

EbNo=0:3:30;

figure();
semilogy(EbNo,ber,'--');
hold on
semilogy(EbNo,BER);
title(str0);
grid
legend(str1,str2)
xlabel('E_s/N_0 (dB)')
ylabel('Bit Error Rate')

end

