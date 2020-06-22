%% Network defintion
layers = get_lenet();

%% Loading data
fullset = false;
[xtrain, ytrain, xvalidate, yvalidate, xtest, ytest] = load_mnist(fullset);

% load the trained weights
load lenet.mat

%% Testing the network
% Modify the code to get the confusion matrix
% imshow(reshape(xtest(:,1), [28,28])')

class = zeros(10,10);

for i=1:100:size(xtest, 2)
    [output, P] = convnet_forward(params, layers, xtest(:, i:i+99));

    [~,idx] = max(P); 
    prediction_labels = idx;
    test_labels = ytest(:,i:i+99);
    for j=1:length(idx)
       class(test_labels(j),prediction_labels(j)) =  class(test_labels(j),prediction_labels(j)) + 1;
    end
    
end

%% Compute the accuracy
accuracy = trace(class) / sum(class(:)); %  #correct/#total
fprintf('Accuracy: %.2f%% \n',accuracy*100);
disp(class);
