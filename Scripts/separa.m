function [ v2, str, dec ] = separa( v1,M )
    v2=[];
    a=1;
    while(a<=length(v1))
        v2=[v2;v1(a:a+log2(M)-1)];
        a=a+log2(M);
    end
    str=num2str(v2);
    dec=bin2dec(str);
end