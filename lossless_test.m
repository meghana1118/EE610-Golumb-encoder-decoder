%meghana r
%data compression homework 3
%lossless_test provided b Dr pan
% use randomly generated n and m to test golomb_enco( ) and golomb_deco( )
clc
clear all
close all
total = 100000;

n = randi([0,200],1,total);
m = randi([1,100],1,total);

lossless = 1;

for i = 1: total
    x = golomb_enco(n(i), m(i));
    y = golomb_deco(x, m(i));
    if ~isequal(n(i), y)
        lossless = 0;
        error('Lossy!');
        n(i)
        m(i)
        break;
    end
end
if lossless
    disp('Lossless Test Passed!');
end