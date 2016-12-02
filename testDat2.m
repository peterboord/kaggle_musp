function allOkLen=testDat2
dbstop if error
dataDir='/home/pboord/Downloads/kaggle/musp/data';
trainDir=fullfile(dataDir,'train_1');
trainFiles=dir(fullfile(trainDir,'*.mat'));
trainFiles={trainFiles.name}';
nrTrainFiles=numel(trainFiles);
allOkLen=cell(nrTrainFiles,1);
for fileNr=1:nrTrainFiles
    tic
    load(fullfile(trainDir,trainFiles{fileNr}),'dataStruct');
    diffGoodSamples=diff([0;~all(dataStruct.data==0,2);0]);
    okStart=find(diffGoodSamples>0);
    okEnd=find(diffGoodSamples<0)-1;
    %okLen=okEnd-okStart+1;
    allOkLen{fileNr}=[okStart,okEnd];
    disp((numel(trainFiles)-fileNr)*toc);
end
end