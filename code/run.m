clear all;  % close all windows 
close all; % clear all variables 
clc; % clear the 'Command Window'


addpath('code')
addpath('data')
addpath('savedParams')


inputFile = '../ContradictionVsOthers/parsed.txt';


convertStanfordParserTrees

simMat