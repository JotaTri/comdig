function f=PlotFigQ3(Sinalrcos,Modulacao,Sinalrect,Nb)

figure();
signalrcosft = fftshift(pwelch(Sinalrcos));
signalrectft = fftshift(pwelch(Sinalrect));
f = -1:2/(length(signalrcosft)-1):1;
plot(f,10*log10(signalrcosft));
title(strcat('Modulação', Modulacao, ' Nb=',num2str(Nb)));
hold on;
plot(f,10*log10(signalrectft));
grid
legend('Cosseno Levantado','Pulso Retangular')
xlabel('Frequência Normalizada')
ylabel('Amplitude')

end

