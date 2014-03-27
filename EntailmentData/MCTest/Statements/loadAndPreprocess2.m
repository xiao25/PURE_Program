clear all; close all; clc 
% 0 : dev   
% 1 : test 
% -1: train 

decisionsAll = {}; 
hypothesisAll = {}; 
textAll = {}; 
testTrainValidation = []; 

% load mc1600x2Edev0x2Estatements
load mc5000x2Edev0x2Estatements
decisionsAll = [ decision decisionsAll ]; 
hypothesisAll = [ hypothesis hypothesisAll ]; 
textAll = [ text textAll ]; 
testTrainValidation  = zeros(size(hypothesis)); 

% load mc1600x2Etest0x2Estatements
load mc5000x2Etest0x2Estatements
decisionsAll = [ decision decisionsAll ]; 
hypothesisAll = [ hypothesis hypothesisAll ]; 
textAll = [ text textAll ]; 
testTrainValidation  = [ ones(size(hypothesis)) testTrainValidation]; 

% load mc1600x2Etrain0x2Estatements
load mc5000x2Etrain0x2Estatements
decisionsAll = [ decision decisionsAll ]; 
hypothesisAll = [ hypothesis hypothesisAll ]; 
textAll = [ text textAll ]; 
testTrainValidation  = [ -ones(size(hypothesis)) testTrainValidation]; 

for i = 1: size(hypothesisAll, 2)
    hypothesisAll2{i} = strrep(hypothesisAll{i},'&#39;', ''''); 
    hypothesisAll2{i} = strrep(hypothesisAll2{i},'&quot;', '"'); 
end 

for i = 1: size(hypothesisAll, 2)
    textAll2{i} = strrep(textAll{i},'&#39;', ''''); 
    textAll2{i} = strrep(textAll2{i},'&quot;', '"'); 
end 

%% separate texts 
sentences{1} = textAll2{1}; 
sentenceIndex(1) = 1; 
j = 2; 
for i = 2:size(textAll2,2) 
    sentenceIndex(i) = j-1; 
    if ~strcmp(sentences{j-1}, textAll2{i}); 
        sentences{j} = textAll2{i}; 
        j = j + 1; 
    end 
end

for j = 1:size(sentences, 2) 
    a = regexp(sentences{j},'(?<=[!.?])\s','split');
    sentencesSplitted{j} = a{1}; 
end 

% save( 'MC1600_all', 'decisionsAll', 'hypothesisAll2', 'textAll2' , 'testTrainValidation',  'sentencesSplitted', 'sentenceIndex', 'sentences' )
save( 'MC5000_all', 'decisionsAll', 'hypothesisAll2', 'textAll2' , 'testTrainValidation', 'sentencesSplitted', 'sentenceIndex', 'sentences')

% FID = fopen('sentences_1600.txt', 'w'); 
FID = fopen('sentences_5000.txt', 'w'); 
for j = 1:size(sentencesSplitted, 2) 
    splittedTmp = sentencesSplitted{j}; 
    for i = 1:size(splittedTmp, 2)
        fprintf(FID, '%s\n', splittedTmp{i} ); 
    end 
end