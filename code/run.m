clear all;  % close all windows 
close all; % clear all variables 
clc; % clear the 'Command Window'

dataFolder = 'ContradictionVsOthers/'; 
% dataFolder = 'EntailmentVsOthers/'; 
% dataFolder = 'NeutralVsOthers/'; 
% dataFolder = 'SimilarityMeasure/'; 

inputFile = ['../EntailmentData/' dataFolder  'parsed.txt'];

convertStanfordParserTrees

simMat
