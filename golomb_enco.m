function codeword= golomb_enco (n,m)
q =floor(n/m);                   %find the quotient ,floor round to negative infinity    
r=mod(n,m);                       %compute the reminder of n/m,ceilround to positive infinity
q=ones(1,q);    %unary code
q_unary=[q 0];                    %unary code (append 0 to q no. of 1s)
[f,e]=log2(m);                    %f,e used to check if m is a power of 2
if f==0.5 && e == 1               %m=1, codeword is unary code itself
    codeword=q_unary;
   
else if f==0.5                    % m is a power of 2
        r_code=de2bi(r,log2(m),'left-msb'); %convert to binary
    else
        A=ceil(log2(m));
        B=floor(log2(m));
        
        if r < (2^A - m)                
            r_code=de2bi(r,B,'left-msb'); 
        else
            r=r+(2^A - m);
            r_code=de2bi(r,A,'left-msb'); 
        end
        
    end
        codeword=[q_unary r_code];               %golomb code of n
end
end
