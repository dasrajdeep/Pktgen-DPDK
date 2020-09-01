clear
clc

SAMPLES_PER_SEC = 1000;
EXP_DURATION_SECS = 10;
TOTAL_SAMPLES = SAMPLES_PER_SEC * EXP_DURATION_SECS;
NUM_FIDS = 4;

% ds = zeros(TOTAL_SAMPLES * NUM_FIDS, 3);
% min_ts = 0;
% for i = 1:NUM_FIDS
%     data = csvread(sprintf('activep4_latency_%d.csv', i - 1));
%     ts = floor( data( : , 1) / 1E9 );
%     data = data( : , 2) / 1000;
%     ds( (i - 1) * TOTAL_SAMPLES + 1 : i * TOTAL_SAMPLES, 1 ) = ts;
%     ds( (i - 1) * TOTAL_SAMPLES + 1 : i * TOTAL_SAMPLES, 2 ) = data;
%     ds( (i - 1) * TOTAL_SAMPLES + 1 : i * TOTAL_SAMPLES, 3 ) = i;
%     if min_ts == 0
%         min_ts = min(ts);
%     else
%         min_ts = min([ min_ts; ts ]);
%     end
% end
% 
% ds( : , 1) = ds( : , 1) - min_ts;
% max_ts = max( ds( : , 1) );
% 
% plot_data = zeros(max_ts + 1, NUM_FIDS);
% 
% for i = 1:NUM_FIDS
%     ts = ds( (i - 1) * TOTAL_SAMPLES + 1 : i * TOTAL_SAMPLES, 1 );
%     data = ds( (i - 1) * TOTAL_SAMPLES + 1 : i * TOTAL_SAMPLES, 2 );
%     for t = 0:max_ts
%         I = find(ts == t);
%         Y = data(I);
%         plot_data(t + 1, i) = median( Y );
%     end
% end

plot_data = 0;
for i = 1:NUM_FIDS
    data = csvread(sprintf('activep4_latency_%d.csv', i - 1));
    ts = floor( data( : , 1) / 1E9 );
    data = data( : , 2) / 1000;
    if plot_data == 0
        plot_data = zeros(size(ts, 1), NUM_FIDS);
    end
    for t = 1:size(ts, 1)
        plot_data(t, i) = data(t);
    end
end

figure
area(plot_data);
xlabel('Time (seconds)');
ylabel('Latency (us)');
legend(cellstr(num2str([1:4]', ' FID=%-d '))');