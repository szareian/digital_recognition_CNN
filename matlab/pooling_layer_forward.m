function [output] = pooling_layer_forward(input, layer)

    h_in = input.height;
    w_in = input.width;
    c = input.channel;
    batch_size = input.batch_size;
    k = layer.k;
    pad = layer.pad;
    stride = layer.stride;
    
    h_out = (h_in + 2*pad - k) / stride + 1;
    w_out = (w_in + 2*pad - k) / stride + 1;
    
    
    output.height = h_out;
    output.width = w_out;
    output.channel = c;
    output.batch_size = batch_size;

    % Replace the following line with your implementation.
    output.data = zeros([h_out * w_out * c, batch_size]);

    data = reshape(input.data(:,:),h_in,w_in,c,batch_size);

    indexRow = 1:stride:input.height;
    indexCol = 1:stride:input.width;


    for  j = 1:size(indexRow,2)
        for i = 1:size(indexCol,2)
            filter =  (data(indexRow(j):indexRow(j) + k-1,indexCol(i):indexCol(i) + k-1,:,:));
            maxVal(j,i,:,:) = max(max(filter,[],1),[],2);

        end
    end

    out = reshape(maxVal,h_out * w_out * c, batch_size);
    output.data = out;
end

