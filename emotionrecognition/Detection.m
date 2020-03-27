clc;
clear all;

% reading multi image from the folder
total_images = 5;

% defining arr  ay
rectanglesize = zeros(total_images,4);
matrixsize= total_images*4;
x = zeros(total_images,276*121);

% detecting mouth and face using voila jones algorithm
for n = 1:total_images

% face detection 
         
         full_name=strcat('C:\Program Files\MATLAB\R2018a\bin\project\database\',num2str(n),'.jpg');
         I = imread(full_name);
         I1 = rgb2gray(I);
         faceDetector = vision.CascadeObjectDetector;
         bboxes = step(faceDetector,I1);
         %IFaces = insertObjectAnnotation(I1,'rectangle',bboxes,'Face');
         facerectangle(n,:) = bboxes(1,:);
         I1 = imcrop( I1,facerectangle(n,:));
         I1 = imresize(I1,[450,500]);
                  
% mouth detection
         I2 = imcrop(I1,[145 300 275 120]);   % cropping and resizing mouth
         I2t = I2';
         onedt = I2t(:);                % making 1d matrix of the detected face (parameter matrix)
         x(n,:) = onedt';
        figure;
          subplot(2,1,1)
          imshow(I1), title(full_name);
         subplot(2,1,2)
          imshow(I2), title(full_name); 
end

 %y matrix
yt=zeros(1,total_images);
for i=1:50
    yt(i)=1;
end
for i=51:100
    yt(i)=2;
end
for i=101:total_images
    yt(i)=3;
end

y=yt';


K=randperm(total_images);
database=[x y];
for i=1:total_images
       randomdata(i,:)=database(K(i),:);
end

X_random = randomdata(:,1:end-1);
Y_random = randomdata(:,end);

T = zeros(total_images,3);
for i = 1:total_images
   T(i,Y_random(i))=1; 
end