clear;
clc

data = csvread('activep4_latency_0.csv');

data = data( : , 2);
data = data / 1000;

cdfplot(data);

xlim([0 50]);