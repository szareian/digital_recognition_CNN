function [output] = conv_layer_forward(input, layer, param)
% Conv layer forward
% input: struct with input data
% layer: convolution layer struct
% param: weights for the convolution layer

% output: 

% get parameters
h_in = input.height;
w_in = input.width;
c = input.channel;
batch_size = input.batch_size;
k = layer.k;
pad = layer.pad;
stride = layer.stride;
num = layer.num;

% resolve output shape
h_out = (h_in + 2*pad - k) / stride + 1;
w_out = (w_in + 2*pad - k) / stride + 1;

assert(h_out == floor(h_out), 'h_out is not integer')
assert(w_out == floor(w_out), 'w_out is not integer')

input_n.height = h_in;
input_n.width = w_in;
input_n.channel = c;

%% Iterate over the each image in the batch, compute response

for n = 1:batch_size
    input_n.data = input.data(:, n);
    
    col = im2col_conv(input_n, layer, h_out, w_out);
    col = reshape(col, k*k*c, h_out*w_out);
    
    weight = param.w(:, 1:num);
    bias = param.b(:, 1:num);
    
%     inner product
    response(:, 1:num) = bsxfun(@plus, col'*weight, bias);

    output.data(:, n) = response(:);
    clear response;
end

%  output shape
output.height = h_out;
output.width = w_out;
output.channel = num;
output.batch_size = batch_size;

end

