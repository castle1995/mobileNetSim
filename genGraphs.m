rangeTime = csvread("SpreadTestVaryRangeFixedBwV3.csv");
ranges = rangeTime(5:14,1);
st = 4;

for i = [1 : 10]
  numBlocks(i) = nnz(rangeTime(st+i, 3:end));
end
figure(1)
plot(ranges, numBlocks)
xlabel("Range of each Node (meters)");
ylabel("Number of Blocks Distributed in an Hour");
title("Number of Blocks Distributed by Range (Node BW: 1 MB/s, Channel BW: 100 KB/s)");


figure(2)
st = 4;
xaxis = [0:389];
plot(xaxis, rangeTime(st, 3:end), ...
     xaxis, rangeTime(st + 2, 3:end), ...
     xaxis, rangeTime(st + 3, 3:end), ... 
     xaxis, rangeTime(st + 4, 3:end), ...
     xaxis, rangeTime(st + 5, 3:end));
axis([0 160 0 500]);
xlabel("Number block spread through network");
ylabel("Time to Spread to 100% of Nodes");
title("Spread Time of Blocks to all Nodes based on Select Ranges");
legend("10m", "20m", "30m", "40m", "50m");

figure(3)
plot(xaxis, rangeTime(st + 6, 3:end), ...
     xaxis, rangeTime(st + 7, 3:end), ...
     xaxis, rangeTime(st + 8, 3:end), ...
     xaxis, rangeTime(st + 9, 3:end), ...
     xaxis, rangeTime(st + 10, 3:end));
axis([0 400 0 500]);
xlabel("Number block spread through network");
ylabel("Time to Spread to 100% of Nodes");
title("Spread Time of Blocks to all Nodes based on Select Ranges");
legend("60m", "70m", "80m", "90m", "100,");

% Make the graphs for the passive nodes
passive = csvread("SpreadSimPassiveResultsV1.csv");
percents = [10, 20, 30, 40, 50 ,60 ,70 ,80 ,90];
st = 4;
averages = [];
for i = [1 :9]
  row = passive(st + 1, 2:end);
  removedZeros = row(row != 0.0 | row > 100.0);
  averages(i) = mean(removedZeros);
end

figure(4);
plot(percents, averages);