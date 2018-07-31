function n_rec = golomb_deco (codeword, m)
%   Function n_rec = golomb_deco (codeword, m)
%   golomb_deco decodes the input golomb codeword using parameter m;
%   Input: The codeword (1-D vector) for a non-negative integer n;
%          m is the coding parameter.
%   Output: n_rec is the reconstructed symbol.
%   Example: n_rec = golomb_deco([0 1 0], 5)

len = length(codeword);

% Count the number of 1's followed by the first 0
q = 0;
for i = 1: len
    if codeword(i) == 1
        q = q + 1;
    else
        ptr = i;   % first 0
        break;
    end
end

if (m == 1)
    n_rec = q;   % special case for m = 1
else
    A = ceil(log2(m));
    B = floor(log2(m));

    bcode = codeword((ptr+1): (ptr + B));
    r = bi2de(bcode,'left-msb');
    if r < (2^A - m)
        ptr = ptr + B;
    else
        % r is A-bit represtation of (r + (2^A - m))
        bcode = codeword((ptr+1): (ptr + A));
        r = bi2de(bcode,'left-msb') - (2^A - m);
        ptr = ptr + A;
    end
    n_rec = q * m + r;
end

if ~isequal(ptr, len)
    error('Error: More than one codeword detected!');
end

    




