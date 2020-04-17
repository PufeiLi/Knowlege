


function [PredFinal] = bayesFusion(all_Pred,all_ConfuMatrix)
% BAYESFUSION �˴���ʾ�йش˺�����ժҪ
% all_PredΪÿ�ַ���Ԥ��ı�ǩ��all_ConfuMatrixΪÿ�ַ����Ļ�������;
% PredFinal	Ϊ�����ںϺ�ı�ǩ;

N_class = length(all_ConfuMatrix(:,1));   %�����
N_classifiers = length(all_ConfuMatrix(1,:))/length(all_ConfuMatrix(:,1));   %������������
N_test = length(all_Pred(:,1));     %��������������

all_LM =all_ConfuMatrix ./ repmat(sum(all_ConfuMatrix,1),N_class,1);  %�õ������׼ȷ��
index=repmat(0:N_class:(N_classifiers-1)*N_class,N_test,1);
index=index'+all_Pred';
D=all_LM (:,index);                        %��ȡ���ַ���ÿһ���Ԥ��׼ȷ��
mu_elements=reshape(D,N_class,N_classifiers,N_test);
mu=prod(mu_elements,2);
[~, Ensemble_decision]=max(mu);
Ensemble_decision=reshape(Ensemble_decision,1,N_test);

PredFinal=Ensemble_decision';




end

