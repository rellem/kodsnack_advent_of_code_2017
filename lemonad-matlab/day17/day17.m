%
% Day 17, Advent of code 2017 (Jonas Nockert / @lemonad)
%

steps = 3;
% steps = 382;
N = 8;

buffer_len = N;
index = 0;
tracking_index = 0;
before = [];
after = [];
for i = N-1:-1:0
    index = mod(index - steps - 1, buffer_len);
    if index <= tracking_index
        tracking_index = tracking_index + 1;
        before = [i, before];
    elseif index == tracking_index + 1
        i
        break
    else
        after = [i, after];
    end
    buffer_len = buffer_len - 1;
end
before
after
disp('end')

return




N = 50000000;

buffer_len = 1;  % Buffer contains only element 0 from start.
index = 1;
zero_index = 0;
after_zero = 0;

% Note: Since we're not actually creating a buffer, use
% 0-based indexing.
for i = 0:N-1
    index = mod(index + steps + 1, buffer_len);
        zero_index = zero_index + 1;
    if index == zero_index
        % New number is inserted immediately after the
        % zero element.
        after_zero = i + 1;
    end
    buffer_len = buffer_len + 1;
end

disp(after_zero)

return



buffer = [0];
index = 0;

for i = 1:2017
    [buffer, index] = stepForward(buffer, index, steps);
end

index_2017 = find(buffer == 2017);
buffer(index_2017 + 1)



buffer = [0];
index = 0;

for i = 1:50000000
    if mod(i, 100000) == 0
        fprintf('i = %d\n', i);
    end
    [buffer, index] = stepForward(buffer, index, steps);
end

index_0 = find(buffer == 0)
buffer(index_2017 + 1)


return


function [buffer, index] = stepForward(buffer, index, steps)
    N = length(buffer);
    index = mod(index + steps + 1, N);
    buffer = [buffer(1:index + 1), max(buffer) + 1, buffer(index + 2:end)];
end