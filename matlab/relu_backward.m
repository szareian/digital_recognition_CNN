function [input_od] = relu_backward(output, input, layer)

% Replace the following line with your implementation.
input_od = zeros(size(input.data));

input_od(output.data>0) = output.diff(output.data>0);

end
