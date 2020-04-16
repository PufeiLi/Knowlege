function labels = readMNISTLabels(filename)
%
%���ܣ���ȡMNIST���ݼ��еı�ǩ
%
%Input��
%filename - �ļ���
%
%Output��
%labels - ��ȡ�ı�ǩ��1*��ǩ����
fid = fopen(filename,'r');
 
%��ȡǰ���ֽ�
magic = fread(fid,1,'int32',0,'ieee-be');
%��
% magic = fread(fid,4);
% magic = ((magic(1)*256 + magic(2))*256+magic(3))*256 + magic(4);
numLabels = fread(fid,1,'int32',0,'ieee-be');
 
%��ȡ��ǩ
labels = fread(fid,Inf,'unsigned char');
labels = labels';
fclose(fid);
end

