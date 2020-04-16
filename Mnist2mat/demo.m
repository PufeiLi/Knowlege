clear ;
clc;
% ѵ��������ļ���
TrainImagesName='train-images-idx3-ubyte';
TrainLabelsName='train-labels-idx1-ubyte';
TestImagesName='t10k-images-idx3-ubyte';
TestLabelsName='t10k-labels-idx1-ubyte';
%��ȡѵ��ͼƬ�����ļ�
PathName = uigetdir('','ѡ�����ݼ�·����');
TrainImagesFile = fullfile(PathName, TrainImagesName);
TrainLabelsFile = fullfile(PathName, TrainLabelsName);
TestImagesFile = fullfile(PathName, TestImagesName);
TestLabelsFile = fullfile(PathName, TestLabelsName);
%% ����ѵ��ͼƬ
fid = fopen(TrainImagesFile,'r'); 
a = fread(fid,16,'uint8'); 
%MagicNum = ((a(1)*256+a(2))*256+a(3))*256+a(4);
ImageNum = ((a(5)*256+a(6))*256+a(7))*256+a(8);
ImageRow = ((a(9)*256+a(10))*256+a(11))*256+a(12);
ImageCol = ((a(13)*256+a(14))*256+a(15))*256+a(16);
trainImages=zeros(ImageRow,ImageCol,ImageNum,'uint8');
for i=1:ImageNum
    b = fread(fid,ImageRow*ImageCol,'uint8');   
    c = reshape(b,[ImageRow ImageCol]); 
    trainImages(:,:,i)=uint8(c');
    disp(['���ڴ���ѵ��ͼƬ��������� (' , num2str(i) , '/' , num2str(ImageNum) ,')']);
end
fclose(fid);
%% �������ͼƬ
fid = fopen(TestImagesFile,'r'); 
a = fread(fid,16,'uint8'); 
%MagicNum = ((a(1)*256+a(2))*256+a(3))*256+a(4);
ImageNum = ((a(5)*256+a(6))*256+a(7))*256+a(8);
ImageRow = ((a(9)*256+a(10))*256+a(11))*256+a(12);
ImageCol = ((a(13)*256+a(14))*256+a(15))*256+a(16);
testImages=zeros(ImageRow,ImageCol,ImageNum,'uint8');
for i=1:ImageNum
    b = fread(fid,ImageRow*ImageCol,'uint8');   
    c = reshape(b,[ImageRow ImageCol]); 
    testImages(:,:,i)=uint8(c');
    disp(['���ڴ������ͼƬ��������� (' , num2str(i) , '/' , num2str(ImageNum) ,')']);
end
fclose(fid);
%% ����ѵ����ǩ
fid = fopen(TrainLabelsFile,'r'); 
a = fread(fid,8,'uint8'); 
%MagicNum = ((a(1)*256+a(2))*256+a(3))*256+a(4);
ImageNum = ((a(5)*256+a(6))*256+a(7))*256+a(8);
%trainLabels=zeros(ImageNum,1);
b = fread(fid,ImageNum,'uint8');   
trainLabels=uint8(b);
disp('ѵ����ǩ�������');
fclose(fid);
%% ������Ա�ǩ
fid = fopen(TestLabelsFile,'r'); 
a = fread(fid,8,'uint8'); 
%MagicNum = ((a(1)*256+a(2))*256+a(3))*256+a(4);
ImageNum = ((a(5)*256+a(6))*256+a(7))*256+a(8);
%testLabels=zeros(ImageNum,1);
b = fread(fid,ImageNum,'uint8');
testLabels=uint8(b);
disp('���Ա�ǩ�������' );
fclose(fid);
% ������ȡ������
save('mnist.mat','trainImages','trainLabels','testImages','testLabels')