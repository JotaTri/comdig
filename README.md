# Trabalho Final de Comunicações Digitais

Este repositório comtem os códigos e o relatório referente a um experimento de simulação e geração de um transmissor digital em um canal com ruído branco Gaussiano em Matlab.

Para isso:

- criou-se um um array de números binários
- criou-se um mapa para modulações BPSK, 8-PSK, 16-QAM e 64-QAM
- filtrou-se as sequências de símbolos para cada modulação em um filtro de pulso de Nyquist e um pulso retangular
- criou-se o ruído Gaussiano com 3dB e 10dB
- aplicou-se o ruído Gaussiano e verificou-se a amostragem nas diferentes modulações

A partir disso, comparou-se os resultados obtidos e comparados com o valor teórico para taxa de erro para diferentes taxas de ruído Gaussiano para cada modulação aplicada.

O relatório final desse trabalho se encontra na raiz desse repositório com o nome [Relatorio_Final_de_ComDig.pdf](Relatorio_Final_de_ComDig.pdf).
