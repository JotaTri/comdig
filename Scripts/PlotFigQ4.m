function PlotFigQ4( Plotar,db )

figure();
noisysig = fftshift(pwelch(Plotar));
f = -1:2/(length(noisysig)-1):1;
plot(f,10*log10(noisysig));
title(strcat('Modulação BPSK, Es/N0=', db, ' db'));
grid
legend('Sinal ruidoso')
xlabel('Frequência Normalizada')
ylabel('Amplitude')

end

