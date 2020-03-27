clc;
clear all;

% reading multi image from the folder
 faceDatabase=imageSet('C:\Program Files\MATLAB\R2018a\bin\project\database\','recursive');


% defining arr  ay
rectanglesize = zeros(1,4);
matrixsize= 1*4;
x = zeros(1,276*121);

% detecting mouth and face using voila jones algorithm

% face detection 
         I = imread('C:\9.jpg');
         I1 = rgb2gray(I);
         faceDetector = vision.CascadeObjectDetector;
         bboxes = step(faceDetector,I1);
         %IFaces = insertObjectAnnotation(I1,'rectangle',bboxes,'Face');
         facerectangle(1,:) = bboxes(1,:);
         I1 = imcrop( I1,facerectangle(1,:));
         I1 = imresize(I1,[450,500]);
                  
% mouth detection
         I2 = imcrop(I1,[145 300 275 120]);   % cropping and resizing mouth
         I2t = I2';
         onedt = I2t(:);                % making 1d matrix of the detected face (parameter matrix)
         xtest(1,:) = onedt';
         X=double(xtest);
         
         [Y] =abc(X);
         [m,i] = max(Y);
         display(Y);
         display(i);
