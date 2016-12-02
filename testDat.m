function testDat
dbstop if error
dataDir='/home/pboord/Downloads/kaggle/musp/data';
trainDir=fullfile(dataDir,'train_1');
trainFiles=dir(fullfile(trainDir,'*.mat'));
trainFiles={trainFiles.name}';
load(fullfile(trainDir,trainFiles{1}),'dataStruct');
[iiPsd,f]=pwelch(detrend(dataStruct.data),[],[],[],dataStruct.iEEGsamplingRate);
load(fullfile(trainDir,trainFiles{36}),'dataStruct');
[piPsd,f]=pwelch(detrend(dataStruct.data),[],[],[],dataStruct.iEEGsamplingRate);
figure
xl=1:5000;
yl=[0,min(max([iiPsd(:),piPsd(:)]))];
subplot(2,1,1);plot(f(xl),iiPsd(xl,:));ylim(yl);
subplot(2,1,2);plot(f(xl),piPsd(xl,:));ylim(yl);
end