
% MNIST���ݿ��ȡ
 clc;clear;close all;
%��ȡMNIST���ݼ��е�ͼƬ
train_images = readMNISTImages('train-images-idx3-ubyte'); %60000��ѵ����,��СΪ28*28*60000
test_images =  readMNISTImages('t10k-images-idx3-ubyte');  %10000��ѵ����,��СΪ28*28*10000
 
%��ȡMNIST���ݼ��еı�ǩ
train_labels1 = readMNISTLabels('train-labels-idx1-ubyte');%��ǩ0~9��60000����ǩ����СΪ60000*1
test_labels1 = readMNISTLabels('t10k-labels-idx1-ubyte'); %10000����ǩ����СΪ10000*1