# Digit recognition with CNN
Built a numeric character recognition system trained on the MNIST dataset using __Convolutional Neural Networks__.

## Architecture
I used a simple architecture based on a very popular network called the [LeNet](http://ieeexplore.ieee.org/abstract/document/726791/):

__1.__ Input - 1×28×28

__2.__ Convolution - k = 5, s = 1, p = 0, 20 filters

__3.__ ReLU

__4.__ MAXPooling - k=2, s=2, p=0

__5.__ Convolution - k = 5, s = 1, p = 0, 50 filters

__6.__ ReLU

__7.__ MAXPooling - k=2, s=2, p=0

__8.__ Fully Connected layer - 500 neurons

__9.__ ReLU

__10.__ Loss layer


