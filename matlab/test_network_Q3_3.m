%% Q 3.3 Real-world testing
clear all
close all

%% Network defintion
layers = get_lenet();

% load the trained weights
load lenet.mat

% set the batchsize to 1 since we are only passing one image at a time
layers{1}.batch_size = 1; 

%% load the image
real_world_image = imread('Q3.3_image_1_original.jpg');


%% prepare the image before passing it to the covnet_forward function
if ndims(real_world_image)==3
    real_world_image = rgb2gray(real_world_image);
end

% resize the image from the actual size to 28x28
real_world_image = imresize(real_world_image, [28,28]);

% get the complement of the image
real_world_image = imcomplement(real_world_image); 

% make sure the image is double and between [0,1]
real_world_image = double(real_world_image/255); 

% imshow(real_world_image)

%% CNN forward pass
[output, P] = convnet_forward(params, layers, real_world_image(:));
P
