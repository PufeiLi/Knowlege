
clc;
clear;

load('pca_pred.mat');
load('lda_pred.mat');
load('lpp_pred.mat');

load('pca_cm.mat');
load('lda_cm.mat');
load('lpp_cm.mat');
%pred��Ԥ��ı�ǩ��cm�ǻ�������

allpred =[pca_pre lda_pre lpp_pre];
allcm = [CM_pca CM_lda CM_lpp ];

[bayesPred] = bayesFusion(allpred,allcm);%��Ҷ˹�ں�





