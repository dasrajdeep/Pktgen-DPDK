clear;
clc

data = csvread('activep4_latency_0.csv');
slb = csvread('collision_rates.csv');

figure
ts = floor( data( : , 1) / 1E9 );
data = data( : , 2) / 1000;
yyaxis left
plot(1:size(ts, 1), data);
ylabel('Latency (us)');
%ylim([0 15]);
hold on
yyaxis right
plot(1:length(slb), slb);
ylabel('% Collisions');
ylim([0 5]);

xlabel('Time (secs)');
grid on

% data = data( : , 2);
% data = data / 1000;
% 
% cdfplot(data);
% 
% xlim([0 50]);